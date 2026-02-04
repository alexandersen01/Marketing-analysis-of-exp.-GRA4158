#i hate R. it is a BS language that does a fraction of what python does with far more complexity, 
#worse runtime and last but not least, worse package management. words cannot describe my hatred for R. 
#You can use '=' and '<-' to assign values to variables and both do the same, except in a few edge-cases 
#where you now spend one week finding the error. It confuses and mixes functional programming and oop not 
#only per entity but also between the usage of them. Want to get a value of entity X? use x.getValue(). 
#Want to get a value of entity Y? Use Y.getValue(y)

setwd("/Users/jakobsverrealexandersen/Documents/Marketing-analysis-of-exp.-GRA4158/tasks/1") #I hate R so much. this file path hell alone is an insult to my intelligence, and I am by no means smart 

library(tidyverse)
library(estimatr)
library(AER)

data = read.csv2('CaseData2026.csv')

head(data)
summary(data)
nrow(data)

#1: non-compliance check, see task for criteria 
treatment_no_exposure = sum(data$test == 1 & data$impressions == 0) #at least the syntax isn't ugly
treatment_total = sum(data$test == 1)
cat("treatment group with 0 impressions:", treatment_no_exposure, 
    "out of", treatment_total, 
    "(", round(treatment_no_exposure/treatment_total * 100, 2), "%)\n") #output stored in terminal and not in here FTW, also I LOVE how the whole code gets catted to the terminal, that's just really cool and makes the output super easy to read. \sarcasm


control_with_exposure = sum(data$test == 0 & data$impressions > 0)
control_total = sum(data$test == 0)
cat("control group with impressions > 0:", control_with_exposure, 
    "out of", control_total, 
    "(", round(control_with_exposure/control_total * 100, 2), "%)\n")

compliance_rate = 1 - (treatment_no_exposure / treatment_total)
cat("compliance rate in treatment group: ", round(compliance_rate * 100, 2), "\n")
