#########################
##Created by Holly Gray##
#########################

library(ggplot2)  
library(gplots)
install.packages("devtools")
devtools::install_github("erblast/easyalluvial")
library("alluvial") 
library(ggalluvial) 
require(easyalluvial)

ST_352_counts <- read.csv("C:/Users/16049808/Downloads/ST_352_counts_19Jun23.csv")

#Formatting data
ST_352_counts$Date<- as.factor(ST_352_counts$Date, levels=c("Aug-19", "Sep-19", "Oct-19", "Nov-19", "Dec-19", "Jan-20", "Feb-20", "Mar-20", "Apr-20", "May-20", "Jun-20", "Jul-20", "Aug-20", "Sep-20", "Oct-20", "Nov-20", "Dec-20", "Jan-21"))
is_alluvia_form(as.data.frame(ST_352_counts), axes = 1, silent = TRUE)
ST_352_counts$ST<- factor(ST_352_counts$ST, levels=c("10", "12", "38","69", "73", "127", "131","648","998","1193","1722","4553", "7476","Less_than_three"))                                                                               

ST_352_counts$Date<- factor(ST_352_counts$Date, levels=c("Aug-19", "Sep-19", "Oct-19", "Nov-19", "Dec-19", "Jan-20", "Feb-20", "Mar-20", "Apr-20", "May-20", "Jun-20", "Jul-20", "Aug-20", "Sep-20", "Oct-20", "Nov-20", "Dec-20", "Jan-21"))

ST_over<-ggplot(data = ST_352_counts,
       aes(x = Date, stratum = Counts, alluvium = ST,
           y = Counts, label = Counts)) +
  geom_alluvium(aes(fill = ST)) +
  theme_minimal()+
  scale_x_discrete(limits = c("Aug-19", "Sep-19", "Oct-19", "Nov-19", "Dec-19", "Jan-20", "Feb-20", "Mar-20", "Apr-20", "May-20", "Jun-20", "Jul-20", "Aug-20", "Sep-20", "Oct-20", "Nov-20", "Dec-20", "Jan-21"), expand = c(.05, .05)) +
  scale_fill_manual(values = c("#68affc", "#1c5872", "#7ee8c0", "#16894a", "#2af385","#a9d541", "#ec102f", "#fbbd13", "#972554", "#9f66ed", "#64903a", "#f4b6c7", "#340785","#d3d3d3"), na.value = NA) +
  scale_color_manual(values = c("#68affc", "#1c5872", "#7ee8c0", "#16894a", "#2af385", "#a9d541", "#ec102f", "#fbbd13", "#972554", "#9f66ed", "#64903a", "#f4b6c7", "#340785","#d3d3d3")) +
  geom_vline(xintercept = 9, size=1, colour = "#57504d") + 
  geom_vline(xintercept = 10, size=1, colour = "#57504d") + 
  annotate(
    "text", x = 9.5, y = 25, angle = 90, family = "Poppins", size = 4, color = "gray20", lineheight = .9,
    label = "No samples collected, \n New Zealand \n Goverment-imposed \n COVID-19 restrictions") +
  geom_segment(mapping=aes(x=9.1, y=14, xend=9.9, yend=14), arrow=arrow(ends='both'), size=0.8, color="#57504d")


ggsave("ST_over_time_white_19Jun23.png", height=9 ,width=18)
ggsave(file="ST_over_time_white_25Sept23.svg", plot=ST_over, height=9, width=18)
