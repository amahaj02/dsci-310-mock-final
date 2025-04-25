# 04_results.R
library(readr)
library(tidyverse)
if (!dir.exists("results/figures")) dir.create("results/figures", recursive = TRUE)
if (!dir.exists("results/tables")) dir.create("results/tables", recursive = TRUE)
if (!dir.exists("data/processed")) dir.create("data/processed", recursive = TRUE)
# Load data and model
movies <- read.csv("data/processed/movies_clean.csv")
model <- readRDS("results/model.rds")

# Predict
movies$predicted_rating <- predict(model, newdata = movies)

write.csv(movies, "results/tables/predictions.csv")

# Plot actual vs predicted
p <- ggplot(movies, aes(x = rating, y = predicted_rating)) +
  geom_point() +
  geom_abline(intercept = model$coefficients[1], 
              slope = model$coefficients[2],
              color = "blue") +
  labs(title = "Fitted Model") 

# Save plot
ggsave("results/figures/fitted.png", plot = p)