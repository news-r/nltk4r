
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->
[![Travis build status](https://travis-ci.org/news-r/nltk4r.svg?branch=master)](https://travis-ci.org/news-r/nltk4r) [![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental) <!-- badges: end -->

Natural Language Toolkit for R
==============================

Python's [Natural Language Toolkit](https://www.nltk.org/) for R.

Installation
------------

First install the package.

``` r
# install.packages("remotes")
remotes::install_github("news-r/nltk4r")
```

You are advised to install the Python dependencies in a virtual environment.

``` r
# replace with path of your choice
my_env <- "./env"

# create a virtual environment (tested on unix)
args <- paste("-m venv", my_env)
system2("python3", args) 

# force reticulate to use env
reticulate::use_virtualenv(my_env, required = TRUE)

# install gensim & scikit-learn in environment
nltk4r::install_nltk(my_env) 
```

Then download the necessary datasets.

``` r
nltk4r::download_datasets("all")
```

Now you're set, you can import the library and get started.

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
library(nltk4r)

# from Wikipedia
str <- paste(
  "R is a programming language and free software environment",
  "for statistical computing and graphics supported by the R Foundation",
  "for Statistical Computing."
)

# tokenize
(tokens <- word_tokenize(str))
#> List (23 items)

# Parts of speech
pos_tag(tokens, to_r = TRUE) # titdy R data structure
#> # A tibble: 23 x 2
#>    word        tag  
#>    <chr>       <chr>
#>  1 R           NNP  
#>  2 is          VBZ  
#>  3 a           DT   
#>  4 programming JJ   
#>  5 language    NN   
#>  6 and         CC   
#>  7 free        JJ   
#>  8 software    NN   
#>  9 environment NN   
#> 10 for         IN   
#> # … with 13 more rows
pos <- pos_tag(tokens)

# Identify named entity
chunks <- ne_chunk(pos)

# convert to text
txt <- nltk_text(tokens)

# generate
txt$generate()
#> for Statistical Computing . and graphics supported by the R Foundation
#> for Statistical Computing . R Foundation for Statistical Computing .
#> software environment for statistical computing and graphics supported
#> by the R Foundation for Statistical Computing . Statistical Computing
#> . computing and graphics supported by the R Foundation for Statistical
#> Computing . by the R Foundation for Statistical Computing . Foundation
#> for Statistical Computing . the R Foundation for Statistical Computing
#> . for statistical computing and graphics supported by the R Foundation
#> for Statistical Computing . statistical computing and graphics
#> supported by the R Foundation for Statistical Computing . the
```

Gender Classifier
-----------------

Classify gender based on last letter in name using naive bayes classifier, from the [book](https://www.nltk.org/book/ch06.html)

``` r
# load data
first_names <- first_names(to_r = TRUE) 

# extract last letter as feature
gender_feature <- function(nms){
  nms <- substr(nms, nchar(nms), nchar(nms))
  purrr::map(nms, function(x){
    list(
      last_letter = x
    )
  })
}

features <- gender_feature(first_names$name)
feature_set <- purrr::map2(features, first_names$gender, function(g, l){
  list(
    g, l
  )
})

# split train test
train <- list()
test <- list()
for(i in 1:length(feature_set)){
  draw <- sample(1:2, 1)
  if(draw == 1)
    train <- append(train, list(feature_set[[i]]))
  else
    test <- append(test, list(feature_set[[i]]))
}

classifier <- train_bayes_classifier(train)
classifier$classify(gender_feature("Neo")[[1]])
#> male
classifier$classify(gender_feature("Sara")[[1]])
#> female
```
