# Let's map the flags Scott has. 

library(googlesheets4); library(tidyverse); library(mapview); library(sf)

#x <- read_sheet("https://docs.google.com/spreadsheets/d/1a2yC6RejDHOj4HzD3y0TH74OEdE2aOglkfTlSlec9eY")
#x <- na.omit(x)

load("data.Rda")
sf <- st_as_sf(x, coords = c("x", "y"), crs = 4326) %>% 
  select(-c(notes))%>% 
  st_jitter(factor = 0.001)

ggplot() + 
  geom_sf(data = sf)

scottFlags <- mapview(sf, 
        zcol = "type",
        alpha = 0,
        layer.name = "Type")

mapviewOptions(fgb = FALSE)
mapshot(scottFlags, url = paste0(getwd(), "/scottFlags.html"),
        file = paste0(getwd(), "/scotFlags.png"))
