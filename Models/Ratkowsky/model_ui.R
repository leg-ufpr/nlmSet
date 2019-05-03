tagList(
    # Usar o que estiver definido como nome no `config.dcf`.
    tags$h1("Ratkowsky"),
    tabsetPanel(
        tabPanel(
            title = tab_names$plot,
            sidebarLayout(
                sidebarPanel(
                    width = 4,
                    selectInput(
                        # paramet_<modelo>.
                        inputId = "paramet_Ratk",
                        label = tab_names$paramet,
                        choices = c("Ratkowsky",
                                    "Ratkowsky Reparametrized")),
                    #-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_Ratk == 'Ratkowsky'",
                        tags$p("$$f(x) = \\theta_{0} - q (\\frac{1 - \\theta_{c}^{x}}{1 - \\theta_{c}^{\\vartheta_{q}}})$$"),
                        sliderInput(
                            inputId = "RA_t0",
                            HTML("$$\\theta_{0}$$"),
                            min = -5,
                            max = 5,
                            value = 4,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "RA_tC",
                            HTML("$$\\theta_{c}$$"),
                            min = 0,
                            max = 100,
                            value = 30,
                            animate = animationOptions(interval = 800, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "RA_vT",
                            HTML("$$\\vartheta_{q}$$"),
                            min = 0,
                            max = 10,
                            value = 5,
                            animate = animationOptions(interval = 800, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "RA_Q",
                            HTML("$$q$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            animate = animationOptions(interval = 800, loop = TRUE)
                        )
                        
                    ), # conditionalPanel()
                    #-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_Ratk == 'Ratkowsky Reparametrized'",
                        tags$p("$$f(x) = \\theta_{a}(1 - \\exp\\{\\frac{x \\log(1 - q)}{\\theta_0}\\})$$"),
                        sliderInput(
                            inputId = "RAR_tA",
                            HTML("$$\\theta_{a}$$"),
                            min = 0,
                            max = 10,
                            value = 9,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "RAR_t0",
                            HTML("$$\\theta_{0}$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "RAR_Q",
                            HTML("$$q$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        )
                    ) # conditionalPanel()
                ), # sidebarPanel()
                #-----------------------------------------------------------
                mainPanel(
                    plotOutput(outputId = "RATK"),
                    width = 5
                )
            ) # sidebarLayout()
        ), # tabPanel()
        tabPanel(title = tab_names$doc,
                 if (file.exists("Models/Ratkowsky/description.html")) {
                     includeHTML("Models/Ratkowsky/description.html")
                 } else {
                     includeMarkdown("Models/Ratkowsky/description.md")
                 }),
        tabPanel(title = tab_names$code,
                 includeMarkdown("Models/Ratkowsky/code.md"))
    ) # tabsetPanel()
) # tagList()