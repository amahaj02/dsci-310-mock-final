source("R/model_utils.R")

if (!dir.exists("results/tables")) dir.create("results/tables", recursive = TRUE)
if (!dir.exists("results")) dir.create("results", recursive = TRUE)

movies <- read.csv("data/processed/movies_clean.csv")

model <- fit_rating_model(movies)
model_summary <- summarize_model(model)

write.csv(model_summary, "results/tables/model_summary.csv")
saveRDS(model, "results/model.rds")
