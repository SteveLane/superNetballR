#' Calculates the total goals of the match
#'
#' \code{matchPoints} calculates final match goals and score difference.
#'
#' @param df Match data.
#'
#' @return A data frame containing the final scores, and points for the ladder.
#' @export
matchPoints <- function(df) {
    ## This first section calculates points based on the old system.
    goals <- df %>%
        dplyr::filter(stat == "goals") %>%
        dplyr::group_by(squadName) %>%
        dplyr::summarise(goals = sum(value))
    home <- df %>%
        dplyr::filter(stat == "homeTeam") %>%
        dplyr::group_by(squadName) %>%
        dplyr::select(-period) %>%
        dplyr::distinct()
    goals <- dplyr::left_join(goals, home, by = "squadName") %>%
        dplyr::arrange(value)
    score_diff <- diff(goals[['goals']])
    goals <- goals %>%
        dplyr::mutate(
                   score_diff = score_diff,
                   score_diff = ifelse(value == 0, score_diff * (-1),
                                       score_diff),
                   points = dplyr::case_when(
                                       score_diff > 0 ~ 2,
                                       score_diff < 0 ~ 0,
                                       TRUE ~ 1
                                   ),
                   ## Points for a win (new rules)
                   points_new = dplyr::case_when(
                                       score_diff > 0 ~ 4,
                                       score_diff < 0 ~ 0,
                                       TRUE ~ 2
                                       )
               ) %>%
        dplyr::rename(isHome = value) %>%
        dplyr::select(-stat)

    ## This section calculates points based on the new system (points for
    ## winning quarters)
    goals_new <- df %>%
        dplyr::filter(stat == "goals")
    homeScores <- goals_new %>%
        dplyr::filter(squadName == home[['squadName']][home[['value']] == 1]) %>%
        dplyr::select(period, homeSquad = squadName, homeValue = value)
    awayScores <- goals_new %>%
        dplyr::filter(squadName == home[['squadName']][home[['value']] == 0]) %>%
        dplyr::select(period, awaySquad = squadName, awayValue = value)
    scores <- dplyr::left_join(homeScores, awayScores, by = "period") %>%
        dplyr::mutate(qtr_diff = homeValue - awayValue,
               homePoints = dplyr::case_when(qtr_diff > 0 ~ 1,
                                             TRUE ~ 0),
               awayPoints = dplyr::case_when(qtr_diff < 0 ~ 1,
                                             TRUE ~ 0)
               )
    points_new <- scores %>%
        dplyr::group_by(homeSquad, awaySquad) %>%
        dplyr::summarise(homePoints = sum(homePoints),
                         awayPoints = sum(awayPoints)) %>%
        dplyr::ungroup()
    df1 <- points_new %>%
        dplyr::select(contains("home")) %>%
        dplyr::rename(squadName = homeSquad, points_qtr = homePoints)
    df2 <- points_new %>%
        dplyr::select(contains("away")) %>%
        dplyr::rename(squadName = awaySquad, points_qtr = awayPoints)
    points_new <- dplyr::bind_rows(df1, df2)

    ## Now join back on to original scoring.
    goals <- dplyr::left_join(goals, points_new, by = "squadName") %>%
        dplyr::mutate(points_new = points_new + points_qtr) %>%
        dplyr::select(-points_qtr)

    ## Return
    goals
}
