library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Shiny Text"),
  
  # Sidebar with controls to select a dataset and specify the number
  # of observations to view
  sidebarPanel(
    selectInput("dataset", "Choose a dataset:", 
                choices = c("mtcars", "airquality", "swiss","rock")),
    
    numericInput("obs", "Show Output:", 20),
    
    selectInput("Data1", "Choose a response:", 
                choices = c(2, 3, 4,5,6,7,8,9,10,11)),
    
    selectInput("Data2", "Choose a predictor:", 
                choices = c(2, 3, 4,5,6,7,8,9,10,11)),
    verbatimTextOutput("Columns")
    
  ),
  
  # Show a summary of the dataset and an HTML table with the requested
  # number of observations
  mainPanel(
    
    
    tabsetPanel( 
      tabPanel("Summary", verbatimTextOutput("summary")), 
      tabPanel("view", tableOutput("view")),
      tabPanel("Corr", plotOutput("Cor") ) ,
      tabPanel("LM", verbatimTextOutput("LM"))
      
    )
    
  
  )
))