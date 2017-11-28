###########################
#GWAS SIMS - FUNCTIONS
###########################


# Clean heritability data -------------------------------------------------

clean_heritability_data <- function(x, Merged = F)
{
  newparams <- strsplit(x$Full.Iteration.ID,split = "_")
  
  x$Iteration <- as.numeric(unlist(lapply(newparams,function(x) x[5])))
  x$Nsnps <- as.numeric(unlist(lapply(newparams,function(x) x[6])))
  x$Nsnps[x$Nsnps > 150000] <- 200000
  
  x$Nids <- as.numeric(unlist(lapply(newparams,function(x) x[7])))
  head(h1)
  x[,"H2"] <- x$V.G..Vp
  
  if(Merged == T)
  {
    x <- subset(x,Merged == T)
  } else
  {
    if(Merged == F)
    {
      x <- subset(x,Merged == F)
    }
  }
  
  return(x)
}


