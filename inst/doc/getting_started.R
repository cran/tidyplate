## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "man/figures/README-",
  out.width = "100%"
)

## ----image, echo=FALSE, fig.cap = "This figure demonstrates how to format the 12-well plate input file. Colors are for visualization purposes only.", out.width = '100%'----
knitr::include_graphics("../man/figures/README_tidy_plate.png")

## ----check_plate-xlsx, error=TRUE---------------------------------------------
library(tidyplate)
file <- system.file("extdata", 
                    "example_12_well.xlsx", 
                    package = "tidyplate")
check_plate(file) # No error for valid file

incorrect_file <- system.file("extdata",
                              "incorrect_format.csv",
                              package = "tidyplate")
check_plate(incorrect_file) # Error type displayed

## ----build-plate-demo, echo=TRUE, eval=FALSE----------------------------------
#  build_plate(plate_type = 96,
#              n_plates = 2,
#              file_type = "xlsx") # default is csv

## ----view-plate-names-xlsx----------------------------------------------------
view_plate_names(file)

## ----tidy_plate-xlsx----------------------------------------------------------
data <- tidy_plate(file)
head(data)

## ----csv_multiple_tb----------------------------------------------------------
csv_files <- list.files(path = file, 
                        pattern = "*.csv",
                        full.names = TRUE)

names <- tools::file_path_sans_ext(basename(csv_files))

# Loop through the filenames and assign data
for(i in seq_along(csv_files)) {
  assign(names[i], tidy_plate(csv_files[i]))
}

## ----csv_list-----------------------------------------------------------------
# Initialize an empty list to store tibbles for each file
tb_csv_list <- list()

# Loop through the filenames and assign data
for(i in seq_along(csv_files)) {
  tb_csv_list[[i]] <- tidy_plate(csv_files[i])
}

## ----multi-sheet-demo---------------------------------------------------------
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

