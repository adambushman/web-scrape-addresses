![Rvest Package Artwork](https://user-images.githubusercontent.com/76189854/177424740-4626fa4a-8fc7-4d98-b3d9-fcc657e3531b.png)

# Webscraping for Sam's Club Addresses

An R file for webscraping and cleaning Sam's Club addresses using {rvest} and other {tidyverse} packages.

## Description

Our family are frequentists at Sam's Club. We enjoy the selection and you can't beat the club prices on gas and other items. Recently we've talked about moving and 
exploring the US after a recent East Coast road trip from northern Florida to Maryland. We stopped at a handful of clubs on the trip and it got us thinking: how might 
we consider the presence of Sam's Club locations in our search?

Looking around for a suitable list of locations was difficult since the offial source works to encapsulate the full, raw location data so the user can focus on stores
around a precise location. I as more interested, however, in the full gammut (to setup some geospatial data viz). I found the right data at 
[Malls and Retail Wiki](https://malls.fandom.com/wiki/List_of_Sam%27s_Club_Locations) 
but was in a form not very condusive to such analysis. I was therefore prompted to sharpen my web-scraping skills.

Within this repository you'll find the .R file and the cleaned CSV from the cleaning pipelines created.

Take a look at the data visualization that developed thanks to this web scraping project: 
[ggplot2 Learn and Practice Blog Post](https://adam-bushman.com/project_posts/proj_ggplot2-learn-and-practice.html)

## Packages Used

{rvest} for web scraping
{stringr} to parse and fix issues with addresses
{dplyr} to construct data pipelines

[ggplot2 Learn and Practice Blog Post](https://adam-bushman.com/project_posts/proj_ggplot2-learn-and-practice.html)
