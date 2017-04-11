library(shiny)
ui <- shinyUI(fluidPage(
  
  # Application title
  titlePanel("Catalógo"),
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      checkboxInput(inputId="cat",
                   label= "Apresentar Modelos",
                   value=FALSE),
      conditionalPanel("input.cat",
                       selectInput(inputId="modelos",
                                   label="Escolha um dos modelos",
                                   choices=c(1:10),
                                   selected=""),
                       sliderInput("thA",
                                   "Theta A:",
                                   min = 1,
                                   max = 10,
                                   value = 2),
                       sliderInput("vthQ",
                                   "VarTheta Q:",
                                   min = 1,
                                   max = 20,
                                   value = 2),
                       sliderInput("q",
                                   "Q:",
                                   min = 0,
                                   max = 1,
                                   value = 0.5),
                       sliderInput("thC",
                                   "Theta C:",
                                   min = 1,
                                   max = 10,
                                   value = 2)
                       
      )),
    
      mainPanel(
      plotOutput("Curve")
    )
  )
))

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {
  
  mForm1 <- as.formula("Y ~ (thA*x)/((vthQ*((1-q)/q))+x)")
  mExpr1 <- mForm1[[3]] 
  
  mForm2 <- as.formula("Y ~ thA/(1+((vthQ/x)*((1-q)/q))^thC)")
  mExpr2 <- mForm2[[3]]
  
  observe({  
    if(input$modelos == 1){
    output$Curve <- renderPlot({
    thA <- input$thA
    vthQ <- input$vthQ
    q <- input$q
    
    eval(call("curve", mExpr1))
  })
    }
    if(input$modelos == 2){
      output$Curve <- renderPlot({
        thA <- input$thA
        vthQ <- input$vthQ
        q <- input$q
        thC <- input$thC
        
        eval(call("curve", mExpr2))
        # limites das curvas?
      })
    }
    
  })
})

# Run the application 
shinyApp(ui = ui, server = server)

