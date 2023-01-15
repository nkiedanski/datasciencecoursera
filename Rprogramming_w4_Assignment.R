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
    outcome <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", 
                        colClasses = "character")
    if (identical(outcome,"heart attack")) {
        column = 13
        lower = min(outcome[[column]])
        bests = outcome[outcome$State == state & outcome[[column]]==lower, ]
    }
    bests$Hospital.Name
}

best("AZ", "heart attack")

