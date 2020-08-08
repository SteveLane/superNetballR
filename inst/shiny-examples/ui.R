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
    "Player Statistics",
    sidebarLayout(
      sidebarPanel(),
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
