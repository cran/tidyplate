% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_plate.R
\name{check_plate}
\alias{check_plate}
\title{Checks whether the input file is valid for use with the \code{tidy_plate()}
function}
\usage{
check_plate(file, well_id = "well", sheet = 1)
}
\arguments{
\item{file}{A character string containing the path to a csv or excel file.}

\item{well_id}{A character string that will be the name for the well id
column.}

\item{sheet}{If file type is xlsx this is the sheet name (character) or
number (integer).}
}
\value{
An message indicating whether the input file is compatible with the
\code{tidy_plate()} function
}
\description{
\code{check_plate()} performs quality checks on the input microwell shaped data and
warns the user if there is any discrepancy. The user can either fix the input
file or use the \code{build_plate()} function to build a template csv or xlsx file.
}
\examples{
file_path <- system.file(
  "extdata",
  "example_12_well.xlsx",
  package = "tidyplate"
)

check_plate(file = file_path)
}
\seealso{
\code{\link[=build_plate]{build_plate()}}
}
