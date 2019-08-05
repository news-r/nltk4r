
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->
[![Travis build status](https://travis-ci.org/news-r/nltk.svg?branch=master)](https://travis-ci.org/news-r/nltk) [![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental) <!-- badges: end -->

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

You are advised to use a virtual environment.

``` r
# replace with path of your choice
my_env <- "./env"

# run this (works on unix)
args <- paste("-m venv", my_env)
system2("python3", args) # create environment
reticulate::use_virtualenv(my_env, required = TRUE) # force reticulate to use env
nltk4r::install_nltk(my_env) # install gensim & scikit-learn in environment
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
library(nltk)
#> 
#> Attaching package: 'nltk'
#> The following objects are masked from 'package:nltk4r':
#> 
#>     download_datasets, install_nltk, ne_chunk, pos_tag,
#>     word_tokenize

# tokenize
(tokens <- word_tokenize("This is an R package."))
#> ['This', 'is', 'an', 'R', 'package', '.']

# Parts of speech
pos_tag(tokens)
#> # A tibble: 6 x 2
#>   word    tag  
#>   <chr>   <chr>
#> 1 This    DT   
#> 2 is      VBZ  
#> 3 an      DT   
#> 4 R       JJ   
#> 5 package NN   
#> 6 .       .
pos <- pos_tag(tokens, to_r = FALSE)

# Entity Extraction
ne_chunk(pos)
#> (S This/DT is/VBZ an/DT R/JJ package/NN ./.)
```
