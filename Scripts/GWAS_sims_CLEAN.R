###########################
#GWAS SIMS - CLEAN
###########################


# Heritability data -------------------------------------------------------

h1 <- clean_heritability_data(h1)
q1 <- clean_heritability_data(q1)

h2 <- clean_heritability_data(h2,Ngens = T)
q2 <- clean_heritability_data(q2,Ngens = T)

h4 <- clean_heritability_data(h4,Ngens = T)
q4 <- clean_heritability_data(q4,Ngens= T)

g4$Nids <- g4$Nids * 10
h4$Nids <- h4$Nids * 10

g4$Nsnps[g4$Nsnps > 150000] <- 2e05
fp$Nsnps[fp$Nsnps > 150000] <- 2e05

