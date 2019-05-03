#-----------------------------------------------------------------------
# OBS: run application on the brower to proper render CSS definitions.

#-----------------------------------------------------------------------
# Nonlinear Regression Models Catalogue --------------------------------

#-----------------------------------------------------------------------
# Loads packages.

library(shiny)
library(shinydashboard)

#-----------------------------------------------------------------------
# Render */description.md do */description.html. The HTML version
# displays the references.

# Uncomment and run this code to update the `description.html` files.
# file.remove(dir(path = "Models",
#                 pattern = "description.html",
#                 full.names = TRUE,
#                 recursive = TRUE))

md_files <- dir(path = "Models",
                pattern = "description.md",
                full.names = TRUE,
                recursive = TRUE)

for (f in md_files) {
    # Creates the `description.html` files if they don't exist.
    if (!file.exists(paste0(dirname(f), "/description.html"))) {
        try(rmarkdown::render(input = f))
    }
}

#-----------------------------------------------------------------------
# Some settings.

# Arguments passed to curve() in each <model>/model_server.R file.
curve_args <- list(col = "#00a65a",
                   lwd = 2,
                   xlab = expression(x),
                   ylab = expression(f(x)))

height <- 500
width <- 500

#-----------------------------------------------------------------------

# options(warn = 2, shiny.error = recover)
shinyServer(function(input, output) {

    output$EA <- renderPlot({
        path_to_dir <- "Models/AsymExp"
        source(paste0(path_to_dir, "/model_server.R"),
               local = TRUE)$value
    }) #EA

    output$MM <- renderPlot({
        path_to_dir <- "Models/MicMen"
        source(paste0(path_to_dir, "/model_server.R"),
               local = TRUE)$value
    }) #MM
    
    output$MITS <- renderPlot({
        path_to_dir <- "Models/Mitscherlich"
        source(paste0(path_to_dir, "/model_server.R"),
               local = TRUE)$value
    }) #Mits
    
    output$HERB <- renderPlot({
        path_to_dir <- "Models/HerBul"
        source(paste0(path_to_dir, "/model_server.R"),
               local = TRUE)$value
    }) #HB
    
    output$RATK <- renderPlot({
        path_to_dir <- "Models/Ratkowsky"
        source(paste0(path_to_dir, "/model_server.R"),
               local = TRUE)$value
    }) #Ratk
    
    output$GOMP <- renderPlot({
      path_to_dir <- "Models/Gompertz"
      source(paste0(path_to_dir, "/model_server.R"),
             local = TRUE)$value
    }) #Gomp

    output$VANG <- renderPlot({
      path_to_dir <- "Models/VanGen"
      source(paste0(path_to_dir, "/model_server.R"),
             local = TRUE)$value
    }) #Vang
    
    output$INCG <- renderPlot({
      path_to_dir <- "Models/IncGamma"
      source(paste0(path_to_dir, "/model_server.R"),
             local = TRUE)$value
    }) #Incg
    
    output$LOGI <- renderPlot({
      path_to_dir <- "Models/Logistic"
      source(paste0(path_to_dir, "/model_server.R"),
             local = TRUE)$value
    }) #Logi
    
    output$BLEA <- renderPlot({
      path_to_dir <- "Models/BleNel"
      source(paste0(path_to_dir, "/model_server.R"),
             local = TRUE)$value
    }) #BleNel
    
})

#-----------------------------------------------------------------------
