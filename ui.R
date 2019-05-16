#-----------------------------------------------------------------------
# OBS: run application on the brower to proper render CSS definitions.

#-----------------------------------------------------------------------
# Nonlinear Regression Models Catalogue --------------------------------

#-----------------------------------------------------------------------
# Loads packages.

library(shiny)
library(shinydashboard)

#-----------------------------------------------------------------------
# Get the properties of nonlinear models to use in filter widget.

fls <- paste0(list.dirs("Models", recursive = FALSE), "/config.dcf")
prop <- sapply(fls, read.dcf, fields = "properties")
prop <- sapply(strsplit(prop, ","), trimws)
all_prop <- c(na.exclude(do.call(c, prop)))
names(all_prop) <- NULL
all_prop

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

include_model_body <- function(model_dir) {
    # @param model_dir character[1] Is the path to the directory with
    #     files to build the model components on the interface.
    #
    # @return An object from the \code{tabItem()} function.
    #
    # @details The \code{DCF} should have two fiels: \code{name} and
    #     \code{shortname}.
    conf <- read.dcf(paste0("Models/", model_dir, "/config.dcf"))
    tabItem(tabName = conf[1, "shortname"],
            source(file = paste0("Models/", model_dir, "/model_ui.R"),
                   local = TRUE)$value)
}

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
            # menuItem(text = "TESTS",
            #          tabName = "TESTS",
            #          icon = icon("fas fa-users")),
            menuItem(text = "Introduction",
                     tabName = "introduction",
                     icon = icon("fas fa-users")),
            menuItem(text = "Contribution",
                     tabName = "contribution",
                     icon = icon("fas fa-book")),
            menuItemOutput(outputId = "list_of_models"),
            menuItem(text = "Filter",
                     tabName = "filter",
                     icon = icon("fas fa-filter"),
                     # startExpanded = TRUE,
                     selectInput(inputId = "model_filters",
                                 label = "Filter on properties:",
                                 choices = all_prop,
                                 multiple = TRUE,
                                 selectize = TRUE),
                     radioButtons(inputId = "set_operation",
                                  label = "Set operation",
                                  choices = c("Any", "All"),
                                  selected = "Any",
                                  inline = TRUE))
        ) # sidebarMenu()
    )

# Main area.
db_body <-
    dashboardBody(
        tabItems(
            # tabItem(tabName = "TESTS",
            #         verbatimTextOutput("my_tests")),
            # Introduction.
            tabItem(tabName = "introduction",
                    includeMarkdown("README.md")),
            # Models.
            include_model_body("AsymExp"),
            include_model_body("MicMen"),
            include_model_body("Mitscherlich"),
            include_model_body("HerBul"),
            include_model_body("Ratkowsky"),
            include_model_body("Gompertz"),
            include_model_body("VanGen"),
            include_model_body("IncGamma"),
            include_model_body("Logistic"),
            include_model_body("BleNel"),

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
