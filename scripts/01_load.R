# 01_load.R
library(readr)
library(janitor)
if (!dir.exists("results/figures")) dir.create("results/figures", recursive = TRUE)
if (!dir.exists("results/tables")) dir.create("results/tables", recursive = TRUE)
if (!dir.exists("data/processed")) dir.create("data/processed", recursive = TRUE)
# Load raw data
movies <- read_csv("data/raw/raw.csv")

# Clean column names
movies <- clean_names(movies)

# Save cleaned data
write_csv(movies, "data/processed/movies_clean.csv")