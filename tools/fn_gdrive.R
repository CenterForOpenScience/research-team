# this script houses functions for working with google drive files

require(googledrive)
require(dplyr)
require(stringr)

# pull the id of an item in a folder based on a regex string (in quotation marks)
# if confused about "dribble" read the googledrive documentation
get_nested_gdir_id <- function(string, research_drive_project = TRUE, dribble = NULL) {

  if (!research_drive_project) {

  id <- dribble |>
    filter(str_detect(name, string)) |>
    pull(id)

  return(id)

  }

  if (research_drive_project) {

    id <- shared_drive_find("Metascience Research Team") |>
      drive_ls() |>
      filter(str_detect(name, "Projects")) |>
      pull(id) |>
      drive_ls() |>
      filter(str_detect(name, string)) |>
      pull(id)

    return(id)

  }
}




