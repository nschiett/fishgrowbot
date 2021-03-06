% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bcalc.R
\name{bcalc}
\alias{bcalc}
\title{Run back-calculation in Bayesian framework}
\usage{
bcalc(data, ...)
}
\arguments{
\item{data}{\code{\link[base]{data.frame}} containing results from otolith
reading plus information on the length of hatching (column \code{l0p}) of a
certain species. Data should contain:
\itemize{
\item id: unique fish id per individual.
\item radi: measurements of otolith growth rings (in mm).
\item agei: age estimation of fish.
\item lencap: length at capture (in mm).
\item radcap: radius of otolith at capture (in mm).
\item l0p: length of fish at hatching (in mm).
}}

\item{...}{arguments to add to \code{\link[rstan]{sampling}}.}
}
\description{
Run back-calculation in Bayesian framework
}
\details{
Returns a list of model fit and a dataset called lengths with
the estimated lengths at age:
\itemize{
\item l_m: mean length in mm.
\item l_sd: sd of length.
\item l_lb: lower 95\% CI quantile.
\item l_ub: upper 95\% CI quantile.
}

Input data should include radi at age 0 measurements as well,
but can handle missing data (NA) for the cases where it is not possible to
measure the radius at hatching.
}
\author{
Nina M. D. Schiettekatte
}
