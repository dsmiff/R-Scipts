#!/usr/bin/env Rscript
# Dom Smith <dosmith@cern.ch>

library('lattice', warn.conflicts = FALSE, quietly = TRUE)
library('latticeExtra', warn.conflicts = FALSE, quietly = TRUE)
library('grid', warn.conflicts = FALSE, quietly = TRUE)
library('RColorBrewer', warn.conflicts = FALSE, quietly = TRUE)
library('methods', warn.conflicts = FALSE, quietly = TRUE)
library('colorspace', warn.conflicts = FALSE, quietly = TRUE)

##__________________________________________________________________||
save.figure.png <- function(fig, id, outDir, width=4, height=4)
 {
 
 dir.create(file.path(outDir,''), showWarnings = FALSE)
 outPath <- file.path(outDir, paste(id,".png",sep=""))
 print(outPath)
 png(file=outPath)
 dev.off()

}