# load packages
require(reshape2)
require(ggplot2)
require(viridis)
require(dplyr)
 
# get the data
url = 'http://www.biz.uiowa.edu/faculty/jledolter/DataMining/protein.csv'
food = read.csv(url)
 
# filter on specific countries
food = subset(food, food$Country %in% c("Albania","Belgium","Denmark","France","Romania","USSR","W Germany","Finland","UK"))

# melt data
DT1 = melt(food,id.vars = "Country")
 
# plot data
ggplot(DT1, aes(Country, value)) +
geom_bar(aes(fill = Country), position = "dodge", stat="identity") +
facet_wrap(~variable, scales = "free") +
xlab("") + ylab("protein intake (in %)") +
theme(axis.text.x=element_blank()) +
scale_fill_viridis(discrete=TRUE)
