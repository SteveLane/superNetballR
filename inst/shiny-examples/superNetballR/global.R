################################################################################
################################################################################
## Title: Global shiny setup
## Author: Steve Lane
## Date: Saturday, 08 August 2020
## Synopsis: Sets up global libraries and functions for example shiny.
## Time-stamp: <2021-05-04 11:57:17 (sprazza)>
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
data(team_colours)
season_2017 <- season_2017 %>%
    mutate(Season = 2017)

################################################################################
## Create some selectors (they don't need to be reactive).
season_input <- sort(unique(season_2017[["Season"]]))
round_input <- sort(unique(season_2017[["round"]]))
by_game <- season_2017 %>%
  group_by(squadId, stat, round, game) %>%
  summarise(value = sum(value)) %>%
  mutate(
    Round = paste0(
      '2017, Round ', formatC(round, width = 2, format = 'd', flag = '0')
    )
  ) %>%
  ungroup() %>%
  left_join(., team_colours, by = 'squadId')
team_input <- sort(unique(by_game[["squadName"]]))
metric_input <- sort(unique(by_game[["stat"]]))
## Create colour scale
nm <- team_colours[['squadColour']]
names(nm) <- team_colours[['squadName']]
