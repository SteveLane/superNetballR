#' Function to plot a particular statistic
#'
#' \code{team_series} Function to plot a particular statistic, for a particular
#' team.
#'
#' @param df Data frame of team statistics
#' @param metric Statistic to display on figure
#' @param team1 First team to display on chart
#' @param team2 Second team to display on chart
#'
#' @return ggplot2 object
team_series <- function(df) {
  df %>%
    ggplot() +
    aes(
      x = Round, y = value, group = squadName, colour = squadName,
      fill = squadName
    ) +
    geom_point() +
    geom_line() +
    geom_smooth(level = 0.8) +
    scale_fill_manual(values = nm) +
    scale_colour_manual(values = nm) +
    labs(
      y = 'Value',
      title = 'Super Netball Statistics by Round',
      caption =
        'This figure allows you to compare two teams on a single statistic over time. The finals are shown as Round 15-17 on the figure. Overlaid are simple trend (loess) lines and an 80% confidence interval.'
    ) +
    theme_minimal() +
    theme(
      axis.text.x = element_text(hjust = 1, angle = 35),
      legend.title = element_blank(),
      legend.position = 'bottom'
    )
}

team_series_ui <- function(id) {
  sidebarLayout(
    sidebarPanel(
      selectInput(
        NS(id, "team_selector1"),
        label = "Team 1",
        choices = team_input,
        selected = "Melbourne Vixens"
      ),
      selectInput(
        NS(id, "team_selector2"),
        label = "Team 2",
        choices = team_input,
        selected = "GIANTS Netball"
      ),
      selectInput(
        NS(id, "statistic_selector"),
        label = "Statistic",
        choices = metric_input,
        selected = "goals"
      ),
      width = 2
    ),
    mainPanel(
      plotOutput(NS(id, 'team_series'), height = '600px'),
      width = 10
    )
  )
}

team_series_server <- function(id, df) {
  moduleServer(id, function(input, output, session) {
    this_df <- reactive({
      df %>%
        filter(
          squadName %in% c(input$team_selector1, input$team_selector2),
          stat == input$statistic_selector
        )
    })
    output$team_series <- renderPlot({
      team_series(this_df())
    })
  })
}

## Test the modules in a self-contained way.
team_series_app <- function(data_source) {
  ui <- fluidPage(
   team_series_ui("ts1")
  )
  server <- function(input, output, session) {
    team_series_server("ts1", data_source)
  }
  shinyApp(ui, server)
}
