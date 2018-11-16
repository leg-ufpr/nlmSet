  thetaA <- input$tA
  thetaV <- input$tV

  mForm1 <- as.formula("Y ~ (thetaA * x)/(thetaV  + x)")
  mExpr1 <- mForm1[[3]]



  eval(call("curve", mExpr1, col = 2, ylab = "",
            main = "Michaelis-Menten"
  ))
