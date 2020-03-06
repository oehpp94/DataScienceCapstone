# Data Science Capstone: Final Project
#

library(shiny)

# Define UI for application with predictive text model
shinyUI
(
  fluidPage
  (
  
  # Application title
  titlePanel("Data Science Capstone: Final Project"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout
    (
    sidebarPanel
      (
       h2("Input Phrase"),
       helpText("Please use the following field to enter the input phrase:"),
       textInput("inputPhrase", "", value = "")
      ),
    
    # Show a plot of the generated distribution
    mainPanel
      (
       h2("Output Prediction"),
       helpText("The following is a word predicted by the algorithm built
                throughout the course based on the data sets and resources
                provided by Coursera and SwiftKey. The algorithm takes the 
                input phrase, and validates it against frequented n-grams.
                The output is the most probable word calculated."),
       textOutput("outputPhrase")
      )
    )
  )
)
