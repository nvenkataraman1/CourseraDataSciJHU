library(shiny)

shinyUI(
    pageWithSidebar(
        headerPanel("Illustrating inputs"),
        sidebarPanel(
            numericInput("id1","Numeric input id1: ",5,min=0,max=10,step=1),
            checkboxGroupInput("id2","Checkbox: ",
                               c("Value1" = "1",
                                 "Value2" = "2",
                                 "Value3" = "3")),
            dateInput("date","Date: ")
        ),
        mainPanel(
            h3("Illustrating outputs"),
            h4("Number: "),
            verbatimTextOutput("oid1"),
            h4("Box: "),
            verbatimTextOutput("oid2"),
            h4("Date: "),
            verbatimTextOutput("odate")
        )
    )
)