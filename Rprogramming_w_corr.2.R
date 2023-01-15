corr = function (directory, threshold=0, id = 1:332) {
  correlations = c()
  for (file_name in id) {
    corrected_id = sprintf("%03d", file_name)
    full_path = paste("./", directory, "/", corrected_id, ".csv", sep="")
    data = read.csv(full_path)
    obs = nrow(data[!is.na(data$sulfate) & !is.na(data$nitrate),])
    if (obs > threshold) {
      correlation = cor(data$sulfate, data$nitrate, use = "complete.obs")
      correlations =  c(correlations, correlation)
    }
    
  }
  correlations
}

cr <- corr("specdata", threshold = 150)
head(cr)

cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
