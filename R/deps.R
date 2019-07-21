
#' Install Dependencies
#' 
#' Install the Natural Language dependency.
#' 
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
#' @export
install_nltk <- function(method = "auto", conda = "auto") {
  reticulate::py_install("nltk", method = method, conda = conda)
  reticulate::py_install("numpy", method = method, conda = conda)
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
#' \dontrun{nltk_download("punkt")}
#' 
#' @export
nltk_download <- function(resource){
  if(!missing(resource))
    nltk$download(resource)
  else
    nltk$download()
}