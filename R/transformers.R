#' Convert between Hz and Barks.
#'
#' Use \code{bark()} to convert Hz into Barks. Use \code{hz()} to convert Barks
#' back into Hz. Both of these functions are based on the formula provided
#' Traunmüller (1990).
#'
#' @section Note: Because the Traunmüller's formula is not especially precise
#'   (especially because Zwicker's original scale was biased toward nice round
#'   numbers), there will inevitably be some rounding error. However, it is 
#'   small enough that it should be of little consequence. 
#'
#' @section References:
#'
#'   Traunmüller, Hartmut. "Auditory scales of frequency representation." The
#'   Journal of the Acoustical Society of America 88, no. 97 (1990).
#'   https://doi.org/10.1121/1.399849.
#'
#'   Zwicker, Eberhard. "Subdivision of the Audible Frequency Range into
#'   Critical Bands (Frequenzgruppen)." The Journal of the Acoustical Society of
#'   America 33, no. 2 (1961): 248–248. https://doi.org/10.1121/1.1908630.
#'
#' @param x A number.
#' @return The number transformed into Barks or Hz.
#' @export
bark <- function (x) {
  
  # The main function
  bark <- 26.81 * x/(1960 + x) - 0.53
  
  # The adjustment for very low or very high measurements
  bark[bark < 2 & !is.na(bark)] <- bark[bark < 2 & !is.na(bark)] + 0.15 * (2 - bark[bark < 2 & !is.na(bark)])
  bark[bark > 20.1 & !is.na(bark)] <- bark[bark > 20.1 & !is.na(bark)] + 0.22 * (bark[bark > 20.1 & !is.na(bark)] - 20.1)
  
  return(bark)
}

#' @rdname bark
#' @export
hz <- function(x) {
  
  # The adjustment for very low or very high measurements
  x[x < 2 & !is.na(x)] <- (x[x < 2 & !is.na(x)] - 0.3) / 0.85
  x[x > 20.1 & !is.na(x)] <- (x[x > 20.1 & !is.na(x)] + 4.422) / 1.22
  
  # The main function
  hz <- (1960 * (x + 0.53)) / (26.28 - x)
  
  return(hz)
}