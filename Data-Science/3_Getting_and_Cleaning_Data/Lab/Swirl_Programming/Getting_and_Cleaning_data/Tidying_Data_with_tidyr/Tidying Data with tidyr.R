library(tidyr)

# First dataset
students

?gather
# gather
gather(students,sex,count,-grade)

# It's important to understand what each argument to gather() means. The
# data argument, students, gives the name of the original dataset. The
# key and value arguments -- sex and count, respectively -- give the
# column names for our tidy dataset. The final argument, -grade, says
# that we want to gather all columns EXCEPT the grade column (since grade
# is already a proper column variable.)

# Second dataset
students2

res <- gather(students2, sex_class, count, -grade)
res

# separate
?separate

# separate column into 2
separate(data = res, col = sex_class, into= c("sex", "class"))

# script
students2 %>%
  gather(sex_class,count ,-grade ) %>%
  separate(col=sex_class , c("sex", "class")) %>%
  print

# Third dataset
students3

# script
students3 %>%
  gather(class,grade, class1:class5, na.rm= TRUE) %>%
  print

# Spread a key-value pair across multiple columns
?spread

students3 %>%
  gather(class, grade, class1:class5, na.rm = TRUE) %>%
  spread(test,grade) %>%
  print


# Extract values
extract_numeric("class5")

# We want the values in the class columns to be
# 1, 2, ..., 5 and not class1, class2, ..., class5.
#
# Use the mutate() function from dplyr along with
# extract_numeric(). Hint: You can "overwrite" a column
# with mutate() by assigning a new value to the existing
# column instead of creating a new column.
#
# Check out ?mutate and/or ?extract_numeric if you need
# a refresher.
#
students3 %>%
  gather(class, grade, class1:class5, na.rm = TRUE) %>%
  spread(test, grade) %>%
  ### Call to mutate() goes here %>%
  mutate(class=extract_numeric(class)) %>%
  print

# Fourth dataset
students4

# Complete the chained command below so that we are
# selecting the id, name, and sex column from students4
# and storing the result in student_info.
#
student_info <- students4 %>%
  select(id,name ,sex ) %>%
  print

# Add a call to unique() below, which will remove
# duplicate rows from student_info.
#
# Like with the call to the print() function below,
# you can omit the parentheses after the function name.
# This is a nice feature of %>% that applies when
# there are no additional arguments to specify.
#
student_info <- students4 %>%
  select(id, name, sex) %>%
  ### Your code here %>%
  unique() %>%
  print

# select() the id, class, midterm, and final columns
# (in that order) and store the result in gradebook.
#
gradebook <- students4 %>%
  select(id,class,midterm,final) %>%
  print


# dataset
passed
failed


# Use dplyr's mutate() to add a new column to the passed table. The
#  column should be called status and the value, "passed" (a character
#  string), should be the same for all students. 'Overwrite' the current
#  version of passed with the new one.

passed <- mutate(passed, status="passed")
failed <- mutate(failed, status="failed")

# Now, pass as arguments the passed and failed tables (in order) to the
#  dplyr function rbind_list() (for 'row bind'), which will join them
#  together into a single unit. Check ?rbind_list if you need help.

rbind_list(passed, failed)

# The SAT is a popular college-readiness exam in the United States that
#  consists of three sections: critical reading, mathematics, and writing.
#  Students can earn up to 800 points on each section. This dataset
#  presents the total number of students, for each combination of exam
#  section and sex, within each of six score ranges. It comes from the
#  'Total Group Report 2013', which can be found here:
#   
#    http://research.collegeboard.org/programs/sat/data/cb-seniors-2013

sat

# Accomplish the following three goals:
#
# 1. select() all columns that do NOT contain the word "total",
# since if we have the male and female data, we can always
# recreate the total count in a separate column, if we want it.
# Hint: Use the contains() function, which you'll
# find detailed in 'Selection' section of ?select.
#
# 2. gather() all columns EXCEPT score_range, using
# key = part_sex and value = count.
#
# 3. separate() part_sex into two separate variables (columns),
# called "part" and "sex", respectively. You may need to check
# the 'Examples' section of ?separate to remember how the 'into'
# argument should be phrased.
#
sat %>%
  select(-contains("total")) %>%
  gather(part_sex,count,-score_range) %>%
  separate(col=part_sex, c("part","sex")) %>%
  print

# Append two more function calls to accomplish the following:
#
# 1. Use group_by() (from dplyr) to group the data by part and
# sex, in that order.
#
# 2. Use mutate to add two new columns, whose values will be
# automatically computed group-by-group:
#
#   * total = sum(count)
#   * prop = count / total
#
sat %>%
  select(-contains("total")) %>%
  gather(part_sex, count, -score_range) %>%
  separate(part_sex, c("part", "sex")) %>%
  group_by(part,sex) %>%
  mutate(total = sum(count),prop = count / total) %>% 
  print


