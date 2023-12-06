#code to produce a graph: comparing exponential growth with logistic growth function

#STEP 1) define functions for each 

#exponential function 
exponential_fun <- function(t) { 
  
  N <- N0*exp(r*t)
  
  return(N)
  
}
  
#logistic function

logistic_fun <- function(t) { 
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)

}

#STEP 2) plot these functions

#A. Define parameters:
NO <- 3592.472632607442
r <- 0.025874
K <- 1e+09

#B.Define the time range for the plot
time_range <- seq(0, 5000, by = 0.1)  #This states that we want to obtain
#the function outputs from t 1-5000, for every 0.1 minuite interval

#C. Create a data frame with the column t, containing our time range
output_df <- data.frame(t = time_range)

# use $ to add columns for the outputs of the functions
output_df$exponential_output <- exponential_fun(output_df$t)
output_df$logistic_output <- logistic_fun(output_df$t)

#Plot this dataframe in a graph 

ggplot(output_df, aes(x = t)) + 
  geom_line(aes(y = logistic_output, color = "Logistic model"), size = 1.2) +
  geom_line(aes(y = exponential_output, color = "Exponential model"), size = 1.2) +
  ylim(0, 1.5e+09) +
  scale_color_manual(values = c("Logistic model" = "blue", "Exponential model" = "red")) +
  labs(color = "Model type") + 
  xlab("Time (minuites)") +
  ylab("Population size") +
  ggtitle("A comparison of exponential and logistic model output
using paramaters estimated from our bacterial dataset")


  
  
  
  
  
  
  
  
  
  





