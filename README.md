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

### Isolating the exponential phase to estimate N0 and r
To be able to estimate parameters from the exponential phase, we log-transform N to linearize the relationship. To be able to isolate it, we have to select an upper limit for t and I chose 550 minutes given that the population experiences fast growth rate before this time (as evident in the graphs). The code used to subset the data and fit the linear model was:

```
data_subset1 <- growth_data %>% filter(t<550) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
```

The summary output:

```
summary(model1)
```

```
Call:
lm(formula = N_log ~ t, data = data_subset1)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.48022 -0.28403  0.03346  0.57755  0.80621 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 8.186598   0.438530   18.67 7.00e-08 ***
t           0.025874   0.001369   18.90 6.35e-08 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.7461 on 8 degrees of freedom
Multiple R-squared:  0.9781,	Adjusted R-squared:  0.9754 
F-statistic: 357.2 on 1 and 8 DF,  p-value: 6.355e-08
```
Estimations from this output:
- Intercept Estimate = **N0** = 8.186596
- t Estimate = **r** = 0.025874 

For this model, when K>>N0 and t is small (ie. at the start of the experiment), the linear approximation equation derived from the original, is: ln(N) = ln(N0) + rt. This means, that the estimate for N0 must be back-transformed to obtain the actual estimate. For r however, no back-transformation has to be carried out given that it did not undergo a ln transformation as seen in the equation.

Actual estimations from this output: 
- **NO** = e^8.186596 (back-transform for ln) = 3592.472632607442
- **r** = 0.025874 

### Isolating the equilibrium phase to estimate K
Next, we want to isolate the equilibrium phase. Once we've done this, we can fit a linear model whose intercept represents the carrying capacity. For the isolation, I selected a lower limit of 1500 minutes because after this time, the population remains constant. The code used to subset the data and fit the linear model was:

```
data_subset2 <- growth_data %>% filter(t>1500)

model2 <- lm(N ~ 1, data_subset2)
```
The summary output:

```
summary(model2)
```
```
Call:
lm(formula = N ~ 1, data = data_subset2)

Residuals:
    Min      1Q  Median      3Q     Max 
-193.71  -76.21  -22.21   44.04  279.29 

Coefficients:
             Estimate Std. Error  t value Pr(>|t|)    
(Intercept) 1.000e+09  1.347e+01 74265523   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 102.5 on 57 degrees of freedom
```

The Intercept Estimate represents the carrying capacity 
K= 1.000e+09 = 
This is what we also see on the graph which is a good sign
 
### My final paramater estimates

- **NO = 3592.472632607442**
- **r = 0.025874**
- **K = 1000000000**


