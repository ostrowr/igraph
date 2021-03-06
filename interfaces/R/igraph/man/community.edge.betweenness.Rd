\name{edge.betweenness.community}
\alias{edge.betweenness.community}
\alias{edge.betweenness.community.merges}
\concept{Edge betweenness}
\concept{Community structure}
\title{Community structure detection based on edge betweenness}
\description{Many networks consist of modules which are densely
  connected themselves but sparsely connected to other modules.}
\usage{
edge.betweenness.community (graph, weights = E(graph)$weight,
    directed = TRUE, edge.betweenness = TRUE, merges = TRUE,
    bridges = TRUE, modularity = TRUE, membership = TRUE)
}
\arguments{
  \item{graph}{The graph to analyze.}
  \item{weights}{The edge weights. Supply \code{NULL} to omit edge
    weights. By default the \sQuote{\code{weight}} edge attribute is
    used, if it is present.}
  \item{directed}{Logical constant, whether to calculate directed edge
    betweenness for directed graphs. It is ignored for undirected
    graphs.}
  \item{edge.betweenness}{Logical constant, whether to return the edge
    betweenness of the edges at the time of their removal.}
  \item{merges}{Logical constant, whether to return the merge matrix
    representing the hierarchical community structure of the network.
    This argument is called \code{merges}, even if the community
    structure algorithm itself is divisive and not agglomerative: it
    builds the tree from top to bottom. There is one line for each merge
    (i.e. split) in matrix, the first line is the first merge (last
    split). The communities are identified by integer number starting from
    one. Community ids smaller than or equal to \eqn{N}, the
    number of vertices in the graph, belong to singleton communities,
    ie. individual vertices. Before the first merge we have
    \eqn{N} communities numbered from one to \eqn{N}. The
    first merge, the first line of the matrix creates community
    \eqn{N+1}, the second merge creates community \eqn{N+2},
    etc.
  }
  \item{bridges}{Logical constant, whether to return a list the edge
    removals which actually splitted a component of the graph.}
  \item{modularity}{Logical constant, whether to calculate the
    maximum modularity score, considering all possibly community
    structures along the edge-betweenness based edge removals.}
  \item{membership}{Logical constant, whether to calculate the
    membership vector corresponding to the highest possible modularity
    score.}
}
\details{
  The edge betweenness score of an edge measures the number of shortest
  paths through it, see \code{\link{edge.betweenness}} for details. The
  idea of the edge betweenness based community structure detection is
  that it is likely that edges connecting separate modules have high
  edge betweenness as all the shortest paths from one module to another
  must traverse through them. So if we gradually remove the edge with
  the highest edge betweenness score we will get a hierarchical map, a
  rooted tree, called a dendrogram of the graph. The leafs of the tree
  are the individual vertices and the root of the tree represents the
  whole graph. 

  \code{edge.betweenness.community} performs this algorithm by
  calculating the edge betweenness of the graph, removing the edge with
  the highest edge betweenness score, then recalculating edge
  betweenness of the edges and again removing the one with the highest
  score, etc.

  \code{edge.betweeness.community} returns various information collected
  throught the run of the algorithm. See the return value down here.
}
\value{
  \code{edge.betweenness.community} returns a \code{\link{communities}}
  object, please see the \code{\link{communities}} manual page for
  details.
}
\author{Gabor Csardi \email{csardi.gabor@gmail.com}}
\seealso{ \code{\link{edge.betweenness}} for the definition and
  calculation of the edge betweenness,
  \code{\link{walktrap.community}}, \code{\link{fastgreedy.community}},
  \code{\link{leading.eigenvector.community}} for other community
  detection methods.

  See \code{\link{communities}} for extracting the results of the
  community detection.
}
\references{M Newman and M Girvan: Finding and evaluating community
  structure in networks, \emph{Physical Review E} 69, 026113 (2004)
}
\examples{
g <- barabasi.game(100,m=2)
eb <- edge.betweenness.community(g)

g <- graph.full(10) \%du\% graph.full(10)
g <- add.edges(g, c(1,11))
eb <- edge.betweenness.community(g)
eb
}
\keyword{graphs}
