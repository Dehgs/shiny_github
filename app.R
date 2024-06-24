library(shiny)
library(leaflet)

ui <- fluidPage(
  
  titlePanel("Test Application"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    
    mainPanel(
<<<<<<< HEAD
      plotOutput("distPlot")#,
      # leafletOutput("mymap")
=======
      plotOutput("distPlot"),
      leafletOutput("mymap")
>>>>>>> 72626d2a99b55efb3e689377a7291b6d0978cfcf
    )
  )
)

server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = 'darkgray', border = 'white',
         xlab = 'Waiting time to next eruption (in mins)',
         main = 'Histogram of waiting times')
  })
<<<<<<< HEAD
  
  # output$mymap <- renderLeaflet({
  #   leaflet(the_shape) |>
  #     addPolygons(fillColor = ~colour, weight = 1, fillOpacity = 1, color = "black")
  # })
=======

  output$mymap <- renderLeaflet({
      the_shape <-
        readRDS(
          "the_shape.rds"
        )

      leaflet(the_shape) |>
        addPolygons(fillColor = ~colour, weight = 1, fillOpacity = 1, color = "black")
    })
>>>>>>> 72626d2a99b55efb3e689377a7291b6d0978cfcf
}

# Run the application 
shinyApp(ui = ui, server = server)
