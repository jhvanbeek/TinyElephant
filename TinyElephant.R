## This tiny program in R draws the (crude) shape of an elephant.
## It implements the equations in 
## Mayer, J., Khairy, K., Howard, J.
## Drawing an elephant with four complex parameters
## Am.J.Phys. 78: 648-649, 2010
## 
## To execute this program, install the open source R environment: www.r-project.org
## One of the ways to run it in the R Graphical User Interface is to set the working directory
## to the directory containing this file and type at the prompt:
## source("TinyElephant.R")
## 

## The parameters in the equations can of be modified to experiment with drawing
## various shapes. See also R script± ShapeExperiment.R

## Note that (y,-x) is plotted, rather than (x,y). However, this is how it appears to be plotted in the
## paper. 
## Note that parameter k in the paper is not restricted to 1-4. 


## JHGM van Beek. 13 February 2018

## Open source software under the GPU license.

x_coordinate <- function(t) {
  x <- 50*sin(t) + 18*sin(2*t) + 12 * cos(3*t) - 14*cos(5*t)
  x
}

y_coordinate <- function(t) {
  y <- -30*sin(t) + 8*sin(2*t) - 10*sin(3*t) -60*cos(t)
  y
}

x <- numeric()
y <- numeric()
i <- 0.
for (tt in seq(0,6.28,0.01))#10
{ i<-i+1
  x[i] <- x_coordinate(tt)
  y[i] <- y_coordinate(tt)
}

# the size of the on-screen plot may need to be adapted to see the right proportions
plot(y,-x,type='l')

pdf(file = paste(".\\Fig_Elephant_",format(Sys.time(),"%d%b%Y_%H.%M"),".pdf",sep=""),width = 9, height = 10)
plot(y,-x,type='l')
dev.off()