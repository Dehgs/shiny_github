shinyServer(function(input, output) {
  output$plot1 <- renderPlot(
    plot(rnorm(100))
  )
  output$plot2 <- renderPlot(
    plot(runif(100))
  )
})
