library(dplyr)
library(ggplot2)
source("R/eda_utils.R")

if (!dir.exists("results/figures")) dir.create("results/figures", recursive = TRUE)
if (!dir.exists("results/tables")) dir.create("results/tables", recursive = TRUE)

movies <- read.csv("data/processed/movies_clean.csv")

# Generate summary
summary_table <- summarize_movies(movies)
write.csv(summary_table, "results/tables/summary.csv")

# Generate and save plot
plot_scatter(movies, budget, rating, "results/figures/viz.png")