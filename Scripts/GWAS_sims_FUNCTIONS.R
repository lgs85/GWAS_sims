###########################
#GWAS SIMS - FUNCTIONS
###########################


# Clean heritability data -------------------------------------------------

clean_heritability_data <- function(x,Ngens = F)
{
  newparams <- strsplit(x$Full.Iteration.ID,split = "_")
  if(Ngens == T) newparams <-  lapply(newparams,function(x) x[c(1:4,6:9)])
  
  x$Iteration <- as.numeric(unlist(lapply(newparams,function(x) x[5])))
  x$Nsnps <- as.numeric(unlist(lapply(newparams,function(x) x[6])))
  x$Nsnps[x$Nsnps > 150000] <- 200000
  
  x$Nids <- as.numeric(unlist(lapply(newparams,function(x) x[7])))
  head(h1)
  x[,"H2"] <- x$V.G..Vp
  
  return(x)
}


