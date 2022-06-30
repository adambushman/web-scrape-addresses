library('rvest')
library('dplyr')
library('tidyr')
library('stringr')

url <- "https://malls.fandom.com/wiki/List_of_Sam%27s_Club_Locations"

page = read_html(url)
raw <- 
  page %>% 
  html_nodes('h3, h3 + ul li') %>%
  html_text() %>%
  .[1:(which(. == "Explore properties") - 1)]

addresses = c()
cities = c()
states = c()

for(i in raw) {
  if(str_detect(i, "\\[")) {
    s = str_sub(i, 1, str_length(i)-2)
  } else {
    cities[length(cities)+1] = str_sub(i, 1, str_locate(i, "-")[,1]-2)
    addresses[length(addresses)+1] = str_sub(i, 
                                             str_locate(i, "-")[,1]+2, 
                                             str_locate(i, "\\(")[,1]-2)
    states[length(states)+1] = s
  }
}

fullAddresses <-
  data.frame(
    address = paste(addresses, cities, states)
  )

fullAddresses$address[603] = paste("3855 S US Highway 1", fullAddresses$address[603])

write.csv(fullAddresses, 'sams-club-addresses.csv', row.names = FALSE)