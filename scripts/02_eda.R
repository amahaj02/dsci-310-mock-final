library(dplyr)
library(ggplot2)
if (!dir.exists("results/figures")) dir.create("results/figures", recursive = TRUE)
if (!dir.exists("results/tables")) dir.create("results/tables", recursive = TRUE)
if (!dir.exists("data/processed")) dir.create("data/processed", recursive = TRUE)
movies <- read.csv("data/processed/movies_clean.csv")
head(movies)

# Summary table
summary_table <- movies %>%
  summarise(
    avg_runtime = mean(runtime, na.rm = TRUE),
    avg_rating = mean(rating, na.rm = TRUE),
    avg_budget = mean(budget, na.rm = TRUE)
  )

write.csv(summary_table, "results/tables/summary.csv")

plot <- ggplot(movies, aes(x = runtime, y = rating)) +
  geom_point() +
  labs(title = "Runtime vs. IMDb Rating")

ggsave("results/figures/viz.png", plot)