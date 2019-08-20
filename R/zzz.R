nltk <- random <- NULL

.onLoad <- function(libname, pkgname) {
  nltk <<- reticulate::import("nltk", delay_load = TRUE, convert = FALSE)
  random <<- reticulate::import("random", delay_load = TRUE, convert = FALSE)
}