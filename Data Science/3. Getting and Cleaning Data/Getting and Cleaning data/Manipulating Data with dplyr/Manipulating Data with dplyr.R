install.packages("swirl")

library(swirl)
install_from_swirl("Getting and Cleaning Data")
install_from_swirl("Regression Models")
swirl()

mydf <- read.csv(path2csv, stringsAsFactors = FALSE)

packageVersion("dplyr") 

# check package version
cran <- tbl_df(mydf)

# remove
rm("mydf") 

# Select statement
select(cran, ip_id, package, country) 

# Select from column 1 to column 5
select(cran, r_arch:country) 

# Select reverse order
select(cran, r_arch:country) 

# Remove column
select(cran, -time)

# Remove all column form x through size
select(cran, -(X:size))

# Filter to select variable = "swirl"
filter(cran, package == "swirl")

# Specify as many column in filter
filter(cran, r_version == "3.1.1", country == "US")
filter(cran, r_version <= "3.0.2", country == "IN") 
filter(cran, country == "US" | country == "IN")
filter(cran, size > 100500, r_os == "linux-gnu")
filter(cran, !is.na(r_version))

?Comparison

# Cran 2
cran2 <- select(cran, size:ip_id)

# Using arrange to order data

# Order ip_id in acsending order (from small to large)
arrange(cran2, ip_id)

# Order in desc order
arrange(cran2, desc(ip_id))

# Order multiple varibles (first package, then ip_id)
arrange(cran2, package, ip_id)

arrange(cran2, country, desc(r_version), ip_id)

# Cran 3
cran3 <- select(cran, ip_id, package, size)

# Mutate will create a new variable 
# based on value of one or more variables

mutate(cran3, size_mb = size / 2^20)
mutate(cran3, size_mb = size / 2^20, size_gb = size_mb / 2^10)
mutate(cran3, correct_size = size + 1000)

# Summarize data in one single row

summarize(cran, avg_bytes = mean(size))
