###########################
#GWAS SIMS - LOAD
###########################


# Load libraries ----------------------------------------------------------

library(ggplot2)
library(plyr)
library(magrittr)
library(extRemes)
library(lme4)
library(arm)

# Load data ---------------------------------------------------------------

#Heritability
h1 <- read.csv("Data/Scenario_1_parsed_results/Scenario_1_genomic_heritabilities.csv",stringsAsFactors = F)


#GWAS
g1 <- read.csv("Data/Scenario_1_parsed_results/Scenario_1_GWAS_results.csv",stringsAsFactors = F)


#QTL
q1 <- read.csv("Data/Scenario_1_parsed_results/Scenario_1_qtl_effect_sizes.csv",stringsAsFactors = F)
