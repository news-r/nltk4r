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