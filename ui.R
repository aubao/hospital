require(rCharts)
shinyUI(pageWithSidebar(
  headerPanel("Hospital Data"),
  
  sidebarPanel(
    helpText("Note: This app can show the relation between", 
             "the weekday and the number of people who was",
             "hospitalized"),
    selectInput(inputId = "wd",
                label = "Choose weekday",
                choices = c("Sun", "Mon",'Tues','Wed','Thurs','Fri','Sat'),
                selected = "Sun"),
    selectInput(inputId = "type",
                label = "Choose Chart Type",
                choices = c("multiBarChart", "multiBarHorizontalChart"),
                selected = "multiBarChart")
  ),
  mainPanel(
    showOutput("myChart", "nvd3"),
    showOutput("mychart2",'nvd3')
  )
))