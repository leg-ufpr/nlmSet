`
mForm6 <- as.formula("Y ~ thetaA * (1 - exp(-theta0 * x")))

mExpr6 <- mForm6[[3]]

thetaA <- input$tA
theta0 <- input$t0

eval(call("curve", mExpr6, from = 0, to = 10, col = 2, ylab = "" ,
            main = "Asymptotic Exponential"

))
`
