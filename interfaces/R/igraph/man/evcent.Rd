\name{evcent}
\alias{evcent}
\concept{Eigenvector centrality}
\title{Find Eigenvector Centrality Scores of Network Positions}
\description{
  \code{evcent} takes a graph (\code{graph}) and returns the
  eigenvector centralities of positions \code{v} within it
}
\usage{
evcent (graph, directed = FALSE, scale = TRUE, weights = NULL,
     options = igraph.arpack.default) 
}
\arguments{
  \item{graph}{Graph to be analyzed.}
  \item{directed}{Logical scalar, whether to consider direction of the
    edges in directed graphs. It is ignored for undirected graphs.}
  \item{scale}{Logical scalar, whether to scale the result to have a
    maximum score of one. If no scaling is used then the result vector
    has unit length in the Euclidean norm.}
  \item{weights}{A numerical vector or \code{NULL}. This argument can be
    used to give edge weights for calculating the weighted eigenvector
    centrality of vertices. If this is \code{NULL} and the graph has a
    \code{weight} edge attribute then that is used. If \code{weights} is
    a numerical vector then it used, even if the graph has a
    \code{weights} edge attribute. If this is \code{NA}, then no edge
    weights are used (even if the graph has a \code{weight} edge
    attribute. Note that if there are negative edge weights and the
    direction of the edges is considered, then the eigenvector might be
    complex. In this case only the real part is reported.}
  \item{options}{A named list, to override some ARPACK options. See
    \code{\link{arpack}} for details.}
}
\details{
Eigenvector centrality scores correspond to the values of the first
eigenvector of the graph adjacency matrix; these scores may, in turn, be
interpreted as arising from a reciprocal process in which the centrality
of each actor is proportional to the sum of the centralities of those
actors to whom he or she is connected.  In general, vertices with high
eigenvector centralities are those which are connected to many other
vertices which are, in turn, connected to many others (and so on).  (The
perceptive may realize that this implies that the largest values will be
obtained by individuals in large cliques (or high-density
substructures).  This is also intelligible from an algebraic point of
view, with the first eigenvector being closely related to the best
rank-1 approximation of the adjacency matrix (a relationship which is
easy to see in the special case of a diagonalizable symmetric real
matrix via the \eqn{SLS^-1}{$S \Lambda S^{-1}$} decomposition).)

From igraph version 0.5 this function uses ARPACK for the underlying
computation, see \code{\link{arpack}} for more about ARPACK in igraph.
}
\value{
  A named list with components:
  \item{vector}{A vector containing the centrality scores.}
  \item{value}{The eigenvalue corresponding to the calculated
    eigenvector, i.e. the centrality scores.}
  \item{options}{A named list, information about the underlying ARPACK
    computation. See \code{\link{arpack}} for the details.
  }
}
\references{ Bonacich, P.  (1987).  Power and Centrality: A Family of
Measures. \emph{American Journal of Sociology}, 92, 1170-1182. }
\author{ Gabor Csardi \email{csardi.gabor@gmail.com} and Carter T. Butts
  (\url{http://www.faculty.uci.edu/profile.cfm?faculty_id=5057})
  for the manual page.}
\section{WARNING }{\code{evcent} will not symmetrize your data before
extracting eigenvectors; don't send this routine asymmetric matrices
unless you really mean to do so.}
% \seealso{}
\examples{
#Generate some test data
g <- graph.ring(10, directed=FALSE)
#Compute eigenvector centrality scores
evcent(g)
}
\keyword{graphs}
