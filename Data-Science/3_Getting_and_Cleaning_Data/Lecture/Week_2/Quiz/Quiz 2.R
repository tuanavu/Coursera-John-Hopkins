## Question 1
library(httr) 
library(httpuv)  
library(jsonlite)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
#    Insert your values below - if secret is omitted, it will look it up in
#    the GITHUB_CONSUMER_SECRET environmental variable.
#
#    Use http://localhost:1410 as the callback url
myapp <- oauth_app("github",key="c2c666a842ca53949bc6",secret = "5f4cc856c1842312215b19de2e38d880321b2fb3")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
json1 = content(req)
json2 = jsonlite::fromJSON(toJSON(json1))
json2

## Question 2
library(sqldf)
acs <- read.csv('getdata-data-ss06pid.csv', header = TRUE, sep = ",")
head(ans)

sqldf("select * from acs where AGEP < 50 and pwgtp1")
sqldf("select * from acs where AGEP < 50")
sqldf("select * from acs")
sqldf("select pwgtp1 from acs where AGEP < 50")

## Question 3
unique(acs$AGEP)

sqldf("select distinct pwgtp1 from acs")
sqldf("select unique AGEP from acs")
sqldf("select AGEP where unique from acs")
sqldf("select distinct AGEP from acs")

## Question 4
## Getting data off webpages
con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
htmlCode

## Count characters in each lines
nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])



## Question 5
## Read data from line 5, skip line 1-4
ans <- read.fwf('getdata-wksst8110.for',width=c(12, 7,4, 9,4, 9,4, 9,4), skip = 4)
head(ans)
shortlist <- ans[4]
sum(shortlist)

