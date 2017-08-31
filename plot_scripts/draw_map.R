#!/usr/bin/env Rscript
# Dom Smith <dosmith@cern.ch>

library('plyr', warn.conflicts = FALSE, quietly = TRUE)
library(ggplot2)
library(tidyverse)

##__________________________________________________________________||
savePlot <- function(myPlot) {
	 pdf("GB.pdf")
	 print(myPlot)
	 dev.off()
	 }
	 
##__________________________________________________________________||
main <- function()
     {
     gb <- map_data(map = "world", region = "UK")
     sf <- data.frame(long=c(-3.18),lat=(55.95),names=c("Edinburgh"),group=0,stringsAsFactors = FALSE)
     p  <- ggplot(gb, aes(long, lat, group = group)) + geom_polygon(fill = "white", colour = "black") + coord_fixed(1.3)
     plot <- p +  geom_point(data=sf, aes(x=long, y=lat), color="red",size=2)
     savePlot(plot)
}    

##__________________________________________________________________||
main()