## To draw shapes based on a small set of parameters
## the default parameter set draws the shape of an elephant

## Inspired by: 
## Mayer, J., Khairy, K., Howard, J.
## Drawing an elephant with four complex parameters
## Am.J.Phys. 78: 648-649, 2010

## JHGM van Beek. 13 February 2018
## Open source software under the GNU Public License v3.

## the parameters can be modified
## the length of the arrays can be changed if desirable

## a plot will be drawn on-screen and in a pdf file with time stamp
## the parameters are written to a text file with the same time stamp

## the parameters for the elephant shape
# Ax <- c(0,0,12,0,-14)
# Ay <- c(-60,0,0,0,0)
# Bx <- c(50,18,0,0,0)
# By <- c(-30,8,-10,0,0)

## parameters for experiments
## the length of the arrays can be adapted
Ax <- c(0,0,12,0,-14)
Ay <- c(-60,0,0,0,0)
Bx <- c(50,18,0,0,0)
By <- c(-30,8,-10,0,0)

x_coordinate <- function(t,Ax,Bx) {
  x <- 0
  for (k in 1:length(Ax)) {
    x <- x + Ax[k] * cos(k*t)
  }
  for (k in 1:length(Bx)) {
    x <- x + Bx[k] * sin(k*t)
  }
  x
}

y_coordinate <- function(t,Ay,By) {
  y <- 0
  for (k in 1:length(Ay)) {
    y <- y + Ay[k] * cos(k*t)
  }
  for (k in 1:length(By)) {
    y <- y + By[k] * sin(k*t)
  }
  y
}


x <- numeric()
y <- numeric()
i <- 0.
for (tt in seq(0,6.28,0.01))
{ i<-i+1
  x[i] <- x_coordinate(tt,Ax,Bx)
  y[i] <- y_coordinate(tt,Ay,By)
}

date <- format(Sys.time(),"%d%b%Y_%H.%M")

# the size of the on-screen plot may need to be adapted to obtain a good shape
plot(y,-x,type='l')

pdf(file = paste(".\\Fig_ShapeExperiment_",date,".pdf",sep=""),width = 9, height = 10)
plot(y,-x,type='l')
dev.off()
sink(file=paste(".\\Parameters_ShapeExperiment_",date,".txt",sep=""))
cat("\nAx = ",Ax)
cat("\nBx = ",Bx)
cat("\nAy = ",Ay)
cat("\nBy = ",By)
sink()
