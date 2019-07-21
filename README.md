
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->
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

sentence <- "This is an R package."

(tokens <- nltk_word_tokenize(sentence))
#> [1] "This"    "is"      "an"      "R"       "package" "."

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
```

Reources
--------

The above relies on external resources.

``` r
nltk_download("punkt")
nltk_download("averaged_perceptron_tagger")
```
