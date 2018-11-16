## Simulate data from the model

```r
# Values of the parameters.
theta <- list("a" = 10, "v" = 3)

# Support points.
da <- data.frame(x = seq(from = 1, to = 10, by = 0.5))

# Values of the responde variable.
da$y <- with(theta, {
    a * da$x/(v + da$x) + rnorm(nrow(da), mean = 0, sd = 0.1)
})

# Real curve over the observed data.
plot(y ~ x, data = da)
with(theta, curve(a * x/(v + x), add = TRUE, col = "#008d4c"))
```

## Fit the model to data

```r
fit <- nls(formula = y ~ a * x/(v + x),
           data = da,
           start = list(a = 10, v = 3),
           trace = TRUE)
summary(fit)

coef(fit) # Estimated coefficients.
vcov(fit) # Covariance matrix.

fitted(fit)    # Fitted values.
residuals(fit) # Residuals.

# Fitted curve over the observed data.
plot(y ~ x, data = da)
with(as.list(coef(fit)),
     curve(a * x/(v + x), add = TRUE, col = "#008d4c"))
```
