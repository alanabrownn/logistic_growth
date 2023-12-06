#Code to calculate N(t) when t = 4980 min 

#EXPONENTIAL GROWTH

#Equation: N(t) = N0*exp(r*t)
#defining parameters: 
NO <- 3592.472632607442
r <- 0.025874
t<- 4980
K <- 1e+09
#using the equation:
N_4980_exponential <-  N0*exp(r*t)
N_4980_exponential

#output value:
#N(4980) = 3.275909e+59

#LOGISTIC GROWTH 

#Equation: N(t) <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
#defining parameters
NO <- 3592.472632607442
r <- 0.025874
t<- 4980
#using the equation 
N_4980_logistic <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
N_4980_logistic

#output value:
#N(4980) = 1e+09 (aka. carrying capacity)


