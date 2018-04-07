#' Takes a downloaded match list and tidies the match statistics.
#'
#' \code{tidyMatch} Takes the downloaded match list, and tidies match statistics
#' in preparation for further analysis.
#'
#' @param match List of match details.
#' @return A tidy dataframe containing match statistics.
#' 
#' @export
tidyMatch <- function(match) {
    team_stats <- match$teamPeriodStats$team
    team_stats <- dplyr::bind_rows(team_stats)
    team_info <- match$teamInfo$team
    team_info <- dplyr::bind_rows(team_info)
    team_stats <- dplyr::left_join(team_stats, team_info, by = "squadId")
    ## Check if there was overtime (matchInfo)
    final_period <- match$matchInfo$periodCompleted
    team_stats <- team_stats %>%
        dplyr::filter(period <= final_period) %>%
        tidyr::gather(stat, value, -squadId, -squadName,
                      -squadNickname, -squadCode)
    team_stats
}

#' Takes a downloaded match list and tidies the player statistics.
#'
#' \code{tidyPlayers} Takes the downloaded match list, and tidies player
#' statistics in preparation for further analysis.
#'
#' @param match List of match details.
#' @return A tidy dataframe containing player statistics.
#' 
#' @export
tidyPlayers <- function(match) {
    team_stats <- match$teamPeriodStats$team
    team_stats <- dplyr::bind_rows(team_stats)
    team_info <- match$teamInfo$team
    team_info <- dplyr::bind_rows(team_info)
    team_stats <- dplyr::left_join(team_stats, team_info, by = "squadId")
    ## Check if there was overtime (matchInfo)
    final_period <- match$matchInfo$periodCompleted
    team_stats <- team_stats %>%
        dplyr::filter(period <= final_period) %>%
        tidyr::gather(stat, value, -squadId, -squadName,
                      -squadNickname, -squadCode)
    team_stats
}
