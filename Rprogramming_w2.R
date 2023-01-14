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
}
  
