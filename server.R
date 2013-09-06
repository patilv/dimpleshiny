library(rCharts)
load("TotalRank.rda")

for (i in 4:13){TotalRank[,i] = as.numeric(as.character(TotalRank[,i]))}
TotalRank[,15] = as.numeric(as.character(TotalRank[,15]))

shinyServer(function(input, output) {
  
  # Ensuring columns of two characteristics do not have null values
  # Thanks to BenBarnes:http://stackoverflow.com/questions/11254524/omit-rows-containing-specific-column-of-na
  completeFun <- function(data, desiredCols) {
    completeVec <- complete.cases(data[, desiredCols])
    return(data[completeVec, ])
  }
  
  datachart=reactive({datachart=completeFun(TotalRank,c(input$char1,input$char2))})
  
  formulaText1 = reactive({
    paste(input$char1,"~",input$char2)
  })
  
  output$chart <- renderChart({
    
    d1 <- dPlot(
      as.formula(formulaText1()),
      groups = c("Name","Overall.Rank","Carnegie.Classification","Control",input$colorvar),
      data = datachart(),
      type = "bubble",
      height=800,
      width=1000,
      bounds = list(x=60, y=25, width=400, height=350)
    )
    d1$xAxis( type = "addMeasureAxis" )
    d1$yAxis( type = "addMeasureAxis" )
    d1$legend(
      x = 462,
      y = 0,
      width = 50,
      height = 200,
      horizontalAlign = "left"
    )
    
    
    d1$addParams(dom = 'chart')
    return(d1)
  })
})
