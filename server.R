library(shiny)
library(datasets)
library(GGally);
library(ggplot2);

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
  
  # Return the requested dataset
  datasetInput <- reactive({
    switch(input$dataset,
           "mtcars" = mtcars,
           "airquality" = airquality,
           "swiss" = swiss,
           "rock" = rock) 
    
     
       
    
    
    
   
  })
  
  # Generate a summary of the dataset
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  
  output$Columns <-renderPrint({
    c <- colnames(datasetInput())
    for (count in  2:length(c)){ print(c(count, c[count])) }
  })
  
  # Show the first "n" observations
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
  
  
  output$Cor <- renderPlot({ 
    plot(datasetInput())
    
  })
  
  
  output$LM <- renderPrint({
    dataset <- datasetInput()
    x = as.numeric(input$Data1)
    y = as.numeric(input$Data2)
    print(c("Change",colnames(dataset)[x]))
    print(c("Predictor",colnames(dataset)[y]))
    model <- lm(dataset[,x] ~ dataset[,y]) 
    summary(model)
  })
  
  
})
