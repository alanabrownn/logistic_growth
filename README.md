# Assignment Questions - Alana Brown 

## Question 1) Explaination of my analysis 

### Context 

My overall aim is to fit a model to population growth data, obtained for *Escherichia coli*. The initial experimental conditions were simple - 100µl of the bacteria isolate were inoculated into 900µl of growth media, resulting in a total volume of 1ml in a test tube. The bacteria were then left for 5000 minutes, and population size (N) was estimated at regular intervals. 

In accordance with ecological theory, the bacteria will start multiplying at a fast rate given that there are many resources available in the test tube. However, as resources become more scarce, the competition between individuals will become stronger, leading to a decrease in growth rate. Ultimately, population size will plataeu and remain constant after reaching its carrying capacity. 

### Model selection

For this reason, *logistic models* are typically used to describe population growth dynamics. They are characterized by being "S" shaped, and they comprise a initial phase of exponential growth, followed by an equilibrium. The equation I am going to use can be seen below, and it relates the population size at time t N(t), to initial population size (N0), growth rate (r) and the carrying capacity (k)

```math
\begin{equation}
N(t) = \frac{K N_0 e^{rt}}{K-N_0+N_0 e^{rt}}
\end{equation}
```


### The data 

The dataset used: `experiment2.csv` file within my `experiment2.csv` repo
This contains a column for t (time) and a column for N (population size)
I read in this data using the read.csv() function, and stored it in an object called growth_data.

growth_data <- read.csv("experiment2.csv") 

### Initial data plots

In order to examine this dataset, I first created plots using the ggplot2 package. You can find these plots and the detailed code used to produce them in my `plot_data.R` file.

Firstly, I made a graph which explored the relationship between time (x-axis) and population size (N). The code used to produce this graph was:  

```
ggplot(aes(t,N), data = growth_data) + 
  
  geom_point() +  #used to create scatterplots 

  xlab("t") + #Name the x-axis "t" to represent time
  
  ylab("y") + #Name the y-axis "y" to represent number of cells
  
  theme_bw() #Theme selection
```











