Sys.getlocale("LC_TIME")

library(lubridate)

help(package = lubridate)

# today
this_day <- today()
this_day

# There are three components to this date. In order, they are year,
#  month, and day. We can extract any of these components using the
#  year(), month(), or day() function, respectively. Try any of those on
#  this_day now.
year(this_day)

# weekday
wday(this_day)
wday(this_day, label = TRUE)

# datetime
this_moment <- now()
this_moment

# we can also use hour(), minute(), and second()
hour(this_moment)

# ymd(), dmy(), hms()
ymd("1989-05-17")

my_date <- ymd("1989-05-17")
my_date

class(my_date)

ymd("1989 May 17")
mdy("March 12, 1975")
dmy(25081985)

ymd("1920/1/2")

# object
dt1

ymd_hms(dt1)

hms("03:22:14")

# datetime vector
dt2
ymd(dt2)

# The update() function allows us to update one or more components of a
#  date-time. For example, let's say the current time is 08:34:55
#  (hh:mm:ss). Update this_moment to the new time using the following
#  command:
 
update(this_moment, hours = 8, minutes = 34, seconds = 55)

this_moment

this_moment <- update(this_moment, hours = 10, minutes = 16, seconds = 0)

this_moment


# Now, pretend you are in New York City and you are planning to visit a
#  friend in Hong Kong. You seem to have misplaced your itinerary, but you
#  know that your flight departs New York at 17:34 (5:34pm) the day after
#  tomorrow. You also know that your flight is scheduled to arrive in Hong
#  Kong exactly 15 hours and 50 minutes after departure.

# Let's reconstruct your itinerary from what you can remember, starting
#  with the full date and time of your departure. We will approach this by
#  finding the current date in New York, adding 2 full days, then setting
#  the time to 17:34

# To find the current date in New York, we'll use the now() function
#  again. This time, however, we'll specify the time zone that we want:
#  "America/New_York". Store the result in a variable called nyc. Check
#  out ?now if you need help.
nyc <- now("America/New_York")
nyc

# Your flight is the day after tomorrow (in New York time), so we want to
#  add two days to nyc. One nice aspect of lubridate is that it allows you
#  to use arithmetic operators on dates and times. In this case, we'd like
#  to add two days to nyc, so we can use the following expression: nyc +
#  days(2). Give it a try, storing the result in a variable called depart

depart <- nyc + days(2)
depart

# So now depart contains the date of the day after tomorrow. Use update()
#  to add the correct hours (17) and minutes (34) to depart. Reassign the
#  result to depart.
depart <- update(depart, hours=17, minutes = 34)
depart


# The first step is to add 15 hours and 50 minutes to your departure
#  time. Recall that nyc + days(2) added two days to the current time in
#  New York. Use the same approach to add 15 hours and 50 minutes to the
#  date-time stored in depart. Store the result in a new variable called
# arrive
arrive <- depart + hours(15) + minutes(50)

# The with_tz() function returns a date-time as it would appear in
#  another time zone. Use ?with_tz to check out the documentation.
?with_tz

# Use with_tz() to convert arrive to the "Asia/Hong_Kong" time zone.
#  Reassign the result to arrive, so that it will get the new value.

arrive <- with_tz(arrive, "Asia/Hong_Kong")
arrive

# Fast forward to your arrival in Hong Kong. You and your friend have
#  just met at the airport and you realize that the last time you were
# together was in Singapore on June 17, 2008. Naturally, you'd like to
#  know exactly how long it has been.

# Use the appropriate lubridate function to parse "June 17, 2008", just
#  like you did near the beginning of this lesson. This time, however, you
#  should specify an extra argument, tz = "Singapore". Store the result in
#  a variable called last_time.

last_time <- mdy("June 17, 2008",tz = "Singapore")
last_time

# Pull up the documentation for new_interval(), which we'll use to
#  explore how much time has passed between arrive and last_time.
?new_interval

# Create a new_interval() that spans from last_time to arrive. Store it
#  in a new variable called how_long.
how_long <- new_interval(last_time, arrive)

# use as.period(how_long) to see how long it's been
as.period(how_long)

# This is where things get a little tricky. Because of things like leap
# | years, leap seconds, and daylight savings time, the length of any given
# | minute, day, month, week, or year is relative to when it occurs. In
# | contrast, the length of a second is always the same, regardless of when
# | it occurs.
# 
# ...
# 
# |=============================================================== |  98%
# 
# | To address these complexities, the authors of lubridate introduce four
# | classes of time related objects: instants, intervals, durations, and
# | periods. These topics are beyond the scope of this lesson, but you can
# | find a complete discussion in the 2011 Journal of Statistical Software
# | paper titled 'Dates and Times Made Easy with lubridate'.
# 
# ...
# 
# |================================================================| 100%
# 
# | This concludes our introduction to working with dates and times in
# | lubridate. I created a little timer that started running in the
# | background when you began this lesson. Type stopwatch() to see how long
# | you've been working!
stopwatch()


