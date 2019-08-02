#' Install Dependencies
#' 
#' Install Python dependencies. Arguments are passed to \link[reticulate]{py_install}.
#' 
#' @param envname Name of environment to install packages into
#' @param method Installation method. By default, "auto" automatically 
#' finds a method that will work in the local environment. 
#' Change the default to force a specific installation method. 
#' Note that the "virtualenv" method is not available on Windows.
#' @param conda Path to conda executable (or "auto" to find conda using the
#' \code{PATH} and other conventional install locations).
#' 
#' @examples
#' \dontrun{install_nltk()}
#' 
#' @import assertthat
#' 
#' @name dependencies
#' @export
install_nltk <- function(envname = NULL, method = "auto", conda = "auto") {
  reticulate::py_install("nltk", envname = envname, method = method, conda = conda)
  reticulate::py_install("numpy", envname = envname, method = method, conda = conda)
  invisible()
}

#' Resources
#' 
#' Download required resources.
#' 
#' @param resource Resource to download.
#' 
#' @section Resources:
#' \itemize{
#'   \item{\code{punkt}}
#'   \item{\code{averaged_perceptron_tagger}}
#' }
#' 
#' @examples
#' \dontrun{download_datasets("punkt")}
#' 
#' @export
download_datasets <- function(resource = NULL){
  if(!is.null(resource))
    nltk$download(resource)
  else
    nltk$download()
  invisible()
}