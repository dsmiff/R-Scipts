#!/usr/bin/env Rscript
# Dom Smith <dosmith@cern.ch>

##__________________________________________________________________||
argv <- commandArgs(trailingOnly = FALSE)

##__________________________________________________________________||
drawPie <- function(data, labels)
{

 png(file='smTotals_pie.png')
 piepercent<- round(100*data/sum(data), 1)

 pie(data, labels=piepercent, main='SM Backgrounds', col=rainbow(length(data)))
 legend("topright", labels, cex = 0.8,
   fill = rainbow(length(data)))

dev.off()
 
}

##__________________________________________________________________||
main <- function()
{

 tblFileName <- 'tbl_ncomb_minChi.txt'
 tblPath <- file.path('./',tblFileName)
 if(!(file.exists(tblPath))) return() 	 

 tbl <- read.table(tblPath, head = TRUE)

 mainProcesses <- c("DYJetsToLL","DiBoson","QCD","SingleTop","TTJets","WJetsToLNu","Zinv")
 df <- tbl[,mainProcesses]
 df <- head(df,1)  

 data <- as.numeric(df[1,])
 drawPie(data, mainProcesses)

}

##__________________________________________________________________||
main()