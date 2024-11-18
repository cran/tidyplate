## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "man/figures/README-",
  out.width = "100%"
)

## -----------------------------------------------------------------------------
library(tidyplate)

## -----------------------------------------------------------------------------
try({
library(tidyplate)
file <- system.file("extdata", 
                    "example_12_well.xlsx", 
                    package = "tidyplate")
check_plate(file) # No error for valid file

incorrect_file <- system.file("extdata",
                              "incorrect_format.csv",
                              package = "tidyplate")
check_plate(incorrect_file) # Error type displayed
})

## -----------------------------------------------------------------------------
# build_plate(plate_type = 96,
#             n_plates = 2,
#             file_type = "xlsx") # default is csv

## -----------------------------------------------------------------------------
view_plate_names(file)

## -----------------------------------------------------------------------------
data <- tidy_plate(file)
head(data)

## -----------------------------------------------------------------------------
# generate_plate(data, well_id = "well", plate_type = 12, file = "plate.csv")

