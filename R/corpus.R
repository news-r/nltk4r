#' Corpus Reader
#' 
#' Read collection of text files as corpus.
#'
#' @param root The root directory.
#' @param pattern Pattern to match file neames against.
#' 
#' @export
corpus_reader <- function(root, pattern = ".*"){
  assert_that(!missing(root), msg = "Missing root")
  nltk$corpus$PlaintextCorpusReader(root, pattern)
}