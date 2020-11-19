
#' Function to plot results of back-calculation
#'
#' @param bcdata Results from back-calculation (output of function bcalc())
#' @param colorid Option to specify colors by fish id (default = FALSE)
#' @param facet Option to split graph in facets per fish id (default = FALSE)
#' @param error Option to show 95%CI around bc estimates (default = FALSE)
#' @param legend Option to add color legend (defaul = FALSE)
#'
#' @return A plot showing back-calculated lengths
#' @export
#'
#' @import ggplot2
#'
#' @examples
bcplot <- function(bcdata, colorid = FALSE,
                   facet = FALSE, legend = FALSE,
                   error = FALSE){

  maxage <- bcdata %>%
    group_by(id) %>%
    summarise(l_m = l_m[which.max(age)],
              age = max(age))

  plot <-  ggplot(bcdata, aes(x = age, y = l_m, group = id))

  if (error == TRUE){
    if (colorid == TRUE){
      plot <- plot +
        geom_ribbon(alpha = 0.3, aes(fill = id, ymin = l_lb, ymax = l_ub))
    } else{
      plot <- plot +
        geom_ribbon(alpha = 0.3, aes(ymin = l_lb, ymax = l_ub))
    }
  }

  if (colorid == FALSE){
    plot <- plot +
      geom_point(size = 1, alpha = 0.5) +
      geom_line(aes(group = id), size = 0.2) +
      geom_point(aes(x = age, y = l_m), size = 2, data = maxage) +
      theme_bw()
  } else{
    plot <- plot +
      geom_point(size = 1, alpha = 0.5) +
      geom_line(aes(group = id, color = id), size = 0.2) +
      geom_point(aes(x = age, y = l_m, color = id), size = 2, data = maxage) +
      theme_bw()
  }

  if (facet == TRUE){
    plot <- plot +
      facet_wrap(~id)
  }

  if (legend == FALSE){
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
#' @param gmdata output of function growthreg()
#' @param id Show growth curves per individual (default = FALSE)
#' @param facet Option to split graph in facets per fish id (default = FALSE)
#' @param error Option to show 95%CI around bc estimates (default = FALSE)
#' @param legend Option to add color legend (defaul = FALSE)
#'
#' @return
#' @export
#'
#' @examples
#'
gmplot <- function(gmdata, id = FALSE, facet = FALSE,
                   legend = FALSE, error = TRUE){

  pred <- gmdata$fitted

  p <- ggplot()

  if (error == TRUE) {
    p <- p +
    geom_ribbon(aes(x = age, ymin = ypred_lb, ymax = ypred_ub),
                alpha = 0.3, data = pred)
  }

  p <- p +
    geom_line(aes(x = age, y = ypred_m),
              size = 1, data = pred) +
    theme_bw()

  if (id == TRUE){

    if (error == TRUE){
      p <- p +
        geom_ribbon(aes(x = age, ymin = yrep_lb, ymax = yrep_ub, fill = id),
                    alpha = 0.3, data = pred)
    }

    p <- p +
      geom_line(aes(x = age, y = yrep_m, color = id),
                alpha = 0.8, size = 1, data = pred)

  }

  if (facet == TRUE){
    p <- p +
    facet_wrap(~id)
  }

  if (legend == FALSE){
    p <- p + theme(legend.position = "none")
  }

  p <- p + theme(text = element_text(size = 14)) +
    labs(x = "Age (years)", y = "Length (cm)")

  p

}



