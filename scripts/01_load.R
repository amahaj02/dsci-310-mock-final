# 01_load.R
library(tidyverse)

source("R/load-clean.R")
if (!dir.exists("data/processed")) dir.create("data/processed", recursive = TRUE)
# Load raw data
movies <- load_raw_movies("data/raw/raw.csv")

# Clean column names
movies <- clean_movies(movies)

# Save cleaned data
write.csv(movies, "data/processed/movies_clean.csv")