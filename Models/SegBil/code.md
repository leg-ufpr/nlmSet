## Simulate data from the model

```r
# Values of the parameters.
theta <- list("a" = 10, "c" = 0.2)

# Support points.
da <- data.frame(x = seq(from = 1, to = 10, by = 0.5))

# Values of the responde variable.
da$y <- with(theta, {
    a * (1 - exp(-c * da$x)) + rnorm(nrow(da), mean = 0, sd = 0.1)
})

# Real curve over the observed data.
plot(y ~ x, data = da)
with(theta, curve(a * (1 - exp(-c * x)), add = TRUE, col = "#008d4c"))
```

## Fit the model to data

```r
fit <- nls(formula = y ~ a * (1 - exp(-c * x)),
           data = da,
           start = list(a = 10, c = 0.2),
           trace = TRUE)
summary(fit)

coef(fit) # Estimated coefficients.
vcov(fit) # Covariance matrix.

fitted(fit)    # Fitted values.
residuals(fit) # Residuals.

# Fitted curve over the observed data.
plot(y ~ x, data = da)
with(as.list(coef(fit)),
     curve(a * (1 - exp(-c * x)), add = TRUE, col = "#008d4c"))
```
