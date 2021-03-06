% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dobject.R
\name{is.dlist}
\alias{is.DList}
\alias{is.dlist}
\title{Returns whether the input is a dlist}
\usage{
is.dlist(x)

is.DList(x)
}
\arguments{
\item{x}{Input object.}
}
\value{
TRUE if x is a dlist, FALSE otherwise
}
\description{
Returns whether the input is a dlist
}
\examples{
\dontrun{
is.dlist(3) #FALSE
is.dlist(dlist(1,2,3,nparts=3)) #TRUE
}
}

