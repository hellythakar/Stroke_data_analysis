
library(readxl)
Stroke <- read_excel("Stroke.xlsx")
View(Stroke)

library(shiny)
library(ggplot2)
data(Stroke, package = "ggplot2")
shinyServer(function(input, output) {
    
    output$StrokePlot <- renderPlot({
        ggplot(Stroke, aes_string(x=input$x, y=input$y)) + geom_point() + theme_gray() 
    })
})



