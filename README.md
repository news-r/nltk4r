
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

sentence <- "Barack Obama was born in Hawaii."

(tokens <- nltk_word_tokenize(sentence))
#> [1] "Barack" "Obama"  "was"    "born"   "in"     "Hawaii" "."

nltk_pos_tag(tokens)
#> [[1]]
#> [[1]][[1]]
#> [1] "Barack"
#> 
#> [[1]][[2]]
#> [1] "NNP"
#> 
#> 
#> [[2]]
#> [[2]][[1]]
#> [1] "Obama"
#> 
#> [[2]][[2]]
#> [1] "NNP"
#> 
#> 
#> [[3]]
#> [[3]][[1]]
#> [1] "was"
#> 
#> [[3]][[2]]
#> [1] "VBD"
#> 
#> 
#> [[4]]
#> [[4]][[1]]
#> [1] "born"
#> 
#> [[4]][[2]]
#> [1] "VBN"
#> 
#> 
#> [[5]]
#> [[5]][[1]]
#> [1] "in"
#> 
#> [[5]][[2]]
#> [1] "IN"
#> 
#> 
#> [[6]]
#> [[6]][[1]]
#> [1] "Hawaii"
#> 
#> [[6]][[2]]
#> [1] "NNP"
#> 
#> 
#> [[7]]
#> [[7]][[1]]
#> [1] "."
#> 
#> [[7]][[2]]
#> [1] "."
```

Reources
--------

The above relies on external resources.

``` r
nltk_download("punkt")
nltk_download("averaged_perceptron_tagger")
```
