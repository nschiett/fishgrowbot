% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.R
\name{bcplot}
\alias{bcplot}
\title{Function to plot results of back-calculation}
\usage{
bcplot(bcdata, colorid = FALSE, facet = FALSE, legend = FALSE, error = FALSE)
}
\arguments{
\item{bcdata}{Results from back-calculation
(output of function \code{\link{bcalc}}).}

\item{colorid}{\code{\link[base]{logical}}. Option to specify colors by
fish ID. Defaults to FALSE.}

\item{facet}{\code{\link[base]{logical}}. Option to split graph in
facets per fish ID. Defaults to FALSE.}

\item{legend}{\code{\link[base]{logical}}. Option to add color legend.
Defaults to FALSE.}

\item{error}{\code{\link[base]{logical}}. Option to show 95\% CI around
bc estimates. Defaults to FALSE.}
}
\value{
A plot of class \code{\link[ggplot2]{ggplot}} showing
back-calculated lengths.
}
\description{
Function to plot results of back-calculation
}
