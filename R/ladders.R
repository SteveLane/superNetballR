#' Calculates ladder positions
#'
#' \code{ladders} calculates ladder positions at the end of a match.
#'
#' @param df Data frame containing season match statistics.
#' @param round_num Round at which to calculate ladder positions. Optional.
#' @param game_num Game at which to calculate ladder positions. Optional.
#' @param old_system Logical. Whether to sort by the old scoring system
#'     (defaults to FALSE).
#'
#' @return Data frame containing the ladder position of all teams. If round and
#'     game are not supplied, the ladder position is calculated using all match
#'     data present in the \code{df} supplied.
#'
#' @export
ladders <- function(df, round_num = NULL, game_num = NULL, old_system = FALSE) {
    if (!is.null(game_num) && is.null(round_num)) {
        stop("If game number is supplied, round number must also be supplied.")
    }
    match_results <- matchResults(df = df)
    if (!is.null(round_num) && is.null(game_num)) {
        match_results <- match_results %>%
            dplyr::filter(round <= round_num)
    } else if (!is.null(round_num) && !is.null(game_num)) {
        match_results <- match_results %>%
            dplyr::filter(round <= round_num) %>%
            dplyr::filter(!(round >= round_num && game > game_num))
    }
    ladder <- match_results %>%
        dplyr::group_by(squadName) %>%
        dplyr::summarise(
                   games = n(),
                   goals_for = sum(goals),
                   goals_against = sum(goals - score_diff),
                   percentage = goals_for / goals_against,
                   points = as.integer(sum(points)),
                   points_new = as.integer(sum(points_new))
               ) %>%
        dplyr::arrange(dplyr::desc(points_new))
    if (old_system) ladder <- ladder %>% dplyr::arrange(dplyr::desc(points))
    ladder
}

#' @rdname ladders
#' @export
matchResults <- function(df) {
    df <- df %>%
        dplyr::group_by(round, game) %>%
        tidyr::nest() %>%
        dplyr::group_by(round, game) %>%
        dplyr::mutate(game_results = purrr::map(data, matchPoints)) %>%
        dplyr::select(-data) %>%
        tidyr::unnest()
    df
}
