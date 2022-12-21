# this script analyzes the results of the retro pilot
# conducted using v2 of the R and R decision letter coding scheme

library(tidyverse)
library(googledrive)
library(googlesheets4)
library(purrr)

###### functions
drive_auth(email = TRUE)
#source function scripts
source("../tools/fn_gdrive.R")

#get spreadsheet

get_retro_inclusion_pilot_sheet_id <- function(version) {

dribble <- research_drive_ls("Projects") %>%
  pull(id) |>
  drive_ls("R3CT") |>
  pull(id) |>
  drive_ls("Methods") |>
  pull(id) |>
  drive_ls("retrospective_pilots") |>
  pull(id) |>
  drive_ls("coding", type = "spreadsheet")

id <- dribble |>
  filter(str_detect(name, version)) |>
  pull(id)

return(id)

}


###### import data

get_retro_inclusion_pilot_sheet_id("v2") |>
  sheet_properties()

coder1 <- get_retro_inclusion_pilot_sheet_id("v2") |>
  read_sheet("macie") |>
  mutate(coder = 1) |>
  glimpse()

coder2 <- get_retro_inclusion_pilot_sheet_id("v2") |>
  read_sheet("hannah") |>
  mutate(coder = 2,
         decision_date = as.Date(decision_date)) |>
  glimpse()

##### wrangle data

pilot_v2 <- coder1 |>
  full_join(coder2)

#clean up
rm(coder1, coder2)

