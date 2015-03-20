require(rCharts)
options(RCHART_LIB = 'polycharts')
shinyUI(pageWithSidebar(
  headerPanel("Percentage of Employed By Gender in Canada"),
  
  sidebarPanel(
    selectInput(inputId = "year",
                label = "Select year to compare provinces",
                choices = sort(unique(data_employ$year)),
                selected = 2001),
    selectInput(inputId = "province",
                label = "Select province to compare years",
                choices = sort(unique(data_employ$province)),
                selected = "Ontario")
  ),
  
  mainPanel(
    showOutput("chart1", "polycharts"),
    showOutput("chart2", "polycharts")
  )
))