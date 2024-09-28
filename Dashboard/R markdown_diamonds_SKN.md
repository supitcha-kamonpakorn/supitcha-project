---
title: "R markdown_diamonds"
author: "supitcha.k"
date: "2024-09-03"
output:
  pdf_document: default
  html_document: default
---

# R markdown by ggplot2
## data = diamonds
```{r}
library(tidyverse)
library(ggplot2)
```
## preparation data
```{r}
set.seed(09)
small_diamonds <- sample_n(diamonds, 1000)
```


## chart1: carat histogram
### Count weight of the diamond (0.2–5.01)(carat)
```{r}
ggplot(small_diamonds, aes(carat)) +
  geom_histogram(bins = 8, fill = "pink", alpha = 0.5, color = "black") +
  labs(title = "chart1: Count weight of the diamond (0.2–5.01)(carat)",
       caption = "Source: Diamonds from ggplot2 packages")
```


## chart2: bar chart
### Count quality of the cut (Fair, Good, Very Good, Premium, Ideal)
```{r}
ggplot(small_diamonds, aes(cut, fill = cut)) +
  geom_bar(color = "black") +
  theme_classic() +
  labs(title = "chart2: Count quality of the cut (Fair, Good, Very Good, Premium, Ideal)",
       caption = "Source: Diamonds from ggplot2 packages")
```

## chart3: scatter plot
### Relationship between carat and price
```{r}
base <- ggplot(data = small_diamonds,
               mapping = aes(carat, price))

base +
  geom_point(mapping = aes(col = carat))+
  geom_smooth() +
  geom_rug() +
  theme_classic() +
  labs(title = "chart3: Relationship between carat and price",
       caption = "Source: Diamonds from ggplot2 packages")
```

## chart4: facet
### Relationship between carat and clarity
```{r}
base2 <- ggplot(data = small_diamonds,
               mapping = aes(carat, clarity, col = clarity))

base2 + 
  geom_point(size = 3, alpha = 0.3) +
  theme_minimal() +
  facet_wrap(~clarity, ncol = 2) +
  labs(title = "chart4: Relationship between carat and clarity",
       caption = "Source: Diamonds from ggplot2 packages")
```

## chart5: bar chart
### Count quality of the cut by diamond colour
```{r}
base3 <- ggplot(data = small_diamonds,
                mapping = aes(cut, fill = color))

base3 +
  geom_bar() +
  labs(title = "chart5: Count quality of the cut by diamond colour",
       caption = "Source: Diamonds from ggplot2 packages")
```

