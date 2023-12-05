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

```
growth_data <- read.csv("experiment2.csv") 
```

### Initial data plots

In order to examine this dataset, I first created plots using the ggplot2 package. You can find these plots plus the detailed code used to produce them in my `plot_data.R` file.

Firstly, I made a graph which explored the relationship between time (x-axis) and population size (N). The code used to produce this graph was:  

```
ggplot(aes(t,N), data = growth_data) + 
  
  geom_point() + 

  xlab("t") + 
  
  ylab("y") + 
  
  theme_bw() #
```

Secondly, I made a graph which explored the relationship between time (x-axis), and the *log-transformed* values for population size (N). This *semi-logarithmic* graph is useful because it allows for simpler analysis and parameter estimation. The code used to produce this graph was: 

```
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')
```

**These plots can be seen below**

*The relationship between time (t) and population size (N)*
![Initial plot](https://github.com/alanabrownn/logistic_growth/blob/44d5d7a2584394f28c8b8342659b008bccccc261/Initial%20plot.png)

*The relationship between time (t) and log-transformed population size (log10N)*
![Transformed initial plot](https://github.com/alanabrownn/logistic_growth/blob/ce883b54a9319a92c5ac6c481964cee8bcda9949/transformed%20initial%20plot.png)

From these graphs, it is evident that the population is exhibiting logistic growth. It undergoes an initial period of exponential growth, followed by a decrease in growth rate and a plateau of population size at a carrying capacity. This fits with our biological understanding set out earlier. 

### Fitting models 

Whilst plotting the initial dataset is valuable to gain an insight to population growth, the next important step is to fit a model. Fitting a model has several benefits - it allows you to predict, extrapolate, and estimate parameters from a given relationship. Like I said previously, a logistic model is most appropriate for this data, given by the equation: 

```math
\begin{equation}
N(t) = \frac{K N_0 e^{rt}}{K-N_0+N_0 e^{rt}}
\end{equation}
```

But as you can see, to be able to fit this, the following parameters must be calculated:
- N0 (initial population size)
- r (growth rate)
- K (carrying capacity)

Being able to obtain exact parameters from a dataset is difficult. However, we can use **linear approximation** to estimate them.
- To be able to estimate N0 and r, we can isolate and fit a linear model to the exponential growth phase. 
- To estimate K, we can fit a linear model to the equilibrium phase.  
















