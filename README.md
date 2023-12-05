# Assignment Questions - Alana Brown 

## Question 1) Explaination of my analysis 

### Context 

My overall aim is to fit a model to population growth data, obtained for *Escherichia coli*. The initial experimental conditions were simple - 100µl of the bacteria isolate were inoculated into 900µl of growth media, resulting in a total volume of 1ml in a test tube. The bacteria were then left for 5000 minutes, and population size (N) was estimated at regular intervals. 

In accordance with ecological theory, the bacteria will start multiplying at a fast rate given that there are many resources available in the test tube. However, as resources become more scarce, the competition between individuals will become stronger, leading to a decrease in growth rate. Ultimately, population size will plataeu and remain constant after reaching its carrying capacity. 

### Model selection

For this reason, *logistic models* are typically used to describe population growth dynamics. They are characterized by being "S" shaped, and they comprise a initial phase of exponential growth, followed by an equilibrium. The equation most relevant this work is: 

```math
\begin{equation}
\lim\limits_{t \to \infty} N(t) = K
\end{equation}
```

HELLO









