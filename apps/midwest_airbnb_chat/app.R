con = DBI::dbConnect(RSQLite::SQLite(), "data/midwest_airbnb.db")

client = ellmer::chat_openai(
  model = "gpt-5.6-luna",
  params = ellmer::params(reasoning_effort = "none")
  )

qc = querychat::querychat(
  con, "listings",
  client   = client,
  tools    = c("filter", "query", "visualize"),
  greeting = "Ask me about 14,887 Airbnb listings in Chicago, Columbus, and the Twin Cities.",
  data_description   = "data/data_desc.md",
  extra_instructions = "data/extra_instructions.md"
)

library(shiny)
library(bslib)
library(DT)

theme <- bs_theme(
  preset = "flatly"
)

ui <- page_sidebar(
  title = "Midwest Airbnb Explorer",
  theme = theme,
  
  sidebar = qc$sidebar(),
  
  navset_card_tab(
    nav_panel(
      "Home",
      h3("Midwest Airbnb Explorer"),
      p("This app uses Inside Airbnb data for Chicago, Columbus, and the Twin Cities."),
      p("Snapshot dates: Chicago 2026-07-20, Columbus 2026-07-23, Twin Cities 2026-07-21."),
      p("Built by Carson Porter.")
    ),
    
    nav_panel(
      "Results",
      card(
        card_header("Results"),
        DTOutput("table")
      ),
      card(
        card_header("SQL Query"),
        verbatimTextOutput("sql")
      )
    )
  )
)

server <- function(input, output, session) {
  
  qc_vals <- qc$server()
  
  output$table <- renderDT({
    datatable(qc_vals$df())
  })
  
  output$sql <- renderText({
    qc_vals$sql()
  })
}

shinyApp(ui, server)

