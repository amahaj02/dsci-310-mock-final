#' Make predictions using a linear model
#'
#' @param model A linear model object
#' @param df A dataframe to predict on
#' @return A dataframe with added 'predicted_rating' column
#' @export
predict_ratings <- function(model, df) {
  df$predicted_rating <- predict(model, newdata = df)
  df
}

#' Plot actual vs predicted ratings
#'
#' @param df A dataframe with 'rating' and 'predicted_rating' columns
#' @param model A linear model object
#' @param filename File path to save the plot
#' @export
plot_predictions <- function(df, model, filename) {
  p <- ggplot(df, aes(x = rating, y = predicted_rating)) +
    geom_point() +
    geom_abline(
      intercept = model$coefficients[1],
      slope = model$coefficients[2],
      color = "blue"
    ) +
    labs(title = "Fitted Model")
  ggsave(filename, plot = p)
}
