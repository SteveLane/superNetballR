################################################################################
################################################################################
## Title: Global shiny setup
## Author: Steve Lane
## Date: Saturday, 08 August 2020
## Synopsis: Sets up global libraries and functions for example shiny.
## Time-stamp: <>
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
## Load 2017 player data
data(players_2017)
data(season_2017)
