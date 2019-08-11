#' Corpus Reader
#' 
#' Read collection of text files as corpus.
#'
#' @param root The root directory.
#' @param pattern Pattern to match file neames against.
#' 
#' @name corpus_reader
#' 
#' @export
plain_text_corpus_reader <- function(root, pattern = ".*"){
  assert_that(!missing(root), msg = "Missing root")
  nltk$corpus$PlaintextCorpusReader(root, pattern)
}

#' @rdname corpus_reader
#' 
#' @export
bracket_parse_corpus_reader <- function(root, pattern = ".*"){
  assert_that(!missing(root), msg = "Missing root")
  nltk$corpus$BracketParseCorpusReader(root, pattern)
}