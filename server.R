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

    output$mm <- renderPlot({
        path_to_dir <- "Models/MicMen"
        source(paste0(path_to_dir, "/model_server.R"),
               local = TRUE)$value
    }) #MM

})

#-----------------------------------------------------------------------
