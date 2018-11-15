#---------------------------------------------------------------------------------------

# OBS: RODAR NO NAVEGADOR PARA RENDERIZAR O CSS.



# Nonlinear Regression Models Catalogue -----------------------------------


## Carregando pacotes

library(shiny)
library(shinydashboard)
library(ggplot2)
library(markdown)

## Começo do codigo:

shinyUI(dashboardPage(
  
  # Title  
  
  title = "nlmSet",
  
  # Skin
  
  skin = "green",
  
  # Header
  
  
  dashboardHeader(title = "nlmSet",
                  titleWidth = 229.41,
                  tags$li(class= "dropdown",
                          tags$a(href= "https://github.com/willianramos12/nlmSet", 
                                 icon("github"), 
                                 "Source Code",
                                 target="_blank"))
  ),
  
  # Sidebar
  
  dashboardSidebar(
    
    # CSS e HTML
    
    tags$style(includeCSS("style.css")),
    
    # Abas 
    
    sidebarMenu(
      
      id = "tabs",
      
      # Primeira Aba       
      
      menuItem("Introduction",
               tabName = "int"),
      
      menuItem("Models",
               tabName = "mod",
               
               
# Modelos - Abas ----------------------------------------------------------
               
               
               
# Exponencial Assintótico -------------------------------------------------
               
               
               
               
               menuSubItem("Asymptotic Exponential",
                           tabName = "expA"
               ),
               
               
               # Michelis-Menten ---------------------------------------------------------
               
               
               
               
               menuSubItem("Michaelis-Menten",
                           tabName = "MM"
               )
               
               
               # Guia de Contribuicao ----------------------------------------------------
               
               
      ),#menuItem
      
      menuItem("Contribution",
               tabName = "cont"
      )
      
      
      
    ) #sidebarMenu
  ), #dashboardSidebar
  
  
  # Body --------------------------------------------------------------------
  
  
  dashboardBody(
    
    tabItems(
      
      # Tela inicial      
      
      tabItem(tabName = "int",
              includeMarkdown("README.md")
      ),
      
      
      
# Modelos      
      
      
      
# Exponencial Assintótica -------------------------------------------------
      
      
      tabItem(tabName = "expA",
              
              fluidPage(
                
                fluidRow(
                  
                  source("Models/AsymExp/uiasymexp.R", local = TRUE)$value
                  
                  
                ) # fluidRow
              )#fluidPage
      ),#tabItem
      
      
      # Michaelis-Menten --------------------------------------------------------
      
      
      tabItem(tabName = "MM",
              
              fluidPage(
                
                fluidRow(
                  
                  source("Models/MicMen/uimicmen.R", local = TRUE)$value
                  
                ) # fluidRow
              )#fluidPage
      ),#tabItem
      
      
      
      # Guia de Contribuicao ----------------------------------------------------
      
      
      tabItem(tabName = "cont",
              includeMarkdown("contribuition.md")
      )
      
      
      #-----------------------------------------------------------------------------------
      
    )#tabItems  
  )#dashboardBody
)#dashboardPage
)#ShinyUI
