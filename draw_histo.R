#!/usr/bin/env Rscript
# Dom Smith <dosmith@cern.ch>

##__________________________________________________________________||
argv <- commandArgs(trailingOnly = FALSE)

##__________________________________________________________________||
main <- function()
 {

 tblFileName <- 'tbl_ncomb_minChi.txt'
 tblPath <- file.path('./',tblFileName)
 if(!(file.exists(tblPath))) return() 	 

 tbl <- read.table(tblPath, head = TRUE)
 print(tbl)

 }

##__________________________________________________________________||
main()