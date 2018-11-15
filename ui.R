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
# Defines functions.

include_model_sidebar <- function(path_to_dir) {
    # @param path_to_dir character[1] Is the path to the directory with
    #     files to build the model components on the interface.
    #
    # @return An object from the \code{menuSubItem()} function.
    #
    # @details The \code{DCF} should have two fiels: \code{name} and
    #     \code{shortname}.
    conf <- read.dcf(paste0(path_to_dir, "/config.dcf"))
    menuSubItem(text = conf[1, "name"],
                tabName = conf[1, "shortname"])
}

include_model_body <- function(path_to_dir) {
    # @param path_to_dir character[1] Is the path to the directory with
    #     files to build the model components on the interface.
    #
    # @return An object from the \code{tabItem()} function.
    #
    # @details The \code{DCF} should have two fiels: \code{name} and
    #     \code{shortname}.
    conf <- read.dcf(paste0(path_to_dir, "/config.dcf"))
    tabItem(tabName = conf[1, "shortname"],
            fluidPage(
                fluidRow(
                    source(file = paste0(path_to_dir, "/model_ui.R"),
                           local = TRUE)$value
                )))
}

#-----------------------------------------------------------------------
# Components of the user interface.

# Header.
db_header <-
    dashboardHeader(
        title = "nlmSet",
        titleWidth = 229.41,
        tags$li(class = "dropdown",
                tags$a(href = "https://github.com/leg-ufpr/nlmSet",
                       icon("github"),
                       "Source Code",
                       target = "_blank")))

# Sidebar menu.
db_sidebar <-
    dashboardSidebar(
        # CSS and HTML.
        tags$style(includeCSS("style.css")),
        # Tab panels.
        sidebarMenu(
            id = "tabs",
            menuItem(text = "Introduction",
                     tabName = "introduction"),
            menuItem(text = "Models",
                     include_model_sidebar("Models/AsymExp"),
                     include_model_sidebar("Models/MicMen"),
                     tabName = "models"), # menuItem
            menuItem(text = "Contribution",
                     tabName = "contribution")
        ) # sidebarMenu
    )

# Main area.
db_body <-
    dashboardBody(
        tabItems(
            # Introduction.
            tabItem(tabName = "introduction",
                    includeMarkdown("README.md")),
            # Models.
            include_model_body("Models/AsymExp"),
            include_model_body("Models/MicMen"),
            tabItem(tabName = "contribution",
                    includeMarkdown("contribuition.md"))
        ) # tabItems
    )

# Call each component.
shinyUI(dashboardPage(title = "nlmSet",
                      skin = "green",
                      header = db_header,
                      sidebar = db_sidebar,
                      body = db_body))

#-----------------------------------------------------------------------
