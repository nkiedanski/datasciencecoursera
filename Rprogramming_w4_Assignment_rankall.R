
rankall <- function(outcome, num) {
  data <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", 
                   colClasses = "character")
  states = levels(as.factor(data$State))
  
  if (identical(outcome,"heart attack")) {
    result = data.frame()
    for (state in states) {
      data_state = data[data$State== state, ] #genero un dataset con ese state
      ordered_state = data_state[order(as.numeric(data_state$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)),] # los ordeno por ranking
      desired_output = ordered_state[num, c("State", "Hospital.Name")]
      if (nrow(result) == 0) {
        result = desired_output
      } else {
        result = rbind.data.frame(result, desired_output)
      }
    }
    result
  }
  else if (identical(outcome,"heart failure")) {
    result = data.frame()
    for (state in states) {
      data_state = data[data$State== state, ] #genero un dataset con ese state
      ordered_state = data_state[order(as.numeric(data_state$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)),] # los ordeno por ranking
      desired_output = ordered_state[num, c("State", "Hospital.Name")]
      if (nrow(result) == 0) {
        result = desired_output
      } else {
        result = rbind.data.frame(result, desired_output)
      }
    }
    result
  }
  else if (identical(outcome,"pneumonia")) {
    result = data.frame()
    for (state in states) {
      data_state = data[data$State== state, ] #genero un dataset con ese state
      ordered_state = data_state[order(as.numeric(data_state$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)),] # los ordeno por ranking
      desired_output = ordered_state[num, c("State", "Hospital.Name")]
      if (nrow(result) == 0) {
        result = desired_output
      } else {
        result = rbind.data.frame(result, desired_output)
      }
    }
    result
  }
}

r = rankall("heart attack", 4)
as.character(subset(r, State == "HI")$Hospital.Name)
r = rankall("heart failure", 10)
as.character(subset(r, State == "NV")$Hospital.Name)

#create a new dataframe ordered by two conditions 
# data2 <- data[order(data$State,data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),]

#creo una columna nueva que se llama ranking con NA 
#data2["ranking"] = NAda

"codigo util:
> colnames(data)
"