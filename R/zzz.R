nltk <- NULL

.onLoad <- function(libname, pkgname) {
  nltk <<- reticulate::import("nltk", delay_load = TRUE)
}