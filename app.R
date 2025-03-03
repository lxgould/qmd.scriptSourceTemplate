#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

date_file <- "data/test_app_1.txt"

# Define UI for application that draws a histogram
ui <- fluidPage(
  fluidRow( 
    column(10, offset = 1,
           h2("Test App 1") 
    )
  ),
  fluidRow( 
    column(10, offset = 1,
           uiOutput("table_header"),
           tableOutput("file_table")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  output$table_header <- renderUI({
    dt <- readLines(date_file)[1]
    tagList(
    h3(paste0("Current Date Time: ", format(Sys.time(), "%Y-%m-%d %H:%M:%S"))),
    h3(paste0("File Date Time: ", dt)),
    h3(paste0("Files in ", getwd()))
    )
  })
  
  output$file_table <- renderTable({
    data.frame(file_name = list.files())
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
