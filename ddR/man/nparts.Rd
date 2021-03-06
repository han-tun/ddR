% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dobject.R
\name{nparts}
\alias{nparts}
\title{Returns a 2d-vector denoting the number of partitions existing along
each dimension of the distributed object, where the vector==c(partitions_per_column,
partitions_per_row). For a dlist, the value is 
equivalent to c(totalParts(dobj),1).}
\usage{
nparts(dobj)
}
\arguments{
\item{dobj}{input distributed array, data.frame or list.}
}
\value{
A 2d-vector containing the number of partitions along each dimension.
}
\description{
Returns a 2d-vector denoting the number of partitions existing along
each dimension of the distributed object, where the vector==c(partitions_per_column,
partitions_per_row). For a dlist, the value is 
equivalent to c(totalParts(dobj),1).
}
\examples{
\dontrun{
a <- darray(psize=c(3,3),dim=c(9,9)) # 9 partitions of 3x3
b <- nparts(a) # returns c(3,3)
}
}
\references{
Prasad, S., Fard, A., Gupta, V., Martinez, J., LeFevre, J., Xu, V., Hsu, M., Roy, I. 
Large scale predictive analytics in Vertica: Fast data transfer, distributed model creation 
and in-database prediction. _Sigmod 2015_, 1657-1668.

Venkataraman, S., Bodzsar, E., Roy, I., AuYoung, A., and
Schreiber, R. (2013) Presto: Distributed Machine Learning and
Graph Processing with Sparse Matrices. _EuroSys 2013_, 197-210.

Homepage: https://github.com/vertica/ddR
}
\seealso{
\code{\link{totalParts}}
}

