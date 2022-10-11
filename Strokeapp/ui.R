#
library(readxl)
Stroke <- read_excel("Stroke.xlsx")
View(Stroke)

library(shiny)
library(ggplot2)
data(Stroke, package = "ggplot2")
nms0 <- c("age")
nms <- c("gender","ever_married", "work_type", "Residence_type", "smoking_status", "stroke", "bmi", "avg_glucose_level", "hypertension", "heart_disease")
shinyUI(pageWithSidebar(
    
    headerPanel("Age VS other variable of Stroke Dataset "),
    
    sidebarPanel(
        selectInput('x', 'X',choices = nms0, selected = "age"),
        selectInput('y', 'Y', choices = nms, selected = "avg_glucose_level"),
        
    ),
    
    mainPanel(
        plotOutput("StrokePlot")
    )
))
