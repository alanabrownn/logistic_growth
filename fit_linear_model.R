#Script to estimate the model parameters using a linear approximation-------------


#Install and attach packages----------------------------------------------------

#Install dplyr - used for data visualization and analysis
#Attach dplyr to current R session 

install.packages("dplyr")
library(dplyr)

#Read in data------------------------------------------------------------------------

#Read in csv data file using the read.csv() function
#Name the object growth_data

growth_data <- read.csv("experiment2.csv")

#Parameter estimation (N0 and r) using exponential section-----------------------------------

#Isolating the exponential section will allow us to estimate N0 and r
#Given that during exponential growth, N(t) = N0e^rt
#Here, K >> N0, t is small

data_subset1 <- growth_data %>% filter(t<550) %>% mutate(N_log = log(N))
#Creating a subset of the data using the filter() function to isolate the exponential section
#We identified 700 from our data plots, given that below this time the number of cells increased exponentially
#mutate() function is used to create new column that is functions of existing variables
#This new column is named N_log, and it results from taking the log of N

model1 <- lm(N_log ~ t, data_subset1)
#lm() function used to create a linear model
#With N_log on the y-axis 
#With t on the x-axis
#Data = data_subset1

summary(model1) #model summary for parameter estimation

#Parameter estimation (K) using equilibrium section----------------------------------------------------

#Isolating equilibrium section will allow us to estimate carrying capacity - K
#Given that at equilibrium, N(t) = K

data_subset2 <- growth_data %>% filter(t>1500)
#Creating a subset of data using the filter() function to isolate the equilibrium section
#We identified 700 from our data plots, given that above this time, the number of cells remained constant

model2 <- lm(N ~ 1, data_subset2)
#lm() function used to create a linear model
#With N on the y-axis 
#With t on the x-axis
#Data= data_subset2

summary(model2) #Summary of model








#SUMMARY INTERPRETATION 

#model 1 - linear-transformed exponential growth function
#initial function: N(t) = N0e^rt
#log-transformed function: ln(N) = ln(N0) + rt
#as you can see, N and NO have been natural logged, but ln for rt has been cancelled out
#Therefore, the summary interpretations:
#intercept = log-transformed initial population size =   8.186598 
#t = instantaneous growth rate = 0.025874
#Actual summary
#N0 = e^8.186598  = 3592.47981756
#r = 0.02139

#model 2 - linear model for equilibrium section
#no-transformation was added
#Intercept = carrying capacity = 1000000000   