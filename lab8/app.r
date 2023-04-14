library(plotly)
library(dplyr)

data("iris")

# Histograms tab
histPlot <- plot_ly(iris, x = iris[["Sepal.Length"]], type = "histogram",
                    nbinsx = 30, colors = c("#1F77B4", "#FF7F0E", "#2CA02C", "#D62728")) %>%
  layout(title = "Histograms of All Properties",
         xaxis = list(title = "Sepal.Length"),
         yaxis = list(title = "Count"),
         margin = list(l = 60, r = 40, b = 60, t = 40),
         height = 500,
         width = 700)

# Scatter Plot tab
scatterPlot <- plot_ly(iris, x = iris[["Sepal.Length"]], y = iris[["Sepal.Width"]], color = Species,
                       colors = c("#E69F00", "#56B4E9", "#009E73"), type = "scatter", mode = "markers",
                       marker = list(symbol = ifelse(iris$Species == "setosa", "circle",
                                                     ifelse(iris$Species == "versicolor", "square", "diamond")),
                                     size = ifelse(iris$Species == "setosa", 6,
                                                   ifelse(iris$Species == "versicolor", 8, 10)),
                                     opacity = 0.7)) %>%
  layout(title = "Scatter Plot of Iris Data",
         xaxis = list(title = "Sepal.Length"),
         yaxis = list(title = "Sepal.Width"),
         margin = list(l = 60, r = 40, b = 60, t = 40),
         height = 500,
         width = 700)

# Violin/Box Plot tab
violinPlot <- plot_ly(iris, x = Species, y = iris[["Sepal.Length"]], type = "violin",
                      color = Species, colors = c("#E69F00", "#56B4E9", "#009E73"),
                      box = list(visible = TRUE), points= "all", meanline = list(visible = TRUE)) %>%
  layout(title = "Violin/Box Plot of Iris Data",
         xaxis = list(title = "Species"),
         yaxis = list(title = "Sepal.Length"),
         margin = list(l = 60, r = 40, b = 60, t = 40),
         height = 500,
         width = 700)

# Print the plots
print(histPlot)
print(scatterPlot)
print(violinPlot)
