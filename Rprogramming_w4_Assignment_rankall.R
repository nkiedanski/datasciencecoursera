data <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", 
                 colClasses = "character")

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
}

#create a new dataframe ordered by two conditions 
# data2 <- data[order(data$State,data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),]

#creo una columna nueva que se llama ranking con NA 
#data2["ranking"] = NAda