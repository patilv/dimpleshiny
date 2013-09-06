library(rCharts)
shinyUI(bootstrapPage(
  
  
  div(class="row",
      div(class="span3",selectInput("colorvar", "Color Dots by:",
                                    choices =c("Control","Carnegie.Classification"))),
      div(class="span3",
          selectInput("char1", "Characteristic 1 (Vertical axis):",
                      choices =c(
                        "Best.Value.Rank","Rate.My.Prof.Rank","Actual.Retention.Rate.Rank","Actual.Vs.Pred.Retention.Rank","Payscale.Salary.Rank",
                        "American.Leaders.Rank","Federal.Student.Debt.Rank","Debt.Default.Rate.Rank","Actual.Vs.Pred.Prop.Of.Students.Borrowing.Rank",
                        "Actual.Graduation.Rate.Rank","Actual.Vs.Pred.Graduation.Rate.Rank","Student.Awards.Rank","Alumni.Receiving.PhD.Rank",
                        "Total.Score","Overall.Rank"))),
      
      div(class="span3",
          
          selectInput("char2", "Characteristic 2 (Horizontal axis):",
                      choices =c(
                        "Overall.Rank","Rate.My.Prof.Rank","Actual.Retention.Rate.Rank","Actual.Vs.Pred.Retention.Rank","Payscale.Salary.Rank",
                        "American.Leaders.Rank","Federal.Student.Debt.Rank","Debt.Default.Rate.Rank","Actual.Vs.Pred.Prop.Of.Students.Borrowing.Rank",
                        "Actual.Graduation.Rate.Rank","Actual.Vs.Pred.Graduation.Rate.Rank","Student.Awards.Rank","Alumni.Receiving.PhD.Rank",
                        "Total.Score","Best.Value.Rank")))
      
      
  ),
  
  showOutput("chart","dimple")
  
))