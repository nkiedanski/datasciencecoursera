library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "50aeedb7d675e51e5edb",
                   secret = "d835e533d3c71bcda4ab9840124978912844d977"
)

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

# OR:
#req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
#stop_for_status(req)
#content(req)
#Footer

################################################################################

library(sqldf)
fileURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL, destfile = "../datasciencecoursera/AcommunitiesUSA.csv")

acs = read.table("../datasciencecoursera/AcommunitiesUSA.csv", sep = ",", header = TRUE)

# question 2:  sqldf("select pwgtp1 from acs where AGEP < 50")

################################################################################

unique(acs$AGEP)
# question 3: sqldf("select distinct AGEP from acs")

################################################################################

conection = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(conection)
close(conection)
for (i in c(10, 20, 30, 100)) {
  print(nchar(htmlCode[i]))
}

# question 4: 45 31  7 25

################################################################################
data5 <- read.fwf(                                                              
  file = url("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"), 
  skip = 4,
  widths = c(14,5,8,5,8,5,8,5,8))

sum(as.numeric(data5$V4))

# question 5: correct answer is 32426.7