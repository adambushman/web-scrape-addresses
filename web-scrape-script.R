##########################
# Web Scraping Addresses #
# Sam's Club Locations   #
# Adam Bushman           #
##########################


library('rvest')
library('dplyr')
library('tidyr')
library('stringr')

###
# Sam's Club Addresses List
###
url <- "https://malls.fandom.com/wiki/List_of_Sam%27s_Club_Locations"
page = read_html(url)
raw <- 
  page %>% 
  html_nodes('h3, h3 + ul li') %>%
  html_text() %>%
  .[1:(which(. == "Explore properties") - 1)]

###
# Convert to a dataframe
###
addresses = c()
cities = c()
states = c()

end = which(str_detect(raw, "Casper - 4600 E 2nd St.")) #The very last active address

for(i in raw[1:end]) {
  if(str_detect(i, "\\[")) {
    s = str_sub(i, 1, str_length(i)-2)
  } else {
    cities[length(cities)+1] = str_sub(i, 1, str_locate(i, "-")[,1]-2)
    addresses[length(addresses)+1] = str_sub(i, 
                                             str_locate(i, "-")[,1]+2, 
                                             coalesce(str_locate(i, "\\(")[,1]-2, 
                                                      str_length(i)))
    states[length(states)+1] = s
  }
}

fullAddresses <-
  data.frame(
    address = addresses, 
    city = cities, 
    state = states
  )

###
# Checking for missing data
###
sapply(fullAddresses, function(x) sum(is.na(x)))

###
# Data Export
###
write.csv(fullAddresses, 'sams-club-addresses.csv', row.names = FALSE)
