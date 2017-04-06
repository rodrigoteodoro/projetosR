# https://cran.r-project.org/web/packages/rjson/rjson.pdf
library("rjson")
json_file <- "https://stcruz.syncnet.com.br/monitoramento?login=rteodoro&senha=senha%3B"
library(RCurl)
json_file <- getURL(json_file, ssl.verifypeer = FALSE)
json_data <- fromJSON(json_file)
# fromJSON(json_file, method = "R")
# print(json_data$conexoes$validas)
# http://www.cookbook-r.com/Graphs/Bar_and_line_graphs_(ggplot2)/
library(ggplot2)
dat <- data.frame(
  conexoes = factor(c("Validas","Invalidas"), levels=c("Validas","Invalidas")),
  quantidade = c(json_data$conexoes$validas, json_data$conexoes$invalidas)
)
ggplot(data=dat, aes(x=conexoes, y=quantidade, fill=conexoes)) +
  geom_bar(colour="black", stat="identity", fill="#DD8888", width=.8) +
  guides(fill=TRUE)+
  ggtitle("Gráficos de conexões")
