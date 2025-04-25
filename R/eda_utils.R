#' Summarize movie dataset
#'
#' Computes average runtime, rating, and budget
#' @param df A dataframe with at least 'runtime', 'rating', and 'budget' columns
#' @return A one-row dataframe with summary statistics
#' @export
summarize_movies <- function(df) {
  df |>
    dplyr::summarise(
      avg_runtime = mean(runtime, na.rm = TRUE),
      avg_rating = mean(rating, na.rm = TRUE),
      avg_budget = mean(budget, na.rm = TRUE)
    )
}

#' Plot and save a scatterplot
#'
#' Plots a scatterplot of two variables and saves to file
#' @param df A dataframe
#' @param x Variable to plot on x-axis (unquoted)
#' @param y Variable to plot on y-axis (unquoted)
#' @param filename Output filename (e.g. "results/figures/viz.png")
#' @export
plot_scatter <- function(df, x, y, filename) {
  p <- ggplot(df, aes(x = {{ x }}, y = {{ y }})) +
    geom_point() +
    labs(title = paste(deparse(substitute(x)), "vs", deparse(substitute(y))))
  ggsave(filename, p)
}
