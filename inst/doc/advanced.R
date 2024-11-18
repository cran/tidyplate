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
file <- system.file("extdata", 
                    "example_12_well.xlsx", 
                    package = "tidyplate")
csv_files <- list.files(path = file, 
                        pattern = "*.csv",
                        full.names = TRUE)

names <- tools::file_path_sans_ext(basename(csv_files))

# Loop through the filenames and assign data
for(i in seq_along(csv_files)) {
  assign(names[i], tidy_plate(csv_files[i]))
}

## -----------------------------------------------------------------------------
# Initialize an empty list to store tibbles for each file
tb_csv_list <- list()

# Loop through the filenames and assign data
for(i in seq_along(csv_files)) {
  tb_csv_list[[i]] <- tidy_plate(csv_files[i])
}

## -----------------------------------------------------------------------------
# as individual tibbles
xl_file <- system.file("extdata", 
                       "multisheet_example.xlsx", 
                       package = "tidyplate")

sheets <- readxl::excel_sheets(xl_file)

for (sheet in sheets) {
  tb <- tidy_plate(xl_file, sheet = sheet)
  name <- paste0("tb_", sheet)
  assign(name, tb)
}

# as elements of a list
# Initialize an empty list to store tibbles for each sheet
tb_xl_list <- list()

for (sheet in sheets) {
  tb_xl_list[[sheet]] <- tidy_plate(xl_file, sheet = sheet)
}

