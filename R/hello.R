# Hello, world!
#
# This is an example function named 'hello' 
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

bark <- function (f) {
  
  # The main function
  bark <- 26.81 * f/(1960 + f) - 0.53
  
  # The adjustment for very low or very high measurements
  bark[bark < 2 & !is.na(bark)] <- bark[bark < 2 & !is.na(bark)] + 0.15 * (2 - bark[bark < 2 & !is.na(bark)])
  bark[bark > 20.1 & !is.na(bark)] <- bark[bark > 20.1 & !is.na(bark)] + 0.22 * (bark[bark > 20.1 & !is.na(bark)] - 20.1)
  
  return(bark)
}

hz <- function(z) {
  
  # The adjustment for very low or very high measurements
  z[z < 2 & !is.na(z)] <- (z[z < 2 & !is.na(z)] - 0.3) / 0.85
  z[z > 20.1 & !is.na(z)] <- (z[z > 20.1 & !is.na(z)] + 4.422) / 1.22
  
  # The main function
  hz <- (1960 * (z + 0.53)) / (26.28 - z)
  
  return(hz)
}