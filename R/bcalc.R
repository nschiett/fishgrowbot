#' Run back-calculation in Bayesian framework
#'
#' @author Nina M. D. Schiettekatte
#' @param data \code{\link[base]{data.frame}} containing results from otolith
#' reading plus information on the length of hatching (column \code{l0p}) of a
#' certain species. Data should contain:
#' \itemize{
#'     \item id: unique fish id per individual.
#'     \item radi: measurements of otolith growth rings (in mm).
#'     \item agei: age estimation of fish.
#'     \item lencap: length at capture (in mm).
#'     \item radcap: radius of otolith at capture (in mm).
#'     \item l0p: length of fish at hatching (in mm).
#' }
#' @param ... arguments to add to \code{\link[rstan]{sampling}}.
#' @details  Returns a list of model fit and a dataset called lengths with
#' the estimated lengths at age:
#' \itemize{
#'     \item l_m: mean length in mm.
#'     \item l_sd: sd of length.
#'     \item l_lb: lower 95% CI quantile.
#'     \item l_ub: upper 95% CI quantile.
#' }
#'
#' Input data should include radi at age 0 measurements as well,
#' but can handle missing data (NA) for the cases where it is not possible to
#' measure the radius at hatching.
#' @importFrom dplyr filter
#' @importFrom rstan sampling extract
#' @export
bcalc <- function(data, ...) {
  agecap <- sd <- quantile <- NULL
  if (1 %in% data$agecap) {
    data <- filter(data, agecap > 1)
    message("Removing individuals of age 1")
  }
  data <- as.data.frame(data)
  required_names <- c("radi", "agei", "radcap", "lencap", "id", "l0p")
  if (!all(required_names %in% colnames(data))) {
    message("data not in correct format; please check ?bcalc")
    return(NA)
  }
  if (length(which(!is.na(data[data$agei == 0, "radi"]))) < 2) {
    message("At least 2 known measurements of r0p are needed")
    return(NA)
  } else {
    missing <- which(is.na(data[data$agei == 0, "radi"]))
    missing2 <- which(is.na(data$radi))
    if (length(missing) == 1) {
      missing <- array(missing, dim = 1)
    }
    if (length(missing2) == 1) {
      missing2 <- array(missing2, dim = 1)
    }
    sdata <- list(
      N = nrow(data),
      Ni = length(unique(data[data$agei == 1, ]$id)),
      N_mis = nrow(data[data$agei == 0 & is.na(data$radi), ]),
      missing = missing,
      known = which(!is.na(data[data$agei == 0, "radi"])),
      missing2 = missing2,
      known2 = which(!is.na(data$radi)),
      id = as.integer(as.factor(as.character(data$id))),
      r = data[!is.na(data$radi), "radi"],
      rcap = (data[data$agei == 1, ]$radcap),
      lcap = (data[data$agei == 1, ]$lencap),
      l0p = unique(data$l0p),
      r0p = data[data$agei == 0  & !is.na(data$radi), "radi"]
    )
    fit <- suppressWarnings(sampling(stanmodels$stan_bcalc, sdata,
                                     chains = 4, ...))
    ll <- extract(fit, "l")[[1]]
    lengths <- data.frame(id = data$id, age = data$agei,
                          l_m = apply(ll, 2, mean), l_sd = apply(ll, 2, sd),
                          l_lb = apply(ll, 2, quantile, 0.025),
                          l_ub = apply(ll, 2, quantile, 0.975))
    list(fit = fit, lengths = lengths)
  }
}
