#########################
##Created by Holly Gray##
#########################

# Packages 
library(ggplot2) 
library(RColorBrewer) 
library(ComplexUpset) 


# reading in the data
FULL <- read.csv("~/MSc_manuscript/Upset_09Nov23.csv")
View(FULL) #checking that the correct data is loaded
str(FULL) # structure of the variables, seeing that there is the binary 0,1 matrix

#specifying names used for the antibiotic labels
antibiotics <-c("Cefotaxime","Ceftazidime","Trimethoprim_sulfamethoxazole","Gentamicin","Tetracycline","Ciprofloxacin","Nitrofurantoin","Streptomycin","Cefoxitin","Chloramphenicol")

antibiotics <- c("CTX", "CAZ", "TS",  "GM","T", "CIP", "NI", "S", "FOX", "C") 
names(antibiotics) <- antibiotics 

# constructing the plot with ggplot2 

upset(
  FULL,
  antibiotics,
  name = "Resistance combinations of the ten antibiotics", 
  base_annotations=list(
    'Intersection size'=intersection_size(
      counts=FALSE,
      mapping=aes(fill=Site)
    ) 
    + geom_bar(stat="identity",colour="black") 
    + ylab('Number of isolates')
    + labs(fill = "Site") +
      scale_y_continuous(breaks = c(0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20)) 
  ),
  width_ratio=0.1,
  stripes='white'
) & scale_fill_manual(values = c("#882255","#88ccee", "#44aa99", "#DDCC77", "#cc6677")) 

ggsave("Upset_09Nov23.png", width=10, height = 6)
ggsave("Upset_09Nov23.svg", width=10, height = 6)

#export as 1000 x 813 something (updates automatically)
