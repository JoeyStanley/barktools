% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bark_and_hz.R
\name{bark}
\alias{bark}
\alias{hz}
\title{Convert between Hz and Barks.}
\usage{
bark(x)

hz(x)
}
\arguments{
\item{x}{A number.}
}
\value{
The number transformed into Barks or Hz.
}
\description{
Use \code{bark()} to convert Hz into Barks. Use \code{hz()} to convert Barks
back into Hz. Both of these functions are based on the formula provided
Traunmüller (1990).
}
\section{Note}{
 Because the Traunmüller's formula is not especially precise
  (especially because Zwicker's original scale was biased toward nice round
  numbers), there will inevitably be some rounding error. However, it is 
  small enough that it should be of little consequence.
}

\section{References}{


  Traunmüller, Hartmut. "Auditory scales of frequency representation." The
  Journal of the Acoustical Society of America 88, no. 97 (1990).
  https://doi.org/10.1121/1.399849.

  Zwicker, Eberhard. "Subdivision of the Audible Frequency Range into
  Critical Bands (Frequenzgruppen)." The Journal of the Acoustical Society of
  America 33, no. 2 (1961): 248–248. https://doi.org/10.1121/1.1908630.
}

\examples{
# The simplest case is by converting one number.
bark(500)
hz(3)

# You can also convert a whole vector of numbers.
data(vowels)
head(bark(vowels$F1))

#' This is probably easier within a tidyverse pipeline
\dontrun{
library(dplyr)
vowels \%>\%
   select(vowel, F1:F4) \%>\%
   mutate(F1_bark = bark(F1),
          F2_bark = bark(F2),
          F3_bark = bark(F3),
          F4_bark = bark(F4))
          
# Or, more elegantly, using dplyr::across()
vowels \%>\%
   select(vowel, F1:F4) \%>\%
   mutate(across(F1:F4, bark, .names = "{col}_bark"))
}

}
