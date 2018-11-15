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
# Components of the user interface.

# Header.
db_header <-
    dashboardHeader(
        title = "nlmSet",
        titleWidth = 229.41,
        tags$li(class = "dropdown",
                tags$a(href = "https://github.com/willianramos12/nlmSet",
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
            menuItem("Introduction", tabName = "int"),
            menuItem("Models",
                     tabName = "mod",
                     menuSubItem("Asymptotic Exponential", tabName = "expA"),
                     menuSubItem("Michaelis-Menten", tabName = "MM")
                     ), # menuItem
            menuItem("Contribution", tabName = "cont")
        ) # sidebarMenu
    )

# Main area.
db_body <-
    dashboardBody(
        tabItems(
            # Tela inicial
            tabItem(tabName = "int", includeMarkdown("README.md")),
            # Models.
            tabItem(tabName = "expA",
                    fluidPage(
                        fluidRow(
                            source("Models/AsymExp/uiasymexp.R", local = TRUE)$value
                        )
                    )
                    ),
            tabItem(tabName = "MM",
                    fluidPage(
                        fluidRow(
                            source("Models/MicMen/uimicmen.R", local = TRUE)$value
                        )
                    )
                    ),
            tabItem(tabName = "cont", includeMarkdown("contribuition.md"))
        ) # tabItems
    )

# Call each component.
shinyUI(dashboardPage(title = "nlmSet",
                      skin = "green",
                      header = db_header,
                      sidebar = db_sidebar,
                      body = db_body))
