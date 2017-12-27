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

