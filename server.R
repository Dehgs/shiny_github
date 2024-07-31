shinyServer(function(input, output) {

  output$plot1 <- renderPlot(
    plot(rnorm(100))
  )
  output$plot2 <- renderPlot(
    plot(runif(100))
  )
  # output$methodology <- renderUI({
  #   HTML(markdown::markdownToHTML(knitr::knit('methodology.Rmd', quiet = TRUE), fragment.only = TRUE))
  # })
})
