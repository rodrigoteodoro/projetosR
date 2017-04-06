# http://rpubs.com/sinhrks/plot_pca
library(readr)
iris <- read_csv("~/Desenvolvimento/posgraduacao/iris.data", 
                 col_names = TRUE)
library(ggfortify)
df <- iris[c(1, 2, 3, 4)]
autoplot(prcomp(df))
autoplot(prcomp(df), data = iris, colour = 'class')
autoplot(prcomp(df), data = iris, colour = 'class', shape = FALSE, label.size = 3)
df2 <- iris[c(1,2)]
autoplot(prcomp(df2), data = iris, colour = 'class')
df3 <- iris[c(3,4)]
autoplot(prcomp(df3), data = iris, colour = 'class')

library(ggplot2)
ggplot(data=iris, aes(x=sepal_length, y=sepal_width, color=class)) +
  geom_point() +
  guides(fill=TRUE)+
  ggtitle("Gráficos de conexões")

