fileURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = "../datasciencecoursera/microdata.csv")
data = read.table("../datasciencecoursera/microdata.csv", sep = ",", header = TRUE)
names(data)
splitNames = strsplit(names(data), "wgtp")
splitNames[[123]]

# question 1: ""   "15"

################################################################################

data_product = read.csv("../datasciencecoursera/product.csv", sep = ",", 
                        header = TRUE, skip = 4)
data_product_clean = data_product[1:190, ]
data_product_clean$X.4 = decomma(data_product_clean$X.4)

mean(data_product_clean$X.4)

# question 2: 377652.4

################################################################################

grep("^United",data_product_clean$X.3)

# question 3: 1  6 32, entonces la respuesta es 3.

################################################################################

data_educational = read.csv("../datasciencecoursera/educational.csv", sep = ",", 
                            header = TRUE)
merged_data = merge(data_educational, data_product_clean, by.x = "CountryCode", by.y = "X")

table(grepl("Fiscal year end: June", merged_data$Special.Notes))

# question 4: 13

################################################################################

library(quantmod)

start <- as.Date('2012-01-01')
end <- as.Date('2012-12-31')

getSymbols('AMZN', src = 'yahoo', from = start, to = end)

# question 5: 250, 47
