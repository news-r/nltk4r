% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/term-frequency.R
\name{freq_dist}
\alias{freq_dist}
\title{Frequency Distribution}
\usage{
freq_dist(text, to_r = FALSE)
}
\arguments{
\item{text}{Text to compute frequency distributions.}

\item{to_r}{Whether to return results in tidy format.}
}
\description{
Compute frequency of vocabulary in text.
}
\examples{
\dontrun{
txt3 <- books("text3")
fq <- freq_dist(txt3)
fq$most_common(10)
}

}
