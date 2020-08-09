################################################################################
################################################################################
## Title: UI
## Author: Steve Lane
## Date: Saturday, 08 August 2020
## Synopsis: UI for shiny example.
## Time-stamp: <>
################################################################################
################################################################################
ui <- navbarPage(
  "Title of the page",
  tabPanel(
    "Team Statistics",
    sidebarLayout(
      sidebarPanel(
        selectInput(
          "team_selector",
          label = "Team",
          choices = team_input,
          selected = "Melbourne Vixens"
        ),
        selectInput(
          "season_selector",
          label = "Season",
          choices = season_input,
          selected = "2017"
        ),
        selectInput(
          "round_selector",
          label = "Round",
          choices = round_input,
          selected = "1"
        ),
        hr(),
        h2("Module Test"),
        selectInput(
          "round_selector_reactive",
          label = "Round",
          choices = NULL
        ),
        ## season_input_server("input1"),
        width = 2
      ),
      mainPanel(
        fluidRow(
          column(6,
            h2("A Random DT"),
            DTOutput("data_table")
          ),
          column(6,
            h2("A Random Image"),
            plotOutput("image", height = "300px")
          )
        ),
        fluidRow(
          column(6,
            h2("A Random Plot"),
            plotOutput("plot")
          ),
          column(6,
            h2("A Random Print"),
            verbatimTextOutput("print")
          )
        )
      )
    )
  ),
  tabPanel(
    "Panel Two",
    sidebarLayout(
      sidebarPanel(),
      mainPanel(
        h2("A Random DT"),
        DTOutput("data_table2"),
        h2("A Random Image"),
        plotOutput("image2", height = "300px"),
        h2("A Random Plot"),
        plotOutput("plot2"),
        h2("A Random Print"),
        verbatimTextOutput("print2"),
        h2("A Random Table"),
        tableOutput("table2"),
        h2("A Random Text"),
        tableOutput("text2")
      )
    )
  )
)
