###########################
#GWAS SIMS - CLEAN
###########################


# Heritability data -------------------------------------------------------

h1 <- clean_heritability_data(h1)
q1 <- clean_heritability_data(q1)

h4 <- clean_heritability_data(h4,Ngens = T)
q4 <- clean_heritability_data(q4,Ngens= T)

