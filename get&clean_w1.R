getwd()
fileURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = "../datasciencecoursera/communitiesUSA.csv")
list.files("../datasciencecoursera")

data = read.table("../datasciencecoursera/communitiesUSA.csv", sep = ",", header = TRUE)
table(data$VAL) #question 1, 53

#question 2:  Tidy data has one variable per column. 

install.packages("readxl")
library(readxl)
# fileURL2 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
# download.file(fileURL, destfile = "../datasciencecoursera/gas.xlsx", method = "curl")
gas_data = read_excel("../datasciencecoursera/getdata-data-DATA.gov_NGAP.xlsx", sheet = 1, col_names = TRUE)
dat = gas_data[18:23, 7:15]
colnames(dat) = gas_data[17, 7:15]
# check wheather are numeric or not class(dat$Zip), then turn tu numeric
sum(as.numeric(dat$Zip)*as.numeric(dat$Ext),na.rm=T)
# question 3:  36534720

library(XML)
fileURL3 = "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc = xmlTreeParse(fileURL3, useInternalNodes = TRUE)
rootNode = xmlRoot(doc)

doc1 = htmlTreeParse(fileURL3, useInternalNodes = TRUE)
restaurantes = xpathSApply(doc1, "//zipcode", xmlValue)
sum(restaurantes=="21231")

