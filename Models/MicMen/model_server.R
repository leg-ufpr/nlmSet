switch (input$serMM,
  
  "Michaelis-Menten" = {

  
  thetaA_0 <- input$tA_0
  thetaV_0 <- input$tV_0
  
  exp1 <- Vectorize(function(x){
    result <- (thetaA_0 * x)/(thetaV_0 + x)
    return(result)
  })
  
},
  
  "Michaelis-Menten Reparametrization" = {
  thetaA_1 <- input$tA_1
  thetaV_1 <- input$tV_1
  q_1 <- input$q_1
  
  
  exp2 <- Vectorize(function(x){
    result2 <- (thetaA_1 * x)/((thetaV_1 * ((1 - q_1)/q_1)) + x)
    return(result2)
    
  })
}, 

  "Extention Michaelis-Menten 1" = {
  
  thetaA_2 <- input$tA_2
  thetaV_2 <- input$tV_2
  q_2 <- input$q_2
  thetaC_2 <- input$tC_2
  
  exp3 <- Vectorize(function(x){
    result3 <- thetaA_2/(1 + ((thetaV_2/x) * ((1 - q_2)/q_2))^thetaC_2)
    return(result3)
  })
},

  "Extention Michaelis-Menten 2" = {
  
  thetaA_3 <- input$tA_3
  thetaV_3 <- input$tV_3
  q_3 <- input$q_3
  thetaC_3 <- input$tC_3
  
  exp4 <- Vectorize(function(x){
    result4 <- thetaA_3/(1 + ((x/thetaV_3) * ((1 - q_3)/q_3))^thetaC_3)
    return(result4)
  })
},

  "Extention Michaelis-Menten 3" = {
  
  thetaA_4 <- input$tA_4
  thetaV_4 <- input$tV_4
  q_4 <- input$q_4
  thetaC_4 <- input$tC_4
  
  exp5 <- Vectorize(function(x){
    result5 <- (thetaA_4 * (x^thetaC_4))/(thetaV_4 * ((1 - q_4)/q_4) + x^thetaC_4)
    return(result5)  
  })
})

switch (input$serMM,

  "Michaelis-Menten" = {
    
  var <- ggplot(data.frame(x = c(0, 10)), aes(x)) +
    stat_function(fun = exp1, size = 1, colour = "blue") +
    theme_bw() +
    xlab("") + ylab("")
  
},

  "Michaelis-Menten Reparametrization" = {
  var <- ggplot(data.frame(x = c(0, 10)), aes(x)) +
    stat_function(fun = exp2, size = 1, colour = "blue") +
    theme_bw() +
    xlab("") + ylab("")
  
},

  "Extention Michaelis-Menten 1" = {
  var <- ggplot(data.frame(x = c(0, 10)), aes(x)) +
    stat_function(fun = exp3, size = 1, colour = "blue") +
    theme_bw() +
    xlab("") + ylab("")
  
}, 

  "Extention Michaelis-Menten 2" = {
  var <- ggplot(data.frame(x = c(0, 10)), aes(x)) +
    stat_function(fun = exp4, size = 1, colour = "blue") +
    theme_bw() +
    xlab("") + ylab("")
  
}, 

  "Extention Michaelis-Menten 3" ={
  var <- ggplot(data.frame(x = c(0, 10)), aes(x)) +
    stat_function(fun = exp5, size = 1, colour = "blue") +
    theme_bw() +
    xlab("") + ylab("")
})


var
