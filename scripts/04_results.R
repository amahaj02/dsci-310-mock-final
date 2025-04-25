library(readr)
library(tidyverse)
source("R/results_utils.R")

if (!dir.exists("results/tables")) dir.create("results/tables", recursive = TRUE)
if (!dir.exists("results/figures")) dir.create("results/figures", recursive = TRUE)

movies <- read.csv("data/processed/movies_clean.csv")
model <- readRDS("results/model.rds")

movies <- predict_ratings(model, movies)
write.csv(movies, "results/tables/predictions.csv")

plot_predictions(movies, model, "results/figures/fitted.png")
