## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "man/figures/README-",
  out.width = "100%"
)

## ----image, echo=FALSE, fig.cap = "This figure demonstrates how to format the 12-well plate input file. Colors are for visualization purposes only.", out.width = '100%'----
knitr::include_graphics("../man/figures/README_tidy_plate.png")

## ----check_plate-xlsx---------------------------------------------------------
library(tidyplate)
file_path <- system.file("extdata", "example_12_well.xlsx", package = "tidyplate")
check_plate(file_path)

## ----tidy_plate-xlsx----------------------------------------------------------
data <- tidy_plate(file_path)
head(data)

