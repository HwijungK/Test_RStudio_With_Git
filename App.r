library(shiny)
library(ggplot2)

aq.no.na <- na.omit(airquality)

ui <- fluidPage(
  fluidRow(
    selectInput(inputId = "x",
                "Choose X Var",
                names(aq.no.na)),
    selectInput(inputId = 'y',
                label = 'Choose Y Var',
                names(aq.no.na)),
    plotOutput('graph')
  )
  
)

server<- function(input, output) {
  output$graph <- renderPlot({
    ggplot(aq.no.na, aes(x = .data[[input$x]], y = .data[[input$y]])) +
      geom_point()
  })
}

shinyApp(ui, server)