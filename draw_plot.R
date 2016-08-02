#!/usr/bin/env Rscript
# Dom Smith <dosmith@cern.ch>

##__________________________________________________________________||
argv <- commandArgs(trailingOnly = FALSE)

##__________________________________________________________________||
return.variable <- function(tbl)
 {

 variable <- tbl[1]
 return(variable)

 }		   

##__________________________________________________________________||
remove.columns <- function(tbl, variable, column_name)
 {

# if(exists('variable')) variable <- tbl[variable] else variable <- tbl[1]
# if(exists('column_name')) cname <- tbl[column_name] else return(tbl[1])
 
 varCol <- tbl[variable]
 colTbl <- tbl[column_name]

 d1 <- cbind(varCol, colTbl)
 return(d1)
 }
	
##__________________________________________________________________||
rename.columns <- function(tbl, old_name, new_name)
 {

 colnames(tbl)[which(names(tbl) == old_name)] <- new_name
 return(tbl)

}

##__________________________________________________________________||
main <- function()
{
	
  signals <- c("T1tttt.1400.100.","T1tttt.1500.100.","T1tttt.1600.100.","T1tttt.1700.100.")

  tblFileName <- 'tbl_ncomb_minChi.txt'

  tblPath <- file.path('./', tblFileName)
  if(!(file.exists(tblPath))) return()

  tbl <- read.table(tblPath, header = TRUE)
  variable <- return.variable(tbl)

  smTotal <- tbl['EWK'] + tbl['QCD']

  d1 <- remove.columns(tbl, 'minChi', 'QCD')
  d2 <- cbind(smTotal, d1)
  d3 <- rename.columns(d2, 'EWK', 'TotalSM')	

  print(d3)

}

##__________________________________________________________________||
main()