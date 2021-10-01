library (dplyr)

summarised <- summarise(iris, Mean.Width = mean(Sepal.Width))
head(summarised)

# by column names
selected <- select(iris, Sepal.Length, Sepal.Width, Petal.Length)
head(selected) 

# by column range
selected1 <- select(iris, Sepal.Length:Petal.Length)
head(selected1, 4)

# by column range number
selected2 <- select(iris,c(2:5))
head(selected2)

selected <- select(iris, -Sepal.Length, -Sepal.Width)

# Select setosa species
filtered <- filter(iris, Species == "setosa" )
head(filtered,3)

# Select versicolor species with Sepal width more than 3
filtered1 <- filter(iris, Species == "versicolor", Sepal.Width > 3)
tail(filtered1)

#To create a column “Greater.Half” which stores TRUE if given condition is TRUE
mutated1 <- mutate(iris, Greater.Half = Sepal.Width > 0.5 * Sepal.Length)
tail(mutated1)

table(mutated1$Greater.Half)

# Sepal Width by ascending order
arranged <- arrange(iris, Sepal.Width)
head(arranged)

# Sepal Width by descending order
arranged1 <- arrange(iris, desc(Sepal.Width))
head(arranged1)

# Mean sepal width by Species
gp <- group_by(iris, Species)
gp.mean <- summarise(gp,Mean.Sepal = mean(Sepal.Width))
gp.mean

#To select the rows with conditions
iris %>% filter(Species == "setosa",Sepal.Width > 3.8)

iris  %>% group_by(Species) %>% summarise(Mean.Length = mean(Sepal.Length))
```{.r .distill-force-highlighting-css}
```
