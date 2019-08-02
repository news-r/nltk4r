#' Tokenizers Words
#'
#' Word tokenizer
#' 
#' @param sentence Sentence to tokenize.
#' 
#' @examples
#' \dontrun{
#' word_tokenize("This is an R package.") 
#' }
#' 
#' @import assertthat
#' 
#' @export
word_tokenize <- function(sentence) {
  assert_that(!missing(sentence), msg = "Missing `sentence`")
  nltk$word_tokenize(sentence)
}

#' POS Tagger
#'
#' Parts of speech tagger
#' 
#' @param tokens Sentence to tokenize.
#' @param to_r Wehther to return results in tidy format.
#' 
#' @examples
#' \dontrun{
#' tokens <- word_tokenize("This is an R package.") 
#' pos_tag(tokens)
#' }
#' 
#' @export
pos_tag <- function(tokens, to_r = TRUE) {
  assert_that(!missing(tokens), msg = "Missing `tokens`")
  pos <- nltk$pos_tag(tokens)

  if(to_r)
    pos <- pos %>% 
      reticulate::py_to_r() %>% 
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
#' tokens <- word_tokenize("This is an R package.") 
#' tagged <- pos_tag(tokens)
#' ne_chunk(tagged)
#' }
#' 
#' @export
ne_chunk <- function(pos) {
  assert_that(!missing(pos), msg = "Missing `pos`")
  nltk$chunk$ne_chunk(pos)
}