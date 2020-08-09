################################################################################
################################################################################
## Title: Global shiny setup
## Author: Steve Lane
## Date: Saturday, 08 August 2020
## Synopsis: Sets up global libraries and functions for example shiny.
## Time-stamp: <2020-08-09 10:17:55 (sprazza)>
################################################################################
################################################################################
library(here)
library(dplyr)
library(ggplot2)
library(shiny)
library(shinipsum)
library(DT)
library(superNetballR)

################################################################################
## Load modules.
lst_modules <- list.files(
    here::here("inst/shiny-examples/superNetballR/modules/"), full.names = TRUE
)
lapply(lst_modules, function(x) source(x, echo = FALSE))

################################################################################
## Load 2017 player data
data(players_2017)
data(season_2017)
season_2017 <- season_2017 %>%
    mutate(Season = 2017)

################################################################################
## Create some selectors (they don't need to be reactive).
season_input <- sort(unique(season_2017[["Season"]]))
team_input <- sort(unique(season_2017[["squadName"]]))
round_input <- sort(unique(season_2017[["round"]]))
