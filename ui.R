#-----------------------------------------------------------------------
# OBS: run application on the brower to proper render CSS definitions.

#-----------------------------------------------------------------------
# Nonlinear Regression Models Catalogue --------------------------------

#-----------------------------------------------------------------------
# Loads packages.

library(shiny)
library(shinydashboard)

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
            source(file = paste0(path_to_dir, "/model_ui.R"),
                   local = TRUE)$value)
}

#-----------------------------------------------------------------------
# Elements of the user interface.

# Names that are used in all models.
tab_names <- list(plot = "Plot",
                  doc = "Description",
                  code = "Code",
                  paramet = "Parametrization")

# Configures MathJax font type and size.
mathjax_config <- readLines("www/MathJax.html")
mathjax_config <- paste0(head(mathjax_config[-1], -1),
                         collapse = "\n")
mathjax_config <-
    tags$head(tags$script(type = "text/x-mathjax-config",
                          HTML(mathjax_config)))

logo <- img(src = 'nlmSet.png',
            title = "nlmSet",
            height = "180px",
            style = "display: block; margin: 1em auto 1em auto;")

#-----------------------------------------------------------------------
# Parts of the user interface.

check <- function() {
    checkboxInput(inputId = "check",
                  label = "Dysplay auxiliary lines?",
                  value = FALSE)
}

check1 <- function() {
    checkboxInput(inputId = "check1",
                  label = "Dysplay auxiliary lines?",
                  value = FALSE)
}

# Header.
db_header <-
    dashboardHeader(
        title = "nlmSet",
        tags$li(class = "dropdown",
                tags$a(href = "https://github.com/leg-ufpr/nlmSet",
                       icon("github"),
                       "Source Code",
                       target = "_blank")))

# Sidebar menu.
db_sidebar <-
    dashboardSidebar(
        # CSS.
        includeCSS("www/style.css"),
        # Enables MathJax to render all Latex expressions.
        withMathJax(),
        # MathJax configuration.
        mathjax_config,
        # nlmSet logo image.
        logo,
        # Tab panels.
        sidebarMenu(
            id = "tabs",
            menuItem(text = "Introduction",
                     tabName = "introduction",
                     icon = icon("fas fa-users")),
            menuItem(text = "Models",
                     include_model_sidebar("Models/AsymExp"),
                     include_model_sidebar("Models/BleNel"),
                     include_model_sidebar("Models/Gompertz"),
                     include_model_sidebar("Models/HerBul"),
                     include_model_sidebar("Models/IncGamma"),
                     include_model_sidebar("Models/Logistic"),
                     include_model_sidebar("Models/MicMen"),
                     include_model_sidebar("Models/Mitscherlich"),
                     include_model_sidebar("Models/Ratkowsky"),
                     include_model_sidebar("Models/VanGen"),
                     tabName = "models",
                     icon = icon("fas fa-chart-area")), # menuItem
            menuItem(text = "Contribution",
                     tabName = "contribution",
                     icon = icon("fas fa-book"))
        ) # sidebarMenu()
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
            include_model_body("Models/Mitscherlich"),
            include_model_body("Models/HerBul"),
            include_model_body("Models/Ratkowsky"),
            include_model_body("Models/Gompertz"),
            include_model_body("Models/VanGen"),
            include_model_body("Models/IncGamma"),
            include_model_body("Models/Logistic"),
            include_model_body("Models/BleNel"),

            tabItem(tabName = "contribution",
                    includeMarkdown("contribuition.md"))
        ) # tabItems()
    )

# Call each component.
shinyUI(dashboardPage(title = "nlmSet",
                      skin = "green",
                      header = db_header,
                      sidebar = db_sidebar,
                      body = db_body))

#-----------------------------------------------------------------------
