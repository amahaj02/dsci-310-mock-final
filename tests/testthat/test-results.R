source("R/results_utils.R")
library(testthat)

test_that("predict_ratings adds predicted_rating column", {
  df <- data.frame(rating = c(7, 8), budget = c(5000000, 8000000))
  model <- lm(rating ~ budget, data = df)
  pred_df <- predict_ratings(model, df)
  expect_true("predicted_rating" %in% colnames(pred_df))
})

test_that("plot_predictions saves a plot file", {
  df <- data.frame(rating = c(7, 8), budget = c(5000000, 8000000))
  model <- lm(rating ~ budget, data = df)
  df <- predict_ratings(model, df)
  file <- tempfile(fileext = ".png")
  plot_predictions(df, model, file)
  expect_true(file.exists(file))
})
