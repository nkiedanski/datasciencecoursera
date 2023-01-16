
names(data)

rankhospital <- function(state, outcome, num = "best") {
  data <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", 
                   colClasses = "character")
  
  if (identical(outcome,"heart attack")) {
    new_data = data[data$State == state, c(2, as.numeric(11))]
    order_data = new_data[order(new_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, 
                                decreasing = FALSE),]
  }
  else if (identical(outcome,"heart failure")) {
    new_data = data[data$State == state, c(2, as.numeric(17))]
    order_data = new_data[order(new_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, 
                                decreasing = FALSE),]
  }
  else if (identical(outcome,"pneumonia")) {
    new_data = data[data$State == state, c(2, as.numeric(23))]
    order_data = new_data[order(new_data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, 
                                decreasing = FALSE),]
    
  }
  order_data 
}

rankhospital("NC", "heart attack", "worst")
rankhospital("WA", "heart attack", 7)
rankhospital("TX", "pneumonia", 10)
rankhospital("NY", "heart attack", 7)

"falta:
- ordenar alfabeticamente
- eliminar los Not Available
- usar el 3er argumento"