#' Function to plot results of back-calculation
#'
#' @param bcdata Results from back-calculation
#' (output of function \code{\link{bcalc}}).
#' @param colorid \code{\link[base]{logical}}. Option to specify colors by
#' fish ID. Defaults to FALSE.
#' @param facet \code{\link[base]{logical}}. Option to split graph in
#' facets per fish ID. Defaults to FALSE.
#' @param error \code{\link[base]{logical}}. Option to show 95% CI around
#' bc estimates. Defaults to FALSE.
#' @param legend \code{\link[base]{logical}}. Option to add color legend.
#' Defaults to FALSE.
#'
#' @return A plot of class \code{\link[ggplot2]{ggplot}} showing
#' back-calculated lengths.
#'
#' @importFrom dplyr %>% group_by summarise
#' @importFrom ggplot2 ggplot aes geom_ribbon geom_point geom_line theme_bw
#' @importFrom ggplot2 facet_wrap theme labs element_text
#' @export
bcplot <- function(bcdata, colorid = FALSE, facet = FALSE, legend = FALSE,
                   error = FALSE) {
  maxage <- bcdata %>%
    group_by(id) %>%
    summarise(l_m = l_m[which.max(age)],
              age = max(age))
  plot <-  ggplot(bcdata, aes(x = age, y = l_m, group = id))
  if (error) {
    if (colorid) {
      plot <- plot +
        geom_ribbon(alpha = 0.3, aes(fill = id, ymin = l_lb, ymax = l_ub))
    } else {
      plot <- plot +
        geom_ribbon(alpha = 0.3, aes(ymin = l_lb, ymax = l_ub))
    }
  }
  if (!colorid) {
    plot <- plot +
      geom_point(size = 1, alpha = 0.5) +
      geom_line(aes(group = id), size = 0.2) +
      geom_point(aes(x = age, y = l_m), size = 2, data = maxage) +
      theme_bw()
  } else {
    plot <- plot +
      geom_point(size = 1, alpha = 0.5) +
      geom_line(aes(group = id, color = id), size = 0.2) +
      geom_point(aes(x = age, y = l_m, color = id), size = 2, data = maxage) +
      theme_bw()
  }
  if (facet) {
    plot <- plot +
      facet_wrap(~id)
  }
  if (!legend) {
    plot <- plot +
      theme(legend.position = "none")
  }
  plot <- plot +
   labs(x = "Age (years)", y = "Length (cm)") +
   theme(text = element_text(size = 14))
  plot
}

#' Function to visualize the fitted hierarchical growth model
#'
#' @param gmdata output of function \code{\link{growthreg}}.
#' @param id \code{\link[base]{logical}}. Show growth curves per individual.
#' Defaults to FALSE.
#' @param facet \code{\link[base]{logical}}. Option to split graph in facets
#' per fish id . Defaults to FALSE.
#' @param error \code{\link[base]{logical}}. Option to show 95% CI around bc
#' estimates. Defaults to TRUE.
#' @param legend \code{\link[base]{logical}}. Option to add color legend.
#' Defaults to FALSE.
#'
#' @importFrom ggplot2 ggplot geom_ribbon aes geom_line theme_bw facet_wrap
#' @importFrom ggplot2 theme element_text labs
#' @return A plot of class \code{\link[ggplot2]{ggplot}}.
#' @export
gmplot <- function(gmdata, id = FALSE, facet = FALSE,
                   legend = FALSE, error = TRUE) {
  pred <- gmdata$fitted
  p <- ggplot()
  if (error) {
    p <- p +
      geom_ribbon(aes(x = .data$age, ymin = .data$ypred_lb,
                      ymax = .data$ypred_ub), alpha = 0.3, data = pred)
  }
  p <- p +
    geom_line(aes(x = .data$age, y = .data$ypred_m),
              size = 1, data = pred) +
    theme_bw()
  if (id) {
    if (error) {
      p <- p +
        geom_ribbon(aes(x = .data$age, ymin = .data$yrep_lb,
                        ymax = .data$yrep_ub, fill = .data$id), alpha = 0.3,
                    data = pred)
    }
    p <- p +
      geom_line(aes(x = .data$age, y = .data$yrep_m, color = .data$id),
                alpha = 0.8, size = 1, data = pred)
  }
  if (facet) {
    p <- p +
      facet_wrap(~id)
  }
  if (!legend) {
    p <- p +
      theme(legend.position = "none")
  }
  p <- p +
    theme(text = element_text(size = 14)) +
    labs(x = "Age (years)", y = "Length (cm)")
  p
}
