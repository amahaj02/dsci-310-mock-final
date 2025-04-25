source("R/eda_utils.R")
library(testthat)
library(ggplot2)

test_that("summarize_movies returns a dataframe with correct columns", {
  df <- data.frame(runtime = c(100, 110), rating = c(7, 8), budget = c(5000000, 7000000))
  out <- summarize_movies(df)
  expect_true(all(c("avg_runtime", "avg_rating", "avg_budget") %in% colnames(out)))
  expect_equal(nrow(out), 1)
})

test_that("plot_scatter creates and saves a PNG", {
  df <- data.frame(x = rnorm(10), y = rnorm(10))
  file <- tempfile(fileext = ".png")
  plot_scatter(df, x, y, file)
  expect_true(file.exists(file))
})
