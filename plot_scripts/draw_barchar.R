#!/usr/bin/env Rscript
# Dom Smith <dosmith@cern.ch>

library('plyr', warn.conflicts = FALSE, quietly = TRUE)
library(ggplot2)
##__________________________________________________________________||
args = commandArgs(trailingOnly=TRUE)

##__________________________________________________________________||
savePlot <- function(myPlot) {
	 pdf("myPlot.pdf")
	 print(myPlot)
	 dev.off()
	 }

##__________________________________________________________________||
drawBarChart <- function(df)
 {
 print(df)
 myPlot <- ggplot(data=df, aes(x=mass_points, y=exprValue))+
     geom_bar(stat="identity") +
     scale_x_discrete(limits= df$mass_points)

 savePlot(myPlot)		
 #expRvalue.v <- df$exprValue
 #barplot(expRvalue.v,
 #)
 
 }
##__________________________________________________________________||
main <- function(inputFiles)
 {
 ret <- data.frame()
 for(file in inputFiles)
  {
     d <- read.table(file, header=TRUE)
     ret <- rbind(ret,d) 
     drawBarChart(ret)
    }		
 }

##__________________________________________________________________||
main(inputFiles = args)