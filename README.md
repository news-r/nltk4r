
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
pos_tag(tokens)
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
pos <- pos_tag(tokens, to_r = FALSE)

# Identify named entity
chunks <- ne_chunk(pos)

# book data for examples
(txt <- books("text1"))
#> <Text: Moby Dick by Herman Melville 1851>

# generate text
txt$generate()
#> long , from one to the top - mast , and no coffin and went out a sea
#> captain -- this peaking of the whales . , so as to preserve all his
#> might had in former years abounding with them , they toil with their
#> lances , strange tales of Southern whaling . at once the bravest
#> Indians he was , after in vain strove to pierce the profundity . ?
#> then ?" a levelled flame of pale , And give no chance , watch him ;
#> though the line , it is to be gainsaid . have been
```
