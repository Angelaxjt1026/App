library(shiny)
library(knitr)
library(tidyverse)
data1 <- read.csv("/Users/sunjing/Downloads/CASchools.csv")
# How district average income relate to students' reading score
plot1 <- ggplot(data=data1)+
  geom_point(mapping = aes(x=read, y=income))+
  xlab("Reading Scores of Students")+
  ylab("District Average Income")
  
# How percentage of English learners (second language speakers) relate to students' reading score
plot2 <- ggplot(data=data1)+
  geom_point(mapping = aes(x=read, y=english))+
  xlab("Reading Scores of Students")+
  ylab("Percentage of English Leaners (Second Language Speakers)")

ui <- fluidPage (
  
  titlePanel("Reading Scores of Students in California"),
  
    sidebarPanel(
      
      selectInput(inputId = "var",
                  label = "Y-axis Statistics",
                  choices = list("District Average Income", 
                                 "Percentage of Non-Native Speakers"),
                  selected = "District Average Income"),
      
    ),
  
  mainPanel(
    plotOutput(outputId = "bar")
    
  )
)
server <- function(input, output) {
  
  output$bar <- renderPlot({
    if (input$var=="District Average Income"){
      plot1
    } else{
      plot2
    }
  })
}
shinyApp(ui = ui, server = server)
