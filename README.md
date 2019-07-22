
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->
[![Travis build status](https://travis-ci.org/news-r/nltk.svg?branch=master)](https://travis-ci.org/news-r/nltk)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->
nltk
====

Brings Python [Natural Language Toolkit](https://www.nltk.org/) to R.

Installation
------------

``` r
# install.packages("remotes")
remotes::install_github("news-r/nltk")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
library(nltk)

# tokenize
(tokens <- nltk_word_tokenize("This is an R package."))
#> [1] "This"    "is"      "an"      "R"       "package" "."

# Parts of speech
nltk_pos_tag(tokens)
#> # A tibble: 6 x 2
#>   word    tag  
#>   <chr>   <chr>
#> 1 This    DT   
#> 2 is      VBZ  
#> 3 an      DT   
#> 4 R       JJ   
#> 5 package NN   
#> 6 .       .
pos <- nltk_pos_tag(tokens, tidy = FALSE)

# Entity Extraction
nltk_ne_chunk(pos)
#> (S
#>   ['This', 'DT']
#>   ['is', 'VBZ']
#>   ['an', 'DT']
#>   ['R', 'JJ']
#>   ['package', 'NN']
#>   ['.', '.'])
```

Reources
--------

The above relies on external resources.

``` r
nltk_download("punkt") # nltk_word_tokenize
nltk_download("averaged_perceptron_tagger") # nltk_pos_tag
nltk_download("maxent_ne_chunker") # nltk_ne_chunk
nltk_download("words") # nltk_ne_chunk
```
