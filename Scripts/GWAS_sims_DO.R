library(data.table)

dd <- read.csv("Scenario_1_parsed_results/Scenario_1_GWAS_results.csv",stringsAsFactors = F)

head(dd)


QTL <- paste0("Q",c(1:10))
dd <- subset(dd,SNP.Name %in% QTL)

table(dd$SNP.Name)

library(plyr)

x <- ddply(dd,
           .(Nids,Nsnps,HistN,Full.Iteration.ID),
           summarise,
           N_Sig_QTL = sum(Sig.Corrected == "yes"))
x

library(ggplot2)
ggplot(x,
       aes(x = N_Sig_QTL))+
      geom_histogram()+
  facet_wrap(~factor(Nids))+
  theme_bw()





# Heritability ------------------------------------------------------------

h2 <- read.csv("Scenario_1_parsed_results/Scenario_1_genomic_heritabilities.csv",stringsAsFactors = F)
head(h2)

h2 <- subset(h2, Merged == T)

table(h2$Nids,h2$Nsnps)

newparams <- strsplit(h2$Full.Iteration.ID,split = "_")

h2$Nsnps <- as.numeric(unlist(lapply(newparams,function(x) x[6])))
h2$Nsnps[h2$Nsnps > 150000] <- 200000

h2$Nids <- as.numeric(unlist(lapply(newparams,function(x) x[7])))

h2$H2 <- h2$V.G..Vp

vline.dat <- ddply(h2,
                   .(Nids,Nsnps),
                   summarise,
                   med_h2 = median(H2))
  

ggplot(h2,aes(x = H2))+
  geom_density(fill = "orange",alpha = 0.4)+
  geom_vline(aes(xintercept = med_h2),data = vline.dat,col = "red")+
  facet_grid(factor(Nids)~factor(Nsnps))+
  geom_vline(aes(xintercept = 0.4),lty = 2)+
  theme_bw()+
  xlab("Heritability estimates")+
  ylab("Density")



















qtl_eff <- read.csv("Scenario_1_parsed_results/Scenario_1_qtl_effect_sizes.csv")

head(h2)
head(qtl_eff)

h2 <- subset(h2,Merged == T)

h2[1,"logL"]

qtl_eff$LR <- NA

for(i in 1:nrow(qtl_eff))
{
qtl_eff$LR[i] <- unname(lr.test(y = qtl_eff$LogL[i], x = subset(h2,Full.Iteration.ID == qtl_eff$Full.Iteration.ID[1],select = logL)[1,1])$p.value)
}


x <- lr.test(y = qtl_eff$LogL[i], x = subset(h2,Full.Iteration.ID == qtl_eff$Full.Iteration.ID[1],select = logL)[1,1])$p.value
x

unname(x)

str(qtl_eff)

library(extRemes)

i = 30
lr.test(qtl_eff$LogL[i],subset(h2,Full.Iteration.ID == qtl_eff$Full.Iteration.ID[i])$logL)
head(qtl_eff)
head(h2)

qtl_eff <- qtl_eff[complete.cases(qtl_eff),]
qtl_eff <- subset(qtl_eff,heritability == 0.4)

ggplot(qtl_eff,aes(x = factor(Nids),y = -log(LR),col = factor(HistN)))+
  geom_boxplot()


hist(qtl_eff$LR,breaks = 100)


x <- read.table("Wytham.fam")
head(x)
table(x$V1)
