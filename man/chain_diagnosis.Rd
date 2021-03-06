% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/diagnostics.R
\name{chain_diagnosis}
\alias{chain_diagnosis}
\title{Plots for assessing MCMC output.}
\usage{
chain_diagnosis(chain, max.chain = 20, chatter = 0)
}
\arguments{
\item{chain}{(list) containing output data from an MCMC, including}

\item{chatter}{(integer) how verbose is the output? 
(0=quiet, 1=normal, 2=verbose)}

\item{max.chains}{maximum no. chains to overlay on trace plot}
}
\value{
none
}
\description{
\code{chain_diagnosis} Generate plots to help assess the convergence 
                 of MCMC output.
                 
Generate plots of chain traces (variable values vs. iteration), 
auto-correlation plots and 1D densities (histograms).
}
\section{Notes}{

The input \code{chain} should be a list such as produced by 
  \code{gw_sampler} or \code{mh_sampler} that contains the following:
\describe{ 
\item{theta}{(array) n * ndim array of posterior samples
            n samples of ndim vectors of parameters}
\item{method}{(string) name of MCMC method used}
\item{nchains}{number of chain/walkers used}
}

The plot for parameter \code{i} contains three panels.

Top: trace plots showing (in different colours) the trace of each chain or
walker for the parameter. The thick black lines shows the trace of the
mean of the chains/walkers (averaged at each iteration).

Bottom left: autocorrelations. Black shows the ACF for the mean of the
chains/walkers. Blue shows the mean of the ACFs of each chain/walker.

Bottom right: historgram of parameter \code{i} over all chains/walkers.
}

\examples{
my_posterior <- function(theta) {
  cov <- matrix(c(1,0.98,0.8,0.98,1.0,0.97,0.8,0.97,2.0), nrow = 3)
  logP <- mvtnorm::dmvnorm(theta, mean = c(-1, 2, 0), sigma = cov, log = TRUE)
  return(logP)
}
chain <- gw_sampler(my_posterior, theta.0 = c(0,0,0), nsteps = 10e4, burn.in = 1e4) 
chain_diagnosis(chain)

}
\seealso{
\code{\link{gw_sampler}}, \code{\link{mh_sampler}}
}
