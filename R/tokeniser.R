#' Tokenizers Words
#'
#' Word tokenizer
#' 
#' @param sentence Sentence to tokenize.
#' 
#' @examples
#' \dontrun{
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
#' \dontrun{
#' tokens <- nltk_word_tokenize("This is an R package.") 
#' nltk_pos_tag(tokens)
#' }
#' 
#' @export
nltk_pos_tag <- function(tokens, tidy = TRUE) {
  assert_that(!missing(tokens), msg = "Missing `tokens`")
  pos <- nltk$pos_tag(tokens)

  if(tidy)
    pos <- pos %>% 
      purrr::map(purrr::set_names, c("word", "tag")) %>%  
      purrr::map_dfr(tibble::as_tibble)

  return(pos)
}

#' Named Entity Extraction
#'
#' Named Entity Extraction
#' 
#' @param pos POS tagged to tokenize.
#' 
#' @examples
#' \dontrun{
#' tokens <- nltk_word_tokenize("This is an R package.") 
#' tagged <- nltk_pos_tag(tokens)
#' nltk_ne_chunk(tagged)
#' }
#' 
#' @export
nltk_ne_chunk <- function(pos) {
  assert_that(!missing(pos), msg = "Missing `pos`")
  nltk$chunk$ne_chunk(pos)
}