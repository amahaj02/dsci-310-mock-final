if (!dir.exists("results/figures")) dir.create("results/figures", recursive = TRUE)
if (!dir.exists("results/tables")) dir.create("results/tables", recursive = TRUE)
if (!dir.exists("data/processed")) dir.create("data/processed", recursive = TRUE)
movies <- read.csv("data/processed/movies_clean.csv")

model <- lm(movies$rating ~ movies$budget)
model_summary <- summary(model)$coefficients

write.csv(as.data.frame(model_summary), "results/tables/model_summary.csv")

# Save model object
saveRDS(model, file = "results/model.rds")