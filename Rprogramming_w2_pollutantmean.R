pollutantmean = function (directory, pollutant, id = 1:332) {
  compiled_data = NULL
  for (file_name in id) {
    corrected_id = sprintf("%03d", file_name)
    full_path = paste("./", directory, "/", corrected_id, ".csv", sep="")
    data = read.csv(full_path)
    if (is.null(compiled_data)) {
      compiled_data = data
    } else {
      compiled_data = rbind(compiled_data, data)
    }
  }
  mean(compiled_data[[pollutant]], na.rm =TRUE)
}
  
pollutantmean("specdata", "nitrate", 34)

complete = function (directory, ID=1:332) {
  id = list()
  nobs = list()
  for (file_name in ID) {
    corrected_id = sprintf("%03d", file_name)
    full_path = paste("./", directory, "/", corrected_id, ".csv", sep="")
    data = read.csv(full_path)
    obs = nrow(data[!is.na(data$sulfate) & !is.na(data$nitrate),])
    id = append(id, file_name)
    nobs = append(nobs, obs)
  }
  result = data.frame(unlist(id), unlist(nobs))
  colnames(result) =  c("id", "nobs")
  result
}

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)

