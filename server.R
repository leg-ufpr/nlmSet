#-----------------------------------------------------------------------
# OBS: run application on the brower to proper render CSS definitions.

#-----------------------------------------------------------------------
# Nonlinear Regression Models Catalogue --------------------------------

#-----------------------------------------------------------------------
# Loads packages.

library(shiny)
library(shinydashboard)
library(ggplot2)
library(markdown)

#-----------------------------------------------------------------------

height <- 400

shinyServer(function(input, output) {

    output$EA <- renderPlot({
        path_to_dir <- "Models/AsymExp"
        source(paste0(path_to_dir, "/model_server.R"),
               local = TRUE)$value
    }, height = height) #EA

    output$mm <- renderPlot({
        path_to_dir <- "Models/MicMen"
        source(paste0(path_to_dir, "/model_server.R"),
               local = TRUE)$value
    }, height = height) #MM

})

#-----------------------------------------------------------------------
