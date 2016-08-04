#!/usr/bin/env Rscript
# Dom Smith <dosmith@cern.ch>

##__________________________________________________________________||
argv <- commandArgs(trailingOnly = FALSE)

##__________________________________________________________________||
drawLine <- function(tbl, x_var, y_vars)
 {

 png(file='line_graph.png')
 xvar <- tbl[[x_var]]

 yVars <- ifelse(length(y_vars)>1,TRUE,FALSE)
 y_var <- y_vars[1]
 yvar <- tbl[[y_var]]
 
 plot(xvar, yvar,type = "o", col = "red", xlab = "minChi", ylab="Events", main="line graph")

 if(yVars){ 
     for (var in 2:length(y_vars)){
          newy_var <- tbl[[y_vars[var]]]
	  lines(xvar,newy_var,type='o', col='blue')
	  }
       }

 legend("topright", y_vars,cex=0.8, fill =rainbow(length(y_vars)))

 dev.off()

 }

##__________________________________________________________________||
main <- function()
 {

 tblFileName <- 'tbl_ncomb_minChi.txt'
 tblPath <- file.path('./',tblFileName)
 if(!(file.exists(tblPath))) return() 	 

 tbl <- read.table(tblPath, head = TRUE)

 x_var <- 'minChi'
 #y_var <- 'QCD'
 y_vars <- c('QCD','TTJets') 

 drawLine(tbl, x_var, y_vars)
 
 }

##__________________________________________________________________||
main()