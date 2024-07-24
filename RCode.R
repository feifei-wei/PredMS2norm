# install.packages(c("tidyverse","mlr"))
library(tidyverse)
library(mlr)

# input
input = read_csv("input.csv") %>% 
  mutate("MS2norm" = NA) %>% 
  select(MS2norm, MaxMascotIonScore, MinRank, AliphaticIndex, ClinPredSynRTRatio)

# predict using the Random Forest model trained by 306 candidate peptides in Ref
load ("PredMS2norm.RData") 
result = predict(model, newdata = input) 
output = result$data$response
write.csv(output,"output.csv") # save the result as "output.csv"

# Ref: https://doi.org/10.1016/j.csbj.2024.01.023