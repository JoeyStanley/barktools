#' Plot using the Bark scale.
#'
#' Transforms the axes of a ggplot into the bark scale. The data is still
#' plotted in Hz. If you want to plot the data in Barks themselves, transform
#' the data beforehand and plot normally. For an example of plots using this
#' scale, see Harrington et al. (2000).
#'
#' @section References:
#'
#'   Harrington, Jonathan, Sallyanne Palethorpe, and Catherine Watson.
#'   "Monophthongal Vowel Changes in Received Pronunciation: An Acoustic
#'   Analysis of the Queen’s Christmas Broadcasts." Journal of the International
#'   Phonetic Association 30, no. 1–2 (2000): 63–78.
#'   https://doi.org/10.1017/S0025100300006666
#'
#' @param ... Parameters passed on to \code{scale_x_continuous}
#' @param rev Should the axis be flipped? Or rather, would you normally use
#'   \code{scale_x_reverse} for this plot? \code{TRUE} by default, making it
#'   easiest for F1-F2 plot. You can do this in spectrogram-like plots (time vs.
#'   hz) to emphasize change in F1, but you'll probably want to specify
#'   \code{rev = FALSE}.
#' @export
scale_x_bark <- function(..., rev = TRUE) scale_x_continuous(..., trans = bark_trans(rev = rev))

#' @rdname scale_x_bark
#' @export
scale_y_bark <- function(..., rev = TRUE) scale_y_continuous(..., trans = bark_trans(rev = rev))


#' This function is for internal purposes only. 
bark_trans <- function(rev) {
  if (rev) {
    scales::trans_new(name = "bark_rev", 
                      transform = function(x) -bark(x), 
                      inverse   = function(x) hz(-x),
                      minor_breaks = scales::regular_minor_breaks(reverse = TRUE))
  } else {
    scales::trans_new(name = "bark", 
                      transform = bark, 
                      inverse   = hz)
  }
}
