#' Book
#' 
#' Access data useful to follow along the \href{https://www.nltk.org/book}{NLTK Book}.
#' 
#' @param text The text to return.
#' 
#' @examples
#' \dontrun{
#' mody_dick <- books()
#' mody_dick$concordance("monstrous")
#' mody_dick$similar("monstrous")
#' }
#' 
#' @export
books <- function(text = "text1") {
  nltk$book[[text]]
}

#' Gutenberg
#' 
#' Small selection of texts from the Project Gutenberg electronic text archive.
#'
#' @param file A Gutenberg file as returned by \code{gutenberg_files}.
#' @param to_r Whether to return results in R tidy format.
#' 
#' @examples
#' \dontrun{
#' files <- gutenberg_files(to_r = TRUE)
#' words <- gutenberg_words(sample(files, 1)) # get random text
#' text <- nltk_text(words) # convert
#' text$concordance("surprize")
#' }
#' 
#' @name gutenberg
#' @export
gutenberg_files <- function(to_r = FALSE){
  files <- nltk$corpus$gutenberg$fileids()
  if(to_r)
    files <- reticulate::py_to_r(files)
  return(files)
}

#' @rdname gutenberg
#' @export
gutenberg_raw <- function(file){
  assert_that(!missing(file))
  nltk$corpus$gutenberg$raw(file)
}

#' @rdname gutenberg
#' @export
gutenberg_words <- function(file){
  assert_that(!missing(file))
  nltk$corpus$gutenberg$words(file)
}

#' @rdname gutenberg
#' @export
gutenberg_sents <- function(file){
  assert_that(!missing(file))
  nltk$corpus$gutenberg$sents(file)
}