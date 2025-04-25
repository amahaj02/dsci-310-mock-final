#' Fit a linear model to movie data
#'
#' @param df A dataframe with numeric columns 'rating' and 'budget'
#' @return A linear model object
#' @export
fit_rating_model <- function(df) {
  lm(rating ~ budget, data = df)
}

#' Extract model summary coefficients
#'
#' @param model A linear model object
#' @return A dataframe of model coefficients
#' @export
summarize_model <- function(model) {
  summary(model)$coefficients |> as.data.frame()
}

