library(dplyr)

# Load table prevent long output
cran <- tbl_df(mydf)

# remove original dataframe from workspace
rm("mydf")

# Group by
by_package <- group_by(cran, package)

# After group by, summarize returns multiple value by groups
summarize(by_package, mean(size))

# Compute four values, in the following order, from
# the grouped data:
#
# 1. count = n()
# 2. unique = n_distinct(ip_id)
# 3. countries = n_distinct(country)
# 4. avg_bytes = mean(size)
#
# A few thing to be careful of:
#
# 1. Separate arguments by commas
# 2. Make sure you have a closing parenthesis
# 3. Check your spelling!
# 4. Store the result in pack_sum (for 'package summary')
#
# You should also take a look at ?n and ?n_distinct, so
# that you really understand what is going on.

pack_sum <- summarize(by_package,
                      count = n() ,
                      unique = n_distinct(ip_id) ,
                      countries = n_distinct(country) ,
                      avg_bytes = mean(size) )

#  The 'count' column, created with n(), contains the total number of rows
#  (i.e. downloads) for each package. The 'unique' column, created with
#  n_distinct(ip_id), gives the total number of unique downloads for each
#  package, as measure by the number of distinct ip_id's. The 'countries'
#  column, created with n_distinct(country), provides the number of
#  countries in which the each package was downloaded. And finally, the
#  'avg_bytes' column, created with mean(size), contains the mean download
#  size (in bytes) for each package.

# Quantile to determine top 1% and 99%
quantile(pack_sum$count, probs = 0.99)

# filter variable
top_counts <- filter(pack_sum,count >679)
top_counts

# Arrange
arrange(top_counts,desc(count))

quantile(pack_sum$unique, probs = 0.99)

# filter
top_unique <- filter(pack_sum, unique > 465)
top_unique

# arrange
arrange (top_unique, desc(unique))

# Summarize 2
by_package <- group_by(cran, package)
pack_sum <- summarize(by_package,
                      count = n(),
                      unique = n_distinct(ip_id),
                      countries = n_distinct(country),
                      avg_bytes = mean(size))

# Here's the new bit, but using the same approach we've
# been using this whole time.

top_countries <- filter(pack_sum, countries > 60)
result1 <- arrange(top_countries, desc(countries), avg_bytes)

# Print the results to the console.
print(result1)


# Summarize 3
result2 <-
  arrange(
    filter(
      summarize(
        group_by(cran,
                 package
        ),
        count = n(),
        unique = n_distinct(ip_id),
        countries = n_distinct(country),
        avg_bytes = mean(size)
      ),
      countries > 60
    ),
    desc(countries),
    avg_bytes
  )

print(result2)

# Summarize 4
# As
# you read it, you can pronounce the %>% operator as
# the word 'then'.

result3 <-
  cran %>%
  group_by(package) %>%
  summarize(count = n(),
            unique = n_distinct(ip_id),
            countries = n_distinct(country),
            avg_bytes = mean(size)
  ) %>%
  filter(countries > 60) %>%
  arrange(desc(countries), avg_bytes)

# Print result to console
print(result3)

# Testing

# Select 4 column from cran
# 1. ip_id
# 2. country
# 3. package
# 4. size

cran %>%
  select(ip_id, country, package, size) %>%
  print

# mutate to add 1 more column
cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  print

# filter 
cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  # Your call to filter() goes here
  filter(size_mb <= 0.5)

# arrange
cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  filter(size_mb <= 0.5) %>%
  # Your call to arrange() goes here
  arrange(desc(size_mb))

