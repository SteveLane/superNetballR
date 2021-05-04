#' Runs the demo shiny app
#'
#' \code{shinySuperNetballR} Runs the demo shiny app to compare Super Netball
#' statistics between teams.
#'
#' @return Runs a shiny app
#'
#' @export
shinySuperNetballR <- function() {
  my_dir <- system.file(
    "shiny-examples", "superNetballR", package = "superNetballR"
  )
  if (my_dir == "") {
    stop("Can't find the superNetballR shiny directory. Try re-installing `superNetballR`.", call. = FALSE)
  }

  source(paste0(my_dir, '/team_series_module.R'))
  shiny::runApp(my_dir, display.mode = "normal")
}
