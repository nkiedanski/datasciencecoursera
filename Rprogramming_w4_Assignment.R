outcome <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
summary(outcome)
str(outcome)
ncol(outcome)
nrow(outcome)
dim(outcome)
names(outcome)
outcome[, 11] <- as.numeric(outcome[, 11])
## You may get a warning about NAs being introduced; that is okay
#histogram of the 30-day death rates from heart attack
hist(outcome[, 11])

## 2 Finding the best hospital in a state

best <- function(state, outcome) {
    ## Check that state and outcome are valid
    data <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", 
                        colClasses = "character")
    valid_states = levels(as.factor(data$State))
    
#    if (!identical(outcome, "heart attack") | !identical(outcome, "heart failure")|
#        !identical(outcome, "pneumonia")) {
#      print("invalid outcome")
#    }
#    if (!(state %in%valid_states)) {
#      print("invalid state")
#    }
    if (identical(outcome,"heart attack")) {
        column = 13
        lower = min(as.numeric(data[[column]]), na.rm=TRUE)
        bests = data[data$State == state & data[[column]]==lower, ]
    }
    else if (identical(outcome,"heart failure")) {
      column = 19
      lower = min(as.numeric(data[[column]]), na.rm=TRUE)
      bests = data[data$State == state & data[[column]]==lower, ]
    }
    else if (identical(outcome,"pneumonia")) {
      column = 25
      lower = min(as.numeric(data[[column]]), na.rm=TRUE)
      bests = data[data$State == state & data[[column]]==lower, ]
    }
    bests$Hospital.Name 
}

best("AZ", "heart attack")

