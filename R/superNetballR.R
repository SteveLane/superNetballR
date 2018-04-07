#' \code{superNetballR} package
#'
#' Functions getting and manipulating Super Netball data.
#'
#' @docType package
#' @name superNetballR
#' @importFrom dplyr %>%
#' @importFrom rlang !!
NULL

## quiets concerns of R CMD check re: the .'s that appear in pipelines
if(getRversion() >= "2.15.1") utils::globalVariables(c("."))
