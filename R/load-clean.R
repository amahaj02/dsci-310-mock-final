#' Load raw movie data
#'
#' Loads the raw CSV file with janitor-cleaned column names
#' @param path A character string of the CSV file path
#' @return A data frame with cleaned column names
#' @export
load_raw_movies <- function(path) {
  readr::read_csv(path) |> janitor::clean_names()
}

#' Clean movie data
#'
#' Drops NA values and filters relevant columns
#' @param df A data frame of raw movies
#' @return A cleaned data frame
#' @export
clean_movies <- function(df) {
  df |>
    dplyr::filter(!is.na(budget), !is.na(rating))
}
