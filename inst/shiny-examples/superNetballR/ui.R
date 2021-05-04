################################################################################
################################################################################
## Title: UI
## Author: Steve Lane
## Date: Saturday, 08 August 2020
## Synopsis: UI for shiny example.
## Time-stamp: <2021-05-04 12:49:18 (sprazza)>
################################################################################
################################################################################
ui <- navbarPage(
  "Super Netball Statistics Comparison App",
  tabPanel(
    "Team Statistics",
    team_series_ui('team_series1')
  )
)
