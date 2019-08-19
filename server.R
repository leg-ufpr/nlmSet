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

# my_container()

#-----------------------------------------------------------------------
# Some settings.

# Arguments passed to curve() in each <model>/model_server.R file.
curve_args <- list(col = "#00a65a",
                   lwd = 2,
                   xlab = expression(x),
                   ylab = expression(f(x)))

height <- 500
width <- 500

all.equal(c(""), c(1, 2))

apropos("equal")
isTRUE(all.equal.character("", c("", "")))

#-----------------------------------------------------------------------
# Defines functions.

include_model_sidebar <- function(model_dir,
                                  properties,
                                  set_operation) {
    # @param path_to_dir character[1] Is the path to the directory with
    #     files to build the model components on the interface.
    #
    # @param properties character Vector with model properties to filter
    #     the model displayed.
    #
    # @return An object from the \code{menuSubItem()} function.
    #
    # @details The \code{DCF} should have two fiels: \code{name} and
    #     \code{shortname}.
    conf <- read.dcf(paste0("Models/", model_dir, "/config.dcf"))
    if ("properties" %in% colnames(conf)) {
        prop <- conf[, "properties"]
        prop <- trimws(unlist(strsplit(prop, ",")))
        u <- switch(set_operation,
                    "Any" = any(is.element(properties, prop)),
                    "All" = all(is.element(properties, prop)))
    } else {
        u <- FALSE
    }
    if (is.null(properties) || u) {
        menuSubItem(text = conf[1, "name"],
                    tabName = conf[1, "shortname"])
    } else {
        NULL
    }
}

# include_model_sidebar("BleNel", NULL)
# include_model_sidebar("BleNel", "asymptotic")
# include_model_sidebar("AsymExp", "asymptotic")

#-----------------------------------------------------------------------

# options(warn = 2, shiny.error = recover)
shinyServer(function(input, output, session) {

    output$list_of_models <- renderUI(
        menuItem(text = "Models",
                 tabName = "models",
                 icon = icon("fas fa-chart-area"),
                 #---------------------------
                 include_model_sidebar("AsymExp"     , input$model_filters, input$set_operation),
                 include_model_sidebar("BleNel"      , input$model_filters, input$set_operation),
                 include_model_sidebar("Gompertz"    , input$model_filters, input$set_operation),
                 include_model_sidebar("HerBul"      , input$model_filters, input$set_operation),
                 include_model_sidebar("IncGamma"    , input$model_filters, input$set_operation),
                 include_model_sidebar("Logistic"    , input$model_filters, input$set_operation),
                 include_model_sidebar("MicMen"      , input$model_filters, input$set_operation),
                 include_model_sidebar("LinPla"      , input$model_filters, input$set_operation),
                 include_model_sidebar("QuadPla"      , input$model_filters, input$set_operation),
                 include_model_sidebar("Mitscherlich", input$model_filters, input$set_operation),
                 include_model_sidebar("Ratkowsky"   , input$model_filters, input$set_operation),
                 include_model_sidebar("VanGen"      , input$model_filters, input$set_operation),
                 #---------------------------
                 startExpanded = TRUE) # menuItem
    )

    # output$my_tests <- renderText({
    #     paste(input$model_filters,
    #           nchar(input$model_filters),
    #           is.null(input$model_filters))
    # })

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

    output$LP <- renderPlot({
        path_to_dir <- "Models/LinPla"
        source(paste0(path_to_dir, "/model_server.R"),
               local = TRUE)$value
    }) #LP

    output$QP <- renderPlot({
        path_to_dir <- "Models/QuadPla"
        source(paste0(path_to_dir, "/model_server.R"),
               local = TRUE)$value
    }) #QP

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
