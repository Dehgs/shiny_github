ui <- page_navbar(
  header =
    tagList(
      tags$head(
        tags$link(
          rel = "stylesheet",
          type = "text/css",
          href = "style.css"
        )
      ),
      tags$head(
        tags$script(
          src = "script.js"
        )
      )
    ),
  title = "Māori Businesses & Climate Hazards",
  bg = "#007C9D",
  underline = FALSE,
  footer = footer_code,
  nav_panel(
    title = "Home",
    layout_sidebar(
      withMathJax(),
      sidebar = sidebar(
        width = 343,
        bg = "lightgrey",
        radioButtons(
          "attr_type",
          "Key Attribute:",
          choices = attr_opt,
          selected = attr_opt[1]
        ),
        radioButtons(
          "comp_type",
          "Comparison Type:",
          choices = comp_opt,
          selected = comp_opt[1]
        ),
        conditionalPanel(
          condition = "input.comp_type == 'cli_reg'",
          selectInput(
            "ind_filter",
            "Filter by Industry:",
            choices = ind_opt,
            selected = ind_opt[1]
          )
        ),
        conditionalPanel(
          condition = "input.comp_type == 'cli_ind'",
          selectInput(
            "reg_filter",
            "Filter by Region:",
            choices = reg_opt,
            selected = reg_opt[1]
          )
        ),
        conditionalPanel(
          condition = "input.comp_type == 'ind_reg'",
          selectInput(
            "cli_filter",
            "Filter by Climate Hazard:",
            choices = cli_opt,
            selected = cli_opt[1]
          )
        ),
        radioButtons(
          "eth", "Ethnicity:",
          choices = eth_opt,
          selected = eth_opt[1]
        ),
        radioButtons(
          "cli_per", "Climate Period:",
          choices = cli_per_opt,
          selected = cli_per_opt[2]
        ),
        accordion(
          accordion_panel(
            title = "Thresholds",
            radioButtons(
              "fl_slr_thresh", "Flood Hazard and Coastal Inundation:",
              choices = fl_slr_thresh_opt,
              selected = fl_slr_thresh_opt[1]
            ),
            radioButtons(
              "other_thresh", "Other Climate Hazards:",
              choiceNames = other_thresh_opt |> names() |> lapply(HTML),
              choiceValues =  other_thresh_opt |> unname() |> as.list()
            )
          ),
          open = FALSE,
        ),
        br()
      ),
      layout_columns(
        plotOutput("plot1"),
        plotOutput("plot2"),
        col_widths = c(5, 7)
      )
    )
  ),
  nav_panel(
    title = "Methodology and Data",
    # uiOutput("methodology")
    includeMarkdown("methodology.md")
  ),
  nav_panel(title = "About", p("Third page content."))
  # nav_spacer(),
  # nav_menu(
  #   title = "Data",
  #   align = "right",
  #   nav_item(tags$a("Posit", href = "https://posit.co")),
  #   nav_item(tags$a("Shiny", href = "https://shiny.posit.co"))
  # )
)
