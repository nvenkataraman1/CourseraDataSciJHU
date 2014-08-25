library(shiny)

shinyServer(
    function(input, output) {
        
        #x <- reactive({as.numeric(input$text1)+100})
        
        #y <- reactive({input$goButton})
        
        output$text1 <- renderText({input$text1})
        output$text2 <- renderText({input$text2})
        output$text3 <- renderText({
            ##First example
            #input$goButton
            #isolate(paste(input$text1, input$text2))
            
            ##Another example, uncomment to see        
            if (input$goButton == 0) "You have not pressed the button"
            else if (input$goButton == 1) "you pressed it once"
            else if (input$goButton == 2) "twice pressed"
            else "OK quit pressing it"
        })
    }
)