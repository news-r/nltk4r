#' Frequency Distribution
#' 
#' Compute frequency of vocabulary in text.
#' 
#' @param text Text to compute frequency distributions.
#' @param to_r Whether to return results in tidy format.
#' 
#' @examples
#' \dontrun{
#' txt3 <- books("text3")
#' fq <- freq_dist(txt3)
#' fq$most_common(10)
#' }
#' 
#' @export
freq_dist <- function(text, to_r = FALSE) {
  assert_that(!missing(text), msg = "Missing text")
  tf <- nltk$FreqDist(text)

  if(to_r){
    total <- tf$B() %>%
      reticulate::py_to_r() %>%  
      as.integer()
    
    tf <- tf$most_common(total) %>% 
      reticulate::py_to_r() %>% 
      purrr::map(purrr::set_names, c("word", "n")) %>%  
      purrr::map_dfr(tibble::as_tibble)
  }
  return(tf)
}

#' Bigrams
#' 
#' Generate bigrams.
#' 
#' @param text Sequence of items, as an iterator.
#' 
#' @examples
#' bigrams(list("Generate", "some", "bigrams"))
#' 
#' @export
bigrams <- function(text){
  assert_that(!missing(text), msg = "Missing text")
  bg <- nltk$bigrams(text)
}