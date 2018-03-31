#' Takes a downloaded match list and tidies.
#'
#' \code{tidyMatch} Takes the downloaded match list, and tidies in preparation
#' for further analysis.
#'

tidyMatch <- function(match) {
    teamStats <- match$teamPeriodStats$team
    teamStats <- dplyr::bind_rows(teamStats)
    teamInfo <- match$teamInfo$team
    teamInfo <- dplyr::bind_rows(teamInfo)
    teamStats <- dplyr::left_join(teamStats, teamInfo, by = "squadId")
    ## Check if there was overtime (matchInfo)
    
