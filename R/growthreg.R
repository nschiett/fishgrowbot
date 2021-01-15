#' A function to extract Von Bertalanffy growth parameters for fishes from back-calculated data
#'
#' @author Nina M. D. Schiettekatte
#' @param length  Numerical vector with length (CAUTION: must be in cm)
#' @param age     Numerical vector with age
#' @param id      Character vector with fish id
#' @param linf_m  Prior for linf
#' @param linf_sd Prior sd for linf (default set to 10\% of linf_m)
#' @param l0_m    Prior for l0
#' @param l0_sd   Prior sd for l0 (default set to 10\% of l0_m)
#' @param lmax    maximum size. Based on this value, maximum growth rate kmax will be computed.
#' @param plot    option to plot model fit (TRUE or FALSE)
#' @param ...     Additional arguments, see ?rstan::sampling()
#' @details Returns a list with three elements.
#' First element is a dataframe with estimates for linf, k and t0, sl and gp.
#' There is a hierarchical structure for linf and k, so that there is a unique estimate for these parameters per individual (linf_j, k_j).
#' linf and k are the population level estimates of linf and k. kmax is the standardised growth parameter, depending on lmax
#' (kmax = exp(sl * log(lmax) + gp), see Morais and Bellwood (2018) for details)
#' Second element is a dataframe with model fits for the average regression across individuals (ypred_m, ypred_sd, ypred_lb, ypred_ub),
#' and the fitted regression er individual (yrep_m, yrep_sd, yrep_lb, yrep_ub)
#' The third element is the entire stanfit object.
#'
#' @import ggplot2
#' @import dplyr
#' @import rstan
#' @importFrom stats quantile sd
#'
#' @export growthreg
#'
#' @examples
#'
#'\dontrun{
#' em <- dplyr::filter(fishgrowbot::coral_reef_fishes_data,
#' species == "Epinephelus merra", location == "Moorea")
#' bc <- fishgrowbot::bcalc(data = em)$lengths
#' fishgrowbot::growthreg(length = bc$l_m/10, age = bc$age,
#' id = bc$id, lmax = 32, linf_m = 28, linf_sd = 5, l0_m = 0.15, l0_sd = 0.015,
#' iter = 4000, chains = 1)
#'}

growthreg <- function(length, age, id, lmax, linf_m = 0.8*lmax,
                      linf_sd = 0.2*linf_m, l0_m, l0_sd = 0.2*l0,
                      plot = TRUE, ...){

  requireNamespace("ggplot2")
  requireNamespace("rstan")

  l0 <- NULL

  data <- list(
    N = length(length),
    N_1 = length(unique(id)),
    y = length,
    x = age,
    J = as.integer(as.factor(as.character(id))),
    linf_prior = linf_m,
    linf_sd = linf_sd,
    l0_prior = l0_m,
    l0_sd = l0_sd,
    lmax = lmax,
    X = rep(1, length(length))
  )

  fit <- rstan::sampling(stanmodels$vonbert, data = data, ...)

  summary <-  as.data.frame(rstan::summary(fit)$summary)

  result <- summary[c("k", "linf", "l0", "t0", "kmax"),1:8]

  ee <- rstan::extract(fit)
  y_m <- ee$y_m
  y_rep <- ee$y_rep
  pred <- data.frame(
    id = id,
    age = age,
    ypred_m = apply(y_m,2,mean),
    ypred_lb = apply(y_m,2,quantile, 0.025),
    ypred_ub = apply(y_m,2,quantile, 0.975),
    yrep_m = apply(y_rep,2,mean),
    yrep_lb = apply(y_rep,2,quantile, 0.025),
    yrep_ub = apply(y_rep,2,quantile, 0.975)
  )

  if(plot){
    p <-
      ggplot() +
      geom_point(aes(x = .data$age, y = .data$length)) +
      geom_ribbon(aes(x = .data$age, ymin = .data$ypred_lb, ymax = .data$ypred_ub),
                  alpha = 0.4, data = pred) +
      geom_line(aes(x = .data$age, y = .data$ypred_m), data = pred) +
      theme_bw()

    print(p)
  }
  return(list(summary = result, fitted = pred, stanfit = fit))

}
