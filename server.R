#--------------------------------------------------------------------------------------

# OBS: RODAR NO NAVEGADOR PARA RENDERIZAR O CSS.


# Nonlinear Regression Models Catalogue -----------------------------------

## Carregando pacotes:

library(shiny)  
library(shinydashboard)
library(ggplot2)

## Comeco do codigo:


shinyServer(function(input, output){
  
  
  # Exponencial Assintotica -------------------------------------------------
  
  #  mForm6 <- as.formula("Y ~ thetaA * (1 - exp(-theta0 *x))")
  #  mExpr6 <- mForm6[[3]]
  
  #  mForm7 <- as.formula("Y ~ thetaA * (1 - exp((x * log(1 - q))
  #                     /theta0))")
  
  #  mExpr7 <- mForm7[[3]]
  
  
  
  
  output$EA <- renderPlot({
    
      source("Models/AsymExp/serasymexp.R", local = TRUE)$value    
    
  },  height = 400) #EA
  
  

# Michaelis-Menten --------------------------------------------------------
  
  
    output$mm <- renderPlot({ 
  
      source("Models/MicMen/sermicmen.R", local = TRUE)$value
      
      
    },  height = 400) #MM
    
    
  
}

)