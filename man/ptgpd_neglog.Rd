\name{ptgpd_neglog}
\alias{ptgpd_neglog}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
internal
}
\description{
internal use only
}
\usage{
ptgpd_neglog(x, y, z, mar1 = c(0, 1, 0.1), mar2 = c(0, 1, 0.1), mar3 = c(0, 1, 0.1), dep = 1.5)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{y}{
%%     ~~Describe \code{y} here~~
}
  \item{z}{
%%     ~~Describe \code{z} here~~
}
  \item{mar1}{
%%     ~~Describe \code{mar1} here~~
}
  \item{mar2}{
%%     ~~Describe \code{mar2} here~~
}
  \item{mar3}{
%%     ~~Describe \code{mar3} here~~
}
  \item{dep}{
%%     ~~Describe \code{dep} here~~
}
}
\details{
internal use only
}
\value{
internal use only
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
internal use only
}
\author{
P. Rakonczai
}
\note{
internal use only
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
internal use only
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, y, z, mar1 = c(0, 1, 0.1), mar2 = c(0, 1, 0.1), 
    mar3 = c(0, 1, 0.1), dep = 1.5) 
{
    error = FALSE
    hxyz = NULL
    param = as.numeric(c(mar1, mar2, mar3, dep))
    mux = param[1]
    muy = param[4]
    muz = param[7]
    sigx = param[2]
    sigy = param[5]
    sigz = param[8]
    gamx = param[3]
    gamy = param[6]
    gamz = param[9]
    alpha = param[10]
    if (gamx > 0) {
        epx1 = mux - sigx/gamx
        epx2 = Inf
    }
    else {
        epx1 = -Inf
        epx2 = mux - sigx/gamx
    }
    if (gamy > 0) {
        epy1 = muy - sigy/gamy
        epy2 = Inf
    }
    else {
        epy1 = -Inf
        epy2 = muy - sigy/gamy
    }
    if (gamz > 0) {
        epz1 = muz - sigz/gamz
        epz2 = Inf
    }
    else {
        epz1 = -Inf
        epz2 = muz - sigz/gamz
    }
    if ((min(x) < epx1) | (max(x) > epx2)) {
        error = T
    }
    if ((min(y) < epy1) | (max(y) > epy2)) {
        error = T
    }
    if ((min(z) < epz1) | (max(z) > epz2)) {
        error = T
    }
    if (sigx < 0 | sigy < 0 | sigz < 0 | alpha < 0) {
        error = T
    }
    if (!error) {
        Hxyz = NA
        tx = tr(x, gamx, mux, sigx)
        ty = tr(y, gamy, muy, sigy)
        tz = tr(z, gamz, muz, sigz)
        tx0 = tr(0, gamx, mux, sigx)
        tz0 = tr(0, gamy, muy, sigy)
        ty0 = tr(0, gamz, muz, sigz)
        c0 = -muneglog(tx0, ty0, tz0, alpha = alpha)
        mnl1 = muneglog(tx, ty, tz, alpha = alpha)
        mnl2 = muneglog(pmin(tx, rep(tx0, length(tx))), pmin(ty, 
            rep(tx0, length(tx))), pmin(tz, rep(tz0, length(tz))), 
            alpha = alpha)
        Hxyz = 1/c0 * (mnl1 - mnl2)
    }
    else print("invalid parameter(s)")
    Hxyz
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ internal }
%% \keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
