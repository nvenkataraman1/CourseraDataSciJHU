library(shiny)

diabetesRisk <- function(glucose) glucose/200

shinyServer(
    function(input,output) {
        output$inputValue <- renderPrint({input$glucose})
        output$outputValue <- renderPrint({diabetesRisk(input$glucose)})
    }
)