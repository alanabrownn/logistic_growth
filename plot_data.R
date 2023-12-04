#Script to plot the logistic growth data---------------------------------------------

#Read in data------------------------------------------------------------------------

#Read in csv data file using the read.csv() function
#Name the object growth_data

growth_data <- read.csv("experiment2.csv") 

#Install and attach packages---------------------------------------------------------

#Install ggplot2 - used to plot the logistic graph
#Attach ggplot2 to current R session

install.packages("ggplot2") 
library(ggplot2)

#Plotting logistic graph for growth data--------------------------------------------

ggplot(aes(t,N), data = growth_data) + 
  #aes() describes which variables in the data should be mapped to which aesthetics - x and y
  #data = to specify which dataset to use for the plot 
  geom_point() +  #used to create scatterplots 

  xlab("t") + #Name the x-axis "t" to represent time
  
  ylab("y") + #Name the y-axis "y" to represent number of cells
  
  theme_bw() #Theme selection

#Plot a semi-log graph for growth_data---------------------------------------------

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10') #Used to log-transform y-axis

