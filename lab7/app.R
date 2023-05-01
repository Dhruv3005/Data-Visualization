library(shiny)

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel(" 	Wine Dataset"),
  
)


server <- function(input, output) {

  wine = import("wine.csv")
  names(wine) = tolower(names(wine))

  df_wine <- reactive({
    wine %>% filter(class == input$class)
  })

  output$p1 <- renderPlot({
        
        
    })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
