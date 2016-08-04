#!/usr/bin/env Rscript
# Dom Smith <dosmith@cern.ch>

##__________________________________________________________________||
argv <- commandArgs(trailingOnly = FALSE)

##__________________________________________________________________||
drawBox <- function(tbl,variable, process)
 {

 png(file='boxplot.png')
 boxplot(QCD ~ minChi, data=tbl, xlab=variable, ylab=process, main='Yields')
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
 variable <- c("minChi")
 df <- cbind(tbl[variable], tbl[,mainProcesses])

 drawBox(df, 'minChi', 'QCD')

 }

##__________________________________________________________________||
main()