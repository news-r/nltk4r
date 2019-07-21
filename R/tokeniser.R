#' Tokenizers Words
#'
#' Word tokenizer
#' 
#' @param sentence Sentence to tokenize.
#' 
#' @import assertthat
#' 
#' @export
nltk_word_tokenize <- function(sentence) {
  assert_that(!missing(sentence), msg = "Missing `sentence`")
  nltk$word_tokenize(sentence)
}