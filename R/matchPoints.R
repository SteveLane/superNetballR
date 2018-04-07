#' Calculates the total goals of the match
#'
#' \code{matchPoints} calculates final match goals and score difference.
#'
#' @param data Match data.
#' @param round Round that the match was played.
#' @param game Game number during the round.
#'
#' @return A data frame containing the final scores, and points for the ladder.
#' @export
matchPoints <- function(data, round_num, game_num) {
    data <- data %>%
        dplyr::filter(round == round_num, game == game_num)
    goals <- data %>%
        dplyr::filter(stat == "goals") %>%
        dplyr::group_by(squadName) %>%
        dplyr::summarise(goals = sum(value))
    home <- data %>%
        dplyr::filter(stat == "homeTeam") %>%
        dplyr::group_by(squadName) %>%
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
                                       )
               ) %>%
        dplyr::select(-stat, -value)
    goals
}
