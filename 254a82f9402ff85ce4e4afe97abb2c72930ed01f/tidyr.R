## ----class.source = "fold-show",  eval=T----------------------------
library (tidyr)


## ----  eval=T-------------------------------------------------------

TW_corals<-read.table('Data/tw_corals.txt', header=T, sep='\t', dec='.') 
TW_corals


## ----  eval=T-------------------------------------------------------
TW_corals_long <- TW_corals %>% pivot_longer(Southern_TW:Northern_Is, names_to = "Region", values_to = "Richness")
# TW_corals_long <-TW_corals %>% pivot_longer(cols = everything(), names_to = "Region", values_to = "Richness") 
TW_corals_long 


## ----  eval=T-------------------------------------------------------
TW_corals_wide <- pivot_wider(TW_corals_long, names_from = Region, values_from = Richness) 
TW_corals_wide


## ----  eval=T-------------------------------------------------------
income<-read.table('Data/metoo.txt',header=T, sep="\t", dec=".", na.strings = "n/a")
income


## ----  eval=T-------------------------------------------------------
income_long <- income %>%  pivot_longer(cols = -state, 
                         names_to = c("gender","work"), 
                         names_sep = "_", 
                         values_to = "income")
                         
income_long


## ----  eval=T-------------------------------------------------------
income_long %>% pivot_wider(names_from = c(gender,work), 
            values_from = income,
            names_sep = ".")


## ----  eval=T-------------------------------------------------------
# Let's first create a delimited table
income_long_var <- income %>%  pivot_longer(cols = -1, 
                         names_to = "var1", 
                         values_to = "income")
income_long_var


## ----  eval=T-------------------------------------------------------
# Split var1 column into two columns
income_sep <- income_long_var %>%  separate(col = var1, 
                    sep = "_", 
                    into = c("gender", "work"))
income_sep


## ----  eval=T-------------------------------------------------------
income_long_var %>% separate_rows(var1, sep = "_")

```{.r .distill-force-highlighting-css}
```
