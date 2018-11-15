# Server - Asymptotic Exponential -----------------------------------------

# Parametros e função -----------------------------------------------------


switch (input$serEA,
  "Asymptotic Exponential" = {

  thetaA <- input$tA
  theta0 <- input$t0
  
  exp1 <- Vectorize(function(x){
    result <- thetaA*(1 - exp(-theta0 * x))
    return(result)
  })
  
},
  "Asymptotic Exponential Reparametrized" = {
  thetaA_1 <- input$tA_1
  theta0_1 <- input$t0_1
  q <- input$q_1

  exp2 <- Vectorize(function(x){
    result2 <- thetaA_1*(1 - exp((x * log(1 - q))/theta0_1))
    return(result2)
  })
})

# Grafico -----------------------------------------------------------------

switch (input$serEA,

  "Asymptotic Exponential" = {
  
    var <- ggplot(data.frame(x = c(0, 10)), aes(x)) +
    stat_function(fun = exp1, size = 1, colour = "blue") +
    theme_bw() +
    xlab("") + ylab("")
  
},

  "Asymptotic Exponential Reparametrized" = {  

  var <- ggplot(data.frame(x = c(0, 10)), aes(x)) +
    stat_function(fun = exp2, size = 1, colour = "blue") +
    theme_bw() +
    xlab("") + ylab("")
  
})


var
