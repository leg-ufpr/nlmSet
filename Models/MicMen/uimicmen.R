tabBox(title = "Michaelis-Menten",
       id = "m2",
       width = 250,
       
# Plot
       
      tabPanel("Plot",
              
        sidebarLayout(    
                  
          sidebarPanel(
                    
            selectInput(inputId = "serMM",
                        label = "Parametrization",
                        choices = c("Michaelis-Menten",
                                    "Michaelis-Menten Reparametrization",
                                    "Extention Michaelis-Menten 1",
                                    "Extention Michaelis-Menten 2",
                                    "Extention Michaelis-Menten 3"),
                        selected = "Michaelis-Menten"),


# Michaelis-Menten --------------------------------------------------------

            
                        
            conditionalPanel(condition = "input.serMM == 'Michaelis-Menten' ",
                              
                      
                             sliderInput(inputId = "tA_0",
                                         min = -10,
                                         max = 10,
                                         value = 1,
                                         step = 0.5,
                                         HTML("$$ \\theta_{a} $$"),
                                         animate = animationOptions(interval = 1000, loop = TRUE)
                             ),
                                  
                             sliderInput(inputId = "tV_0",
                                         min = 0,
                                         max = 1,
                                         value = 0.5,
                                         step = 0.05,
                                         HTML("$$ \\theta_{v} $$"),
                                         animate = animationOptions(interval = 1000, loop = TRUE)
                             )),


# Michaelis-Menten Reparametrization --------------------------------------


            conditionalPanel(condition = "input.serMM == 'Michaelis-Menten Reparametrization' ",
                             
                             
                             sliderInput("tA_1",
                                         HTML("$$ \\theta_{a} $$"),
                                         min = -10,
                                         max = 10,
                                         value = 2,
                                         animate = animationOptions(interval = 1000, loop = TRUE)),
                             
                             sliderInput("tV_1",
                                         HTML("$$ \\theta_{v} $$"),
                                         min = 0,
                                         max = 1,
                                         value = 0.5,
                                         step = 0.05,
                                         animate = animationOptions(interval = 1000, loop = TRUE)),
                             
                             sliderInput("q_1",
                                         HTML("$$ q $$"),
                                         min = 0,
                                         max = 1,
                                         value = 0.5,
                                         step = 0.05,
                                         animate = animationOptions(interval = 1000, loop = TRUE))
            ),



# Extention Michaelis-Menten ----------------------------------------------

            conditionalPanel(condition = "input.serMM == 'Extention Michaelis-Menten 1' ",
                             
                             sliderInput("tA_2",
                                         HTML("$$ \\theta_{a} $$"),
                                         min = -10,
                                         max = 10,
                                         value = 1,
                                         step = 0.05,
                                         animate = animationOptions(interval = 1000, loop = TRUE)),
                             
                             sliderInput("tV_2",
                                         HTML("$$ \\theta_{v} $$"), 
                                         min = 1,
                                         max = 10,
                                         value = 1,
                                         step = 0.05,
                                         animate = animationOptions(interval = 1000, loop = TRUE)),
                             
                             sliderInput("q_2",
                                         HTML("$$ q $$"),
                                         min = 0,
                                         max = 1,
                                         value = 0.5,
                                         step = 0.05,
                                         animate = animationOptions(interval = 1000, loop = TRUE)),
                             
                             sliderInput("tC_2",
                                         HTML("$$ \\theta_{c} $$"),
                                         min = -10,
                                         max = 10,
                                         value = 1,
                                         step = 0.05,
                                         animate = animationOptions(interval = 1000, loop = TRUE))
                             ),


# Extention Michaelis-Menten 2 --------------------------------------------



            conditionalPanel(condition = "input.serMM == 'Extention Michaelis-Menten 2' ",
                             
                             sliderInput("tA_3",
                                         HTML("$$ \\theta_{a} $$"),
                                         min = -10,
                                         max = 10,
                                         value = 1,
                                         step = 0.05,
                                         animate = animationOptions(interval = 1000, loop = TRUE)),
                             
                             sliderInput("tV_3",
                                         HTML("$$ \\theta_{v} $$"),
                                         min = 0,
                                         max = 1,
                                         value = 0.5,
                                         step = 0.05,
                                         animate = animationOptions(interval = 1000, loop = TRUE)),
                             
                             sliderInput("q_3",
                                         HTML("$$ q $$"),
                                         min = 0,
                                         max = 1,
                                         value = 0.5,
                                         step = 0.05,
                                         animate = animationOptions(interval = 1000, loop = TRUE)),
                             
                             sliderInput("tC_3",
                                         HTML("$$ \\theta_{c} $$"),
                                         min = -10,
                                         max = 10,
                                         value = 1,
                                         step = 0.05,
                                         animate = animationOptions(interval = 1000, loop = TRUE))
                             
                             ),


# Extention Michaelis-Menten 3 --------------------------------------------

            conditionalPanel(condition = "input.serMM == 'Extention Michaelis-Menten 3' ",
                             
                             
                             sliderInput("tA_4",
                                         HTML("$$ \\theta_{a} $$"),
                                         min = -10,
                                         max = 10,
                                         value = 1,
                                         step = 0.05,
                                         animate = animationOptions(interval = 1000, loop = TRUE)),
                             
                             sliderInput("tV_4",
                                         HTML("$$ \\theta_{v} $$"),
                                         min = 0,
                                         max = 1,
                                         value = 0.5,
                                         step = 0.05,
                                         animate = animationOptions(interval = 1000, loop = TRUE)),
                             
                             sliderInput("q_4",
                                         HTML("$$ q $$"),
                                         min = 0,
                                         max = 1,
                                         value = 0.5,
                                         step = 0.05,
                                         animate = animationOptions(interval = 1000, loop = TRUE)),
                             
                             sliderInput("tC_4",
                                         HTML("$$ \\theta_{c} $$"),
                                         min = -10,
                                         max = 10,
                                         value = 1,
                                         step = 0.05,
                                         animate = animationOptions(interval = 1000, loop = TRUE))
                             
                             )
                             
            
                                         
            ),
                        
                mainPanel(plotOutput(outputId = "mm",
                          height = 400
                )
              )
            )
          ), # tabPanel
       
# Documentation          
       
          tabPanel("Documentation",
                   withMathJax(includeMarkdown("Models/MicMen/DMichaelis_Menten.md")
                   )),
       
# R code          
       
          tabPanel("R Code",
                   withMathJax(includeMarkdown("Models/MicMen/CMichaelis.md"))
       )
       
)