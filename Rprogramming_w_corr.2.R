corr = function (directory, threshold=0, id = 1:323) {
  correlations = c()
  for (file_name in id) {
    corrected_id = sprintf("%03d", file_name)
    full_path = paste("./", directory, "/", corrected_id, ".csv", sep="")
    data = read.csv(full_path)
    obs = nrow(data[!is.na(data$sulfate) & !is.na(data$nitrate),])
    if (obs > threshold) {
      correlation = cor(data$sulfate, data$nitrate, use = "complete.obs")
    }
    correlations =  c(correlations, correlation)
  }
  correlations
}

cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)

cr = corr("specdata", 5000)
head(cr)

cr = corr("specdata")
head(cr)
