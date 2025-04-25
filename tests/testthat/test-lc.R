source("R/load-clean.R")
library(testthat)

test_that("load_raw_movies loads and cleans column names", {
  tmp <- tempfile(fileext = ".csv")
  write.csv(data.frame(MyRating = 1:3, MyBudget = 4:6), tmp, row.names = FALSE)
  df <- load_raw_movies(tmp)
  expect_true("my_rating" %in% colnames(df))
  expect_true("my_budget" %in% colnames(df))
})

test_that("clean_movies filters NAs", {
  df <- data.frame(
    budget = c(100, NA, 200),
    rating = c(7.0, 8.0, NA),
    genre = c("A", "B", "C")
  )
  result <- clean_movies(df)
  
  expect_false(any(is.na(result$budget)))
  expect_false(any(is.na(result$rating)))
})
