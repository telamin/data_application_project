require(rCharts)
options(RCHART_WIDTH = 800)
shinyServer(function(input, output) {
  output$chart1 <- renderChart({
    YEAR = input$year
    men <- subset(data_employ, gender == "male" & year == YEAR)
    women <- subset(data_employ, gender == "female" & year == YEAR)
    p1 <- rPlot(x = list(var = "provincecode", sort = "value"), y = "value", 
                color = 'gender', data = women, type = 'bar')
    p1$layer(x = "provincecode", y = "value", color = 'gender', 
             data = men, type = 'point', size = list(const = 3))
    p1$addParams(height = 300, dom = 'chart1', 
                 title = "Percentage of Employed by gender in Canada")
    p1$guides(x = list(title = "", ticks = unique(men$provincecode)))
    p1$guides(y = list(title = "", max = 80))
    return(p1)
  })
  output$chart2 <- renderChart({
   PROVINCE = input$province
    province = subset(data_employ, province == PROVINCE)
    p2 <- rPlot(value ~ year, color = 'gender', type = 'line', data = province)
    p2$guides(y = list(min = 0, title = ""))
    p2$guides(y = list(title = ""))
    p2$addParams(height = 300, dom = 'chart2')
    return(p2)
  })
})