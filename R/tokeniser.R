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
#' @param tidy Wehther to return results in tidy format.
#' 
#' @examples
#' \donrun{
#' tokens <- nltk_word_tokenize("This is an R package.") 
#' nltk_pos_tag(tokens)
#' }
#' 
#' @export
nltk_pos_tag <- function(tokens, tidy = TRUE) {
  assert_that(!missing(tokens), msg = "Missing `tokens`")
  pos <- nltk$pos_tag(tokens)

  if(tidy)
    pos %>% 
      purrr::map(purrr::set_names, c("word", "tag")) %>%  
      purrr::map_dfr(tibble::as_tibble)
}