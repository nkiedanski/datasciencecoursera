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