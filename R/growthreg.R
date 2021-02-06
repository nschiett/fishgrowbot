#' A function to extract von Bertalanffy growth parameters for fishes from
#' back-calculated data
#'
#' @author Nina M. D. Schiettekatte
#' @param length \code{\link[base]{numeric}} vector with length
#' (CAUTION: must be in cm).
#' @param age \code{\link[base]{numeric}} vector with age.
#' @param id \code{\link[base]{character}} vector with fish ID.
#' @param linf_m Prior for parameter linf, . (in cm)
#' @param linf_sd Prior sd for linf, asymptotic length (default set to 10% of linf_m).
#' @param l0_m Prior for l0, size at hatching. (in cm)
#' @param l0_sd Prior sd for l0 (default set to 10% of l0_m).
#' @param lmax Maximum size. Based on this value, maximum growth rate kmax
#' will be computed.
#' @param plot \code{\link[base]{logical}} Option to plot model fit. Defaults
#' to TRUE.
#' @param ... Additional arguments to \code{\link[rstan]{sampling}}.
#' @details Returns a list with three elements.
#' The first element is a \code{\link[base]{data.frame}} with estimates for
#' \code{linf}, \code{k} and \code{t0}, \code{sl} and \code{gp}.
#' There is a hierarchical structure for \code{linf} and \code{k}, so that
#' there is a unique estimate for these parameters per individual
#' (\code{linf_j}, \code{k_j}).
#' \code{linf} and \code{k} are the population level estimates of \code{linf}
#' and \code{k}. \code{kmax} is the standardised growth parameter, depending
#' on \code{lmax} (kmax = exp(sl * log(lmax) + gp), see Morais and Bellwood
#' (2018) for details.
#' The second element is a \code{\link[base]{data.frame}} with model fits for
#' the average regression across individuals (\code{ypred_m}, \code{ypred_sd},
#' \code{ypred_lb}, \code{ypred_ub}), and the fitted regression er individual
#' (\code{yrep_m}, \code{yrep_sd}, \code{yrep_lb}, \code{yrep_ub}).
#' The third element is the entire stanfit object.
#'
#' @importFrom ggplot2 ggplot geom_point aes geom_ribbon geom_line theme_bw
#' @importFrom rstan sampling extract summary
#' @importFrom stats quantile sd
#'
#' @examples
#'
#'\dontrun{
#' library(dplyr)
#' library(fishgrowbot)
#' data(coral_reef_fishes_data)
#' em <- filter(coral_reef_fishes_data,
#'              species == "Epinephelus merra",
#'              location == "Moorea")
#' bc <- bcalc(data = em)$lengths
#' growthreg(length = bc$l_m/10, age = bc$age, id = bc$id, lmax = 32,
#'           linf_m = 28, linf_sd = 5, l0_m = 0.15, l0_sd = 0.015,
#'           iter = 4000, chains = 1)
#'}
#' @export
growthreg <- function(length, age, id, lmax, linf_m = 0.8 * lmax,
                      linf_sd = 0.2 * linf_m, l0_m, l0_sd = 0.2 * l0,
                      plot = TRUE, ...) {
  qt_fct <- function(x, target) {
    apply(x, 2, quantile, target)
  }
  l0 <- NULL
  data <- list(N = length(length), N_1 = length(unique(id)), y = length,
               x = age, J = as.integer(as.factor(as.character(id))),
               linf_prior = linf_m, linf_sd = linf_sd, l0_prior = l0_m,
               l0_sd = l0_sd, lmax = lmax, X = rep(1, length(length)))
  fit <- sampling(stanmodels$vonbert, data = data, ...)
  summary <-  as.data.frame(summary(fit)$summary)
  result <- summary[c("k", "linf", "l0", "t0", "kmax"), 1:8]
  ee <- extract(fit)
  y_m <- ee$y_m
  y_rep <- ee$y_rep
  pred <- data.frame(
    id = id, age = age, ypred_m = colMeans(y_m), ypred_lb = qt_fct(y_m, 0.025),
    ypred_ub = qt_fct(y_m, 0.975), yrep_m = colMeans(y_rep),
    yrep_lb = qt_fct(y_rep, 0.025), yrep_ub = qt_fct(y_rep, 0.975)
  )
  if (plot) {
    p <- ggplot() +
      geom_point(aes(x = .data$age, y = .data$length)) +
      geom_ribbon(aes(x = .data$age, ymin = .data$ypred_lb,
                      ymax = .data$ypred_ub), alpha = 0.4, data = pred) +
      geom_line(aes(x = .data$age, y = .data$ypred_m), data = pred) +
      theme_bw()
    print(p)
  }
  list(summary = result, fitted = pred, stanfit = fit)
}
