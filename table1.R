rm(list=ls())

library(tidyverse)

load(file="./data/processed/phd_supervisors.rda")
load(file="./data/processed/phds_variables.rda")
load(file="./data/processed/veni_ppf.rda")
load(file = "data/processed/scientists_to_fields1.rda")
load(file = "data/url_to_unique_id.rda")


phds_variables <- phds_variables[phds_variables$start_pub==1 & phds_variables$phd_year>1996 & phds_variables$phd_year<2020,]

phds_variables %>% left_join(phd_supervisors, by="id") -> phds # adding supervisor variables

phds <- phds[!is.na(phds$supervisors),] # removing phds without supervisors


nrow(phds)
nrow(veni_ppf[!duplicated(veni_ppf$id),]) # 6 people less than in phds, because these people got a veni before their PhD graduation date

phds <- phds[phds$id%in%veni_ppf$id,]

phds <- phds[!duplicated(phds$id),]

# centered phd_cohort variable
phds$phd_cohort <- phds$phd_year - 1997

# NOTE: this used to be `levels(phds$field) <- c(...)`, which reassigns labels
# by position instead of by name and silently corrupted every discipline label
# except "Engineering"/"missing" (fixed at the source in mentoring-grants's
# starting.Rmd). If a specific reference-category order is needed here again,
# use fct_relevel() instead, which reorders by matching existing names:
# phds$field <- fct_relevel(phds$field, "Biological and Health Sciences", "Physical and Mathematical Sciences", "Social and Behavioral Sciences", "Engineering", "Agricultural Sciences", "Humanities", "other", "missing")


# Descriptive statistics women

phds_wom <- phds[phds$gender_2=="women",]
ppf_wom <- veni_ppf[veni_ppf$gender_2=="women",]

summary(phds_wom$phd_cohort)
mean(phds_wom$phd_cohort)
sd(phds_wom$phd_cohort)

summary(phds_wom$teamsize)
mean(phds_wom$teamsize)
sd(phds_wom$teamsize)

summary(phds_wom$npubs_sv_norm)
mean(phds_wom$npubs_sv_norm)
sd(phds_wom$npubs_sv_norm)

summary(phds_wom$prof2p)
summary(phds_wom$wom_sv1)


ppf_wom %>%
  group_by(id) %>%
  summarize(npubs_cumul = mean(npubs_cumul),
            npubs_prev = mean(npubs_prev),
            veni = max(veni)) -> ppf_wom

summary(ppf_wom$veni)

summary(as.factor(ppf_wom$veni))



# summary(ppf_wom$npubs_cumul)
# mean(ppf_wom$npubs_cumul)
# sd(ppf_wom$npubs_cumul)
# 
# summary(ppf_wom$npubs_prev)
# mean(ppf_wom$npubs_prev)
# sd(ppf_wom$npubs_prev)

round(prop.table(table(phds_wom$field)), 3)

round(prop.table(table(phds_wom$uni)), 3)


# Descriptive statistics men

phds_men <- phds[phds$gender_2=="men",]
ppf_men <- veni_ppf[veni_ppf$gender_2=="men",]


summary(phds_men$phd_cohort)
mean(phds_men$phd_cohort)
sd(phds_men$phd_cohort)

summary(phds_men$teamsize)
mean(phds_men$teamsize)
sd(phds_men$teamsize)

summary(phds_men$npubs_sv_norm)
mean(phds_men$npubs_sv_norm)
sd(phds_men$npubs_sv_norm)

summary(phds_men$prof2p)
summary(phds_men$wom_sv1)

ppf_men %>%
  group_by(id) %>%
  summarize(npubs_cumul = mean(npubs_cumul),
            npubs_prev = mean(npubs_prev),
            veni = max(veni)) -> ppf_men

summary(ppf_men$veni)
summary(as.factor(ppf_men$veni))

# summary(ppf_men$npubs_cumul)
# mean(ppf_men$npubs_cumul)
# sd(ppf_men$npubs_cumul)
# 
# summary(ppf_men$npubs_prev)
# mean(ppf_men$npubs_prev)
# sd(ppf_men$npubs_prev)

round(prop.table(table(phds_men$field)), 3)

round(prop.table(table(phds_men$uni)), 3)



# time to veni

veni_ppf %>%
  filter(veni==1) %>% 
  summarize(medtime = median(time),
            meantime = mean(time)) -> timetoveni

veni_ppf %>%
  filter(veni==1 & gender_2=="women") %>%
  summarize(meantime = mean(time), 
            maxtime = max(time),
            mintime = min(time),
            sdtime = sd(time)) -> timetoveniwom

veni_ppf %>%
  filter(veni==1 & gender_2=="men") %>%
  summarize(meantime = mean(time), 
               maxtime = max(time),
               mintime = min(time),
               sdtime = sd(time)) -> timetoveniman

# mean time to veni for women and men: 2.57 and 2.31


# publications: veni
ppf_wom %>%
  filter(veni==1) %>%
  summarize(mincumul = min(npubs_cumul),
            maxcumul = max(npubs_cumul),
            meancumul = mean(npubs_cumul),
            sdcumul = sd(npubs_cumul),
            minprev = min(npubs_prev),
            maxprev = max(npubs_prev),
            meanprev = mean(npubs_prev),
            sdprev = sd(npubs_prev)) -> wompubs1


ppf_men %>%
  filter(veni==1) %>%
  summarize(mincumul = min(npubs_cumul),
            maxcumul = max(npubs_cumul),
            meancumul = mean(npubs_cumul),
            sdcumul = sd(npubs_cumul),
            minprev = min(npubs_prev),
            maxprev = max(npubs_prev),
            meanprev = mean(npubs_prev),
            sdprev = sd(npubs_prev)) -> menpubs1


# publications: no Veni
veni_ppf %>%
  filter(gender_2=="women" & veni==0 & time==2) %>%
  summarize(mincumul = min(npubs_cumul),
            maxcumul = max(npubs_cumul),
            meancumul = mean(npubs_cumul),
            sdcumul = sd(npubs_cumul),
            minprev = min(npubs_prev),
            maxprev = max(npubs_prev),
            meanprev = mean(npubs_prev),
            sdprev = sd(npubs_prev)) -> wompubs0

veni_ppf %>%
  filter(gender_2=="men" & veni==0 & time==2) %>%
  summarize(mincumul = min(npubs_cumul),
            maxcumul = max(npubs_cumul),
            meancumul = mean(npubs_cumul),
            sdcumul = sd(npubs_cumul),
            minprev = min(npubs_prev),
            maxprev = max(npubs_prev),
            meanprev = mean(npubs_prev),
            sdprev = sd(npubs_prev)) -> menpubs0


nrow(veni_ppf[veni_ppf$veni==1 & veni_ppf$gender_2=="women",])
nrow(veni_ppf[veni_ppf$veni==1 & veni_ppf$gender_2=="men",])




