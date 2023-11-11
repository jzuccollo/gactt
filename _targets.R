# Load packages required to define the pipeline:
library(targets)
library(tarchetypes)

# Set target options:
tar_option_set(
  packages = c("tibble", "readr", "dplyr", "janitor", "ggplot2", "feather"),
  format = "feather"
)
options(clustermq.scheduler = "multicore")

# Run the R scripts in the R/ folder with your custom functions:
tar_source()

# Replace the target list below with your own:
list(
  tar_target(
    name = datapath,
    command = file.path("data", "gactt_results_anon.csv"),
    format = "file"
  ),
  tar_target(
    name = gactt_data,
    command = read_data(datapath)
  )
)
