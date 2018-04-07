#' Season 2017 match data.
#'
#' A dataset containing match statistics for all home and away and finals series
#' matches from the 2017 super netball season, by period.
#'
#' @format A data frame with 15360 rows and 8 variables:
#' \describe{
#'   \item{squadId}{Unique squad number}
#'   \item{squadName}{Full squad name}
#'   \item{squadNickname}{Squad nickname}
#'   \item{squadCode}{Short code for quad}
#'   \item{stat}{Statistic measured during the match}
#'   \item{value}{Value of the statistic}
#'   \item{round}{Round number of the match}
#'   \item{game}{Game number of the match}
#' }
"season_2017"

#' Season 2017 player data.
#'
#' A dataset containing player statistics for all home and away and finals
#' series matches from the 2017 super netball season, by period.
#'
#' @format A data frame with 163336 rows and 8 variables:
#' \describe{
#'   \item{playerId}{Unique player number}
#'   \item{shortDisplayName}{surname, firstname}
#'   \item{firstname}{Player firstname}
#'   \item{surname}{Player surname}
#'   \item{stat}{Statistic measured during the match}
#'   \item{value}{Value of the statistic}
#'   \item{round}{Round number of the match}
#'   \item{game}{Game number of the match}
#' }
"players_2017"

#' Match and player statistics from round 5, game 3, season 2017.
#'
#' A list containing detailed match and player statistics, as obtained using the
#' \code{downloadMatch} function.
#'
#' @format A list.
"round5_game3"
