source("R/model_utils.R")
library(testthat)

test_that("fit_rating_model returns an lm object", {
  df <- data.frame(rating = c(7, 8), budget = c(5000000, 8000000))
  model <- fit_rating_model(df)
  expect_s3_class(model, "lm")
})

test_that("summarize_model returns a dataframe", {
  df <- data.frame(rating = c(7, 8), budget = c(5000000, 8000000))
  model <- fit_rating_model(df)
  summary_df <- summarize_model(model)
  expect_true("Estimate" %in% colnames(summary_df))
})
