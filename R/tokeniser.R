#' Tokenizers Words
#'
#' Word tokenizer
#' 
#' @param sentence Sentence to tokenize.
#' 
#' @examples
#' \donrun{
#' nltk_word_tokenize("This is an R package.") 
#' }
#' 
#' @import assertthat
#' 
#' @export
nltk_word_tokenize <- function(sentence) {
  assert_that(!missing(sentence), msg = "Missing `sentence`")
  nltk$word_tokenize(sentence)
}

#' POS Tagger
#'
#' Parts of speech tagger
#' 
#' @param tokens Sentence to tokenize.
#' 
#' @examples
#' \donrun{
#' tokens <- nltk_word_tokenize("This is an R package.") 
#' nltk_pos_tag(tokens)
#' }
#' 
#' @export
nltk_pos_tag <- function(tokens) {
  assert_that(!missing(tokens), msg = "Missing `tokens`")
  nltk$pos_tag(tokens)
}