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

