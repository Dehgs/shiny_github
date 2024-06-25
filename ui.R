ui <- page_navbar(
  title = "Māori Businesses & Climate Hazards",
  bg = "#007C9D",
  # inverse = TRUE,
  nav_panel(
    title = "One",
    layout_sidebar(
      sidebar = sidebar(
        bg = "lightgrey",
        radioButtons(
          "geo_type", "Geographical Grouping:",
          choices = 1:3 |> as.character(),
          selected = "regc2018_v1_00"
        ),
        radioButtons(
          "geo_type_2", "Second Grouping:",
          choices = 1:3 |> as.character(),
          selected = "regc2018_v1_00"
        )
      ),
      layout_columns(
        plotOutput("plot1"),
        plotOutput("plot2"),
        col_widths = c(5, 7)
      )
    )
  ),
  nav_panel(title = "Two", p("Second page content.")),
  nav_panel(title = "Three", p("Third page content.")),
  nav_spacer(),
  nav_menu(
    title = "Links",
    align = "right",
    nav_item(tags$a("Posit", href = "https://posit.co")),
    nav_item(tags$a("Shiny", href = "https://shiny.posit.co"))
  )
)
