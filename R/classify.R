#' Naive Bayes Classifer
#' 
#' Train a naive Bayes classifier.
#' 
#' @param train The training set.
#' 
#' @export
train_bayes_classifier <- function(train) {
  nltk$NaiveBayesClassifier$train(train)
}

#' Classification Accuracy
#' 
#' Assess classification Accuracy.
#' 
#' @param test The test set. 
#' @param classifier A classifier (model).
#' 
#' @export
classify_accuracy <- function(classifier, test){
  nltk$classify$accuracy(classifier, test)
}