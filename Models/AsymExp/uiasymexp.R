tabBox(title = "Asymptotic Exponential",
       id = "m1",
       width = 250,
       
       # Plot          
       
       tabPanel("Plot",
                
                sidebarLayout(    
                  
                  sidebarPanel(
                    
                    selectInput(inputId = "serEA", # Padrão de escrita para escolha do modelo "ser'ABREVIAÇÃOMODELO'"
                                label = "Parametrization",
                                choices = c("Asymptotic Exponential",
                                            "Asymptotic Exponential Reparametrized"),
                                selected = "Asymptotic Exponential"
                    ),
                    
                    
                    conditionalPanel(condition = "input.serEA == 'Asymptotic Exponential'",
                                     sliderInput(inputId = "tA",
                                                 HTML("$$ \\theta_a $$"),
                                                 min = -10,
                                                 max = 10,
                                                 value = 5,
                                                 animate = animationOptions(interval = 1000, loop = TRUE)
                                     ),
                                     
                                     sliderInput(inputId = "t0",
                                                 HTML("$$ \\theta_0 $$"),
                                                 min = 0,
                                                 max = 1,
                                                 value = 0.5, 
                                                 animate = animationOptions(interval = 800, loop = TRUE)
                                     )),
                    
                    conditionalPanel(condition = "input.serEA == 'Asymptotic Exponential Reparametrized' ",
                                     sliderInput(inputId = "tA_1",
                                                 HTML("$$ \\theta_{a} $$"),
                                                 min = -10,
                                                 max = 10,
                                                 value = 5,
                                                 animate = animationOptions(interval = 1000, loop = TRUE)
                                     ),
                                     
                                     sliderInput(inputId = "t0_1",
                                                 HTML("$$ \\theta_{0} $$"),
                                                 min = 0,
                                                 max = 1,
                                                 value = 0.5,
                                                 animate = animationOptions(interval = 1000, loop = TRUE)
                                     ),
                                     
                                     sliderInput(inputId = "q_1",
                                                 HTML("q"),
                                                 min = 0,
                                                 max = 1,
                                                 value = 0.5,
                                                 animate = animationOptions(interval = 1000, loop = TRUE)
                                     ))),
                  
                  mainPanel(
                    
                    plotOutput(outputId = "EA",
                               height = 400
                    ))
                  
                )), # tabP
       
       # Documentation          
       
       tabPanel("Documentation",
                withMathJax(includeMarkdown("Models/AsymExp/DAsymptotic_Exponential.md")
                )),
       
       # R code          
       
       tabPanel("R Code",
                withMathJax(includeMarkdown("Models/AsymExp/CAsymptotic.md")
                ))
       
       
)