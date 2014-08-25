library(shiny)

shinyUI(
    pageWithSidebar(
        headerPanel("Illustrating markup"),
        sidebarPanel(
            h1("sidebar panel"),
            h1("h1"),
            h2("h2"),
            h3("h3"),
            h4("h4")
        ),
        mainPanel(
            h3("main panel text"),
            code("some code"),
            p("some text")
        )
    )
)