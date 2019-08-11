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

#' Gutenberg
#' 
#' Small selection of texts from the Project Gutenberg electronic text archive.
#'
#' @param file A Gutenberg file as returned by \code{gutenberg_files}.
#' @param to_r Whether to return results in R tidy format.
#' 
#' @examples
#' \dontrun{
#' files <- gutenberg_files(to_r = TRUE)
#' words <- gutenberg_words(sample(files, 1)) # get random text
#' text <- nltk_text(words) # convert
#' text$concordance("surprize")
#' }
#' 
#' @name gutenberg
#' @export
gutenberg_files <- function(to_r = FALSE){
  files <- nltk$corpus$gutenberg$fileids()
  if(to_r)
    files <- reticulate::py_to_r(files)
  return(files)
}

#' @rdname gutenberg
#' @export
gutenberg_raw <- function(file, to_r = FALSE){
  assert_that(!missing(file))
  raw <- nltk$corpus$gutenberg$raw(file)
  if(to_r)
    raw <- reticulate::py_to_r(raw)
  return(raw)
}

#' @rdname gutenberg
#' @export
gutenberg_words <- function(file, to_r = FALSE){
  assert_that(!missing(file))
  words <- nltk$corpus$gutenberg$words(file)
  if(to_r){
    tidy_words <- c()
    L <- reticulate::py_len(words) - 1
    for(i in 0:L){
      w <- reticulate::py_to_r(words[[i]])
      tidy_words <- append(tidy_words, w)
    }
    return(tidy_words)
  }
  return(words)
}

#' @rdname gutenberg
#' @export
gutenberg_sents <- function(file, to_r = FALSE){
  assert_that(!missing(file))
  sents <- nltk$corpus$gutenberg$sents(file)
  if(to_r){
    tidy_sents <- c()
    L <- reticulate::py_len(sents) - 1
    for(i in 0:L){
      w <- reticulate::py_to_r(sents[[i]])
      tidy_sents <- append(tidy_sents, w)
    }
    return(tidy_sents)
  }
  return(sents)
}

#' Brown Corpus
#' 
#' The Brown Corpus was the first million-word electronic corpus of English, 
#' created in 1961 at Brown University. This corpus contains text from 500 
#' sources, and the sources have been categorized by genre, such as news, 
#' editorial, and so on. 1.1 gives an example of each genre (for a 
#' complete list, see \url{http://icame.uib.no/brown/bcm-los.html}).
#' 
#' @examples
#' \dontrun{
#' brown <- brown_corpus()
#' brown$categories() %>%
#'   reticulate::py_to_r()
#' }
#' 
#' @return Return NLTK's Brown corpus as Python object.
#' 
#' @export
brown_corpus <- function(){
  nltk$corpus$brown
}

#' Reuters
#' 
#' The Reuters Corpus contains 10,788 news documents totaling 1.3 million words. 
#' The documents have been classified into 90 topics, and grouped into two sets, 
#' called "training" and "test"; thus, the text with fileid 'test/14826' is a 
#' document drawn from the test set. 
#'
#' @param to_r Whether to return results in R tidy format.
#' @param category A category or a list of categories, see examples.
#' @param ... Additional parameters such as \code{categories}, see examples.
#' 
#' @examples
#' \dontrun{
#' files <- reuters_files(to_r = TRUE)
#' categories <- reuters_categories() # all categories
#' reuters_categories(sample(files, 1)) 
#' reuters_words(categories = "barley") 
#' reuters_files("barley") 
#' }
#' 
#' @name reuters
#' @export
reuters_files <- function(category = NULL, to_r = FALSE){
  files <- nltk$corpus$reuters$fileids(category)
  if(to_r)
    files <- reticulate::py_to_r(files)
  return(files)
}

#' @rdname reuters
#' @export
reuters_categories <- function(..., to_r = FALSE){
  categories <- nltk$corpus$reuters$categories(...)
  if(to_r)
    categories <- reticulate::py_to_r(categories)
  return(categories)
}

#' @rdname reuters
#' @export
reuters_words <- function(..., to_r = FALSE){
  words <- nltk$corpus$reuters$words(...)
  if(to_r){
    tidy_words <- c()
    L <- reticulate::py_len(words) - 1
    for(i in 0:L){
      w <- reticulate::py_to_r(words[[i]])
      tidy_words <- append(tidy_words, w)
    }
    return(tidy_words)
  }
  return(words)
}

#' Inaugural Address Corpus
#' 
#' Corpus of Inaugural Addresses of US Presidents.
#' 
#' @param to_r Whether to return results in R tidy format.
#' @param file An Inaugural address as returned by \code{inaugural_files}.
#' 
#' @examples
#' \dontrun{
#' files <- inaugural_files(to_r = TRUE)
#' inaugural_words(sample(files, 1)) 
#' }
#' 
#' @name inaugural
#' @export
inaugural_files <- function(to_r = FALSE){
  files <- nltk$corpus$inaugural$fileids()
  if(to_r)
    files <- reticulate::py_to_r(files)
  return(files)
}

#' @rdname inaugural
#' @export
inaugural_words <- function(file, to_r = FALSE){
  assert_that(file, msg = "Missing file, see `inaugural_files`")
  words <- nltk$corpus$inaugural$words(file)
  if(to_r){
    tidy_words <- c()
    L <- reticulate::py_len(words) - 1
    for(i in 0:L){
      w <- reticulate::py_to_r(words[[i]])
      tidy_words <- append(tidy_words, w)
    }
    return(tidy_words)
  }
  return(words)
}

#' @rdname inaugural
#' @export
inaugural_sents <- function(file, to_r = FALSE){
  assert_that(file, msg = "Missing file, see `inaugural_files`")
  sents <- nltk$corpus$inaugural$sents(file)
  if(to_r){
    tidy_sents <- c()
    L <- reticulate::py_len(sents) - 1
    for(i in 0:L){
      w <- reticulate::py_to_r(sents[[i]])
      tidy_sents <- append(tidy_sents, w)
    }
    return(tidy_sents)
  }
  return(sents)
}

#' @rdname inaugural
#' @export
inaugural_raw <- function(file, to_r = FALSE){
  assert_that(!missing(file))
  raw <- nltk$corpus$inaugural$raw(file)
  if(to_r)
    raw <- reticulate::py_to_r(raw)
  return(raw)
}