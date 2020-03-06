# Data Science Capstone: Final Project
#


## Load Packages and Data
library(shiny)
library(tm)
unigramTest <- readRDS("unigramsDF.RData") 
bigramTest <- readRDS("bigramsDF.RData") 
trigramTest <- readRDS("trigramsDF.RData") 


## Cleaning Input Function
cleaner <- function(x) 
{
  cleanInput <- tolower(x)
  cleanInput <- stripWhitespace(cleanInput)
  cleanInput <- removePunctuation(cleanInput)
  cleanInput <- removeNumbers(cleanInput)
  cleanInput
}


## Word Predictor Function
predictor <- function(x)
{
  
  ## Clean and Split Input
  inp <- cleaner(x)
  inp <- strsplit(inp, " ")[[1]]
  
  ## Trigram Validation
  if (length(inp) >= 2)
  {
    lastTW <- tail(inp, 2)
    filter1 <- grepl(lastTW[1], trigramTest[,1])
    simpTrigram1 <- trigramTest[filter1,]
    if (!is.matrix(simpTrigram1))
    {
      simpTrigram1 <- t(simpTrigram1)
    }  
   
    ## validate simptrigram1 by Number of Rows
    if (length(simpTrigram1) > 0)
    {
      filter2 <- grepl(lastTW[2], simpTrigram1[,2])
      simpTrigram2 <- (simpTrigram1[filter2,])
      if (!is.matrix(simpTrigram2))
      {
        simpTrigram1 <- t(simpTrigram2)
      }
      
      ## validate simptrigram2 by Number of Rows
      if (length(simpTrigram2) > 5)
      {
        predWord <- as.character(head(simpTrigram2[,3],1))
        predWord
      }
      else if (length(simpTrigram2) == 5)
      {
        predWord <- as.character(simpTrigram2[3],1)
        predWord
      }
      else
      {
        predictor(lastTW[2]) 
      }  
    }
    else
    {
      predictor(lastTW[2])
    }
  }
  ## Bigram Validation
  else if (length(inp) == 1)
  {
    lastW <- inp
    filter3 <- grepl(lastW, bigramTest[,1])
    simpBigram1 <- bigramTest[filter3,]
    if (!is.matrix(simpBigram1))
    {
      simpTrigram1 <- t(simpBigram1)
    }
    
    ## validate simpBigram1 by Number of Rows
    if (length(simpBigram1) > 4)
    {
      predWord <- as.character(head(simpBigram1[,2],1))
      predWord
    }
    else if (length(simpBigram1) == 4)
    {
      predWord <- as.character(simpBigram1[2])
      predWord
    }
    else
    {
      predWord <- as.character(head(unigramTest[1],1))
      predWord
    }
  }
  else
  {
    predWord <- as.character(head(unigramTest[1],1))
    predWord
  }
}


# Define server logic required to predict the next word on the phrase
shinyServer(function(input, output)
  {
    output$outputPhrase <- renderText({predictor(input$inputPhrase)})
  }
)
