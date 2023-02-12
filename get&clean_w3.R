
fileURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = "../datasciencecoursera/ACommunity.csv")
data = read.table("../datasciencecoursera/ACommunity.csv", sep = ",", header = TRUE)

data$agricultureLogical = data$ACR == 3 & data$AGS == 6
table(data$agricultureLogical)
which(data$agricultureLogical) 

# question 1: 125  238  262

################################################################################

library(jpeg)
imageURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(imageURL, destfile = "../datasciencecoursera/jeff.jpg")
image = readJPEG("../datasciencecoursera/jeff.jpg", native = TRUE)
quantile(image, probs = c(0.3, 0.8))

# question2 : -15259150 -10575416 

################################################################################

fileURL2 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileURL3 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

download.file(fileURL2, destfile = "../datasciencecoursera/product.csv")
download.file(fileURL3, destfile = "../datasciencecoursera/educational.csv")

data_product = read.csv("../datasciencecoursera/product.csv", sep = ",", header = TRUE, skip = 4)
data_educational = read.csv("../datasciencecoursera/educational.csv", sep = ",", header = TRUE)

library(eeptools)
data_product_clean = data_product[1:190, ]
data_product_clean$X.4 = decomma(data_product_clean$X.4)

intersect(data_product_clean$X, data_educational$CountryCode)
str(intersect(data_product_clean$X, data_educational$CountryCode))
# cantidad de interseccion es 189


merged_data = merge(data_educational, data_product_clean, by.x = "CountryCode", by.y = "X")

merged_data = merged_data[order(merged_data$X.4, decreasing = FALSE),]

# hay que poner NA a las celdas que no tienen nada
#merged_data$Gross.domestic.product.2012 = na_if(merged_data$Gross.domestic.product.2012, '')
# se eliminan los valores NA
#merged_data_na = merged_data[!is.na(merged_data$Gross.domestic.product.2012),]

merged_data[13, "Long.Name"]
# 13th position = "St. Kitts and Nevis"


################################################################################

library(dplyr)
library(reshape2)
# dcast(merged_data, merged_data$Income.Group ~ mean(as.numeric(merged_data$X.1)))

merged_data %>% group_by(Income.Group) %>% summarise(avg = mean(rank))

# question 4: 91.9 33.0

################################################################################

quantile(as.numeric(merged_data$X.4), 
         probs = c(0.2, 0.4, 0.6, 0.8, 1.0), na.rm = TRUE)

cut(as.numeric(merged_data_na$Gross.domestic.product.2012), 
    breaks = quantile(as.numeric(merged_data_na$Gross.domestic.product.2012), 
                      probs = c(0.2, 0.4, 0.6, 0.8, 1.0), na.rm = TRUE))

x = cut(as.numeric(merged_data$X.4), 
        breaks = quantile(as.numeric(merged_data$X.4), 
                          probs = c(0.2, 0.4, 0.6, 0.8, 1.0), na.rm = TRUE))

table(x, merged_data$Income.Group)

# question 5: 5




