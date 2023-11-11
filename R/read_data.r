read_data <- function(datapath) {
  read_csv(datapath) |>
    clean_names() |>
    # for all variables with fewer than 10 unique values, convert to factor
    mutate(across(where(~ length(unique(.)) < 10), factor))
}
