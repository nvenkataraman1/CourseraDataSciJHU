library(shiny)

shinyUI(
    pageWithSidebar(
        headerPanel("Prediction algorithm"),
        sidebarPanel(
            numericInput("glucose","Glucose mg/dl",90,min=50,max=200,step=5),
            submitButton("Submit")
        ),
        mainPanel(
            h2("Results"),
            h4("You entered: "),
            verbatimTextOutput("inputValue"),
            h4("Prediction: "),
            verbatimTextOutput("outputValue")
        )
    )
)