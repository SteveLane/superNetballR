################################################################################
################################################################################
## Title: Server
## Author: Steve Lane
## Date: Saturday, 08 August 2020
## Synopsis: Server for shiny example.
## Time-stamp: <2021-05-04 12:15:09 (sprazza)>
################################################################################
################################################################################
server <- function(input, output, session) {
    output$data_table <- DT::renderDT({
        random_DT(10, 5)
    })
    output$image <- renderImage({
        random_image()
    }, deleteFile = FALSE)
    output$plot <- renderPlot({
        random_ggplot()
    })
    output$print <- renderPrint({
        random_print("model")
    })
    output$table <- renderTable({
        random_table(10, 5)
    })
    output$text <- renderText({
        random_text(nwords = 50)
    })
    output$data_table2 <- DT::renderDT({
        random_DT(10, 5)
    })
    output$image2 <- renderImage({
        random_image()
    }, deleteFile = FALSE)
    output$plot2 <- renderPlot({
        random_ggplot()
    })
    output$print2 <- renderPrint({
        random_print("model")
    })
    output$table2 <- renderTable({
        random_table(10, 5)
    })
    output$text2 <- renderText({
        random_text(nwords = 50)
    })
    team_series_server('team_series1', by_game)
    ## observe({
    ##   season <- input$season_selector
    ##   squad <- input$team_selector
    ##   rounds <- season_2017 %>%
    ##     filter(
    ##       squadName == squad,
    ##       Season == season
    ##     ) %>%
    ##     distinct(round) %>%
    ##     select(round) %>%
    ##     unlist()
    ##   updateSelectInput(
    ##     session,
    ##     "round_selector_reactive",
    ##     label = "Round",
    ##     choices = rounds,
    ##     selected = "1"
    ##   )
    ## })
    ## season_input_server("input1")
}
