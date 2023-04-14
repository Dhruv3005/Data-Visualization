library(shiny)

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel(" 	Wine Dataset"),
  
  fluidRow(
        column(12, 
               wellPanel(selectInput("class","Select Wine type",choices=c("1","2","3")))
        )  # add select input 
    ),

  fluidRow(
        column(3, 
               wellPanel(
                   p("Select a continuous variable and graph type (histogram or boxplot)"),
                   radioButtons("continuous_variable","Continuous",choices=c("Alcohol","Malicacid", "Ash", "Alcalinityofash","Magnesium","Totalphenols","Flavanoids",
 	"Nonflavanoidphenols","Proanthocyanins","Colorintensity","Hue","OD280/OD315ofdilutedwines","Proline"  )),   # add radio buttons for continuous variables
                   radioButtons("graph_type","Graph",choices=c("histogram","boxplot"))    # add radio buttons for chart type
               )
        ),column(9, plotOutput("p1"))  # add plot output
    ),


)


server <- function(input, output) {

  wine = import("wine.csv")
  names(wine) = tolower(names(wine))

  df_wine <- reactive({
    wine %>% filter(class == input$class)
  })

  output$p1 <- renderPlot({
        if (input$graph_type == "histogram") {
            # Histogram
            ggplot(df_wine(), aes_string(x =input$continuous_variable)) +
                geom_histogram(color="blue",fill="deepskyblue") +  # histogram geom
                labs(y="Number of wines", title=paste("Trend of ",input$continuous_variable)) +  # labels
                #facet_wrap(~prediction)+ # facet by prediction
                theme_light()
        }
        else {
            # Boxplot
            ggplot(df_wine(), aes_string(y = input$continuous_variable)) +
                geom_boxplot(color="chocolate",fill="darkgoldenrod1") +  # boxplot geom
                coord_flip() +  # flip coordinates
                labs(x="Number of wines", title=paste("Boxplot of",input$continuous_variable)) +  # labels
                #facet_wrap(~prediction)+    # facet by prediction
                theme_light()
        }
        
    })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)