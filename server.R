require(rCharts)
load("patient.RData")
shinyServer(function(input, output) {
  reactive_pic <- reactive({
    n1 <- nPlot(count ~ hour, group = 'wday', data = wd_hour, dom = 'myChart',
                type = 'multiBarChart')
    return(n1)
  })
  output$myChart <- renderChart({
    p6 <- nPlot(count~hour, data = subset(wd_hour, wday == input$wd), 
                dom = 'myChart',type = input$type)
    
    #p6$chart(color = c('brown', 'blue', '#594c26', 'green'))
    return(p6)
  })
  output$mychart2 <- renderChart({
    reactive_pic()
    #n1 <- nPlot(count ~ hour, group = 'wday', data = wd_hour, dom = 'myChart',
  #              type = 'multiBarChart')
  #  return(n1)
  })
})