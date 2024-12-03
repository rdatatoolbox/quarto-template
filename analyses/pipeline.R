library(targets)

tar_source() #load functions in R/

list(
  # Make the workflow depends on the raw data file
  tar_target(name = raw_data_file, command = here::here("data", "airquality.csv"), 
             format = "file"), 
  
  # Read the data and return a data.frame
  tar_target(name = raw_data, command = read.csv(raw_data_file)),
  
  # Transform the data
  tar_target(data, raw_data |> dplyr::filter(!is.na(Ozone))),
  
  # Explore the data (custom function)
  tar_target(hist, make_hist(data)), 
  
  # Model the data
  tar_target(fit, lm(Ozone ~ Wind + Temp, data)),
  
  tarchetypes::tar_quarto(report, "report.qmd")
)