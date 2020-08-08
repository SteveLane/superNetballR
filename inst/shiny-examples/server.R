################################################################################
################################################################################
## Title: Server
## Author: Steve Lane
## Date: Saturday, 08 August 2020
## Synopsis: Server for shiny example.
## Time-stamp: <2020-08-08 15:09:40 (sprazza)>
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
}
