# this script houses functions for working with google drive files

require(googledrive)
require(dplyr)
require(stringr)

# shortcut to use googledrive::drive_ls within the research team shared drive
research_drive_ls <- function(string) {

    research_drive_id <- shared_drive_find("Metascience Research Team") |>
      pull(id)

    dribble <- drive_ls(research_drive_id, pattern = string)

    return(dribble)


}




