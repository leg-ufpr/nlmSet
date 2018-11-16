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

# Arguments passed to curve() in each <model>/model_server.R file.
curve_args <- list(col = "#00a65a",
                   lwd = 2,
                   xlab = expression(x),
                   ylab = expression(f(x)))

height <- 500
width <- 500

shinyServer(function(input, output) {

    output$EA <- renderPlot({
        path_to_dir <- "Models/AsymExp"
        source(paste0(path_to_dir, "/model_server.R"),
               local = TRUE)$value
    }) #EA

    output$mm <- renderPlot({
        path_to_dir <- "Models/MicMen"
        source(paste0(path_to_dir, "/model_server.R"),
               local = TRUE)$value
    }) #MM

})

#-----------------------------------------------------------------------
