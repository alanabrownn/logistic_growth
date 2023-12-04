#Script to plot data and model

growth_data <- read.csv("experiment2.csv")

#1) We want to plot initial data again
#2) and compare this to a logistic model, whose parameters have been estimated using linear approximation

logistic_fun <- function(t) { #defining the function that we want to be applied to N for our model 
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)

}

N0 <- 3592.47981756 #defining the parameters that we want to input from it 

r <- 0.02139

K <- 1000000000      


#Plotting graph which has initial data + logistic model plotted
ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() +

  #scale_y_continuous(trans='log10') This could make it linear if you want to see how good it is 
  
  
  
  #POST-ANALYSIS: 
  
  #To save the information about the packages used in this session:
  #Creates a text file with the package-version information inside
  
sink(file = "package-versions.txt")
sessionInfo()
sink()


#scale_y_continuous(trans='log10') This could make it linear if you want to see how good it is 


  


