#' As text
#' 
#' As NLTK text object.
#' 
#' @param text Text to convert.
#' 
#' @examples
#' \dontrun{
#' files <- gutenberg_files(to_r = TRUE)
#' words <- gutenberg_words(sample(files, 1)) # get random text
#' text <- nltk_text(words) # convert
#' text$concordance("surprize")
#' }
#' 
#' @export
nltk_text <- function(text) {
  assert_that(!missing(text), msg = "Missing text")
  nltk$Text(text)
}