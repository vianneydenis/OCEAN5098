##### IN DEVELOPMENT 

```{r,  eval=F}
library(RColorBrewer)
library(dplyr)
library(devtools)
library(ggsflabel)
# devtools::install_github("yutannihilation/ggsflabel") #None

df.pop <- read.csv("Data/tw_population.csv", h = T)
df.pop <- data.frame(df.pop)

ggplot(df.pop, aes(x = reorder(County, Population), y = Population/10000, fill = Category)) +
  geom_bar(stat="identity") +
  coord_flip() +
  labs(title = "Taiwan Population", x = "County", y = "Population(萬)")

taiwan.map <- st_read ("Data/GADM/gadm36_TWN_2.shp")

ggplot(data = taiwan.map) +
  geom_sf() +
  labs(title = "Taiwan Map ")

ggplot(data = taiwan.map) +
  geom_sf(aes(fill = NAME_2), show.legend= F) +
  geom_sf_text(aes(label = NAME_2), size = 3) +
  labs(title = "Taiwan Map ")

ggplot(data = taiwan.map) +
  geom_sf(aes(fill = NAME_2)) +
  scale_fill_manual(name = "County",values = colorRampPalette(brewer.pal(8, "Accent"))(22)) +
  labs(title = "Taiwan Map ")
```

Combine the two datasets:
  
  
  ```{r,  eval=T}
my.taiwan.map <- taiwan.map[c("NAME_2", "geometry")]
my.taiwan.map$NAME_2 <- as.character(my.taiwan.map$NAME_2)
my.taiwan.map.data <- left_join(my.taiwan.map, df.pop,by= c("NAME_2" = "County"))

ggplot(data = my.taiwan.map.data) +
  geom_sf(aes(fill = Population))

ggplot(data = my.taiwan.map.data) +
  geom_sf(aes(fill = Population/10000)) +
  scale_fill_distiller(palette = "Spectral", name = "Population(x10,000)") +
  geom_sf_label_repel(aes(label = NAME_2, alpha = 1)) +
  labs(title="Taiwan popualtion map", x ="Longitude", y = "Latitude")
```

Make it interactive:
  
  ```{r,  eval=T}
# not run
# library(mapview)
# library(fields)
# mapview(my.taiwan.map.data["Population"])
# mapview(my.taiwan.map.data["Population"], col.regions = tim.colors(100))
```