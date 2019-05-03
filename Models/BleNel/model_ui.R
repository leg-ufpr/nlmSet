tagList(
    # Usar o que estiver definido como nome no `config.dcf`.
    tags$h1("Bleasdale-Nelder"),
    tabsetPanel(
        tabPanel(
            title = tab_names$plot,
            sidebarLayout(
                sidebarPanel(
                    width = 4,
                    selectInput(
                        # paramet_<modelo>.
                        inputId = "paramet_BleNel",
                        label = tab_names$paramet,
                        choices = c("Bleasdale-Nelder",
                                    "Bleasdale-Nelder Reparametrized")),
                    #-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_BleNel == 'Bleasdale-Nelder'",
                        tags$p("$$f(x) = x (\\theta_{0} + \\theta_{1}x)^{\\frac{-1}{\\theta_{2}}}$$"),
                        sliderInput(
                            inputId = "BN_t0",
                            HTML("$$\\theta_0$$"),
                            min = -10,
                            max = 10,
                            value = 8,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "BN_t1",
                            HTML("$$\\theta_1$$"),
                            min = -10,
                            max = 10,
                            value = 5,
                            animate = animationOptions(interval = 800, loop = TRUE)
                        ),
                        sliderInput(
                          inputId = "BN_t2",
                          HTML("$$\\theta_2$$"),
                          min = -10,
                          max = 10,
                          value = 5,
                          animate = animationOptions(interval = 800, loop = TRUE)
                        )
                    ), # conditionalPanel()
                    #-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_BleNel == 'Bleasdale-Nelder Reparametrized'",
                        tags$p("$$f(x) = \\vartheta_{y} \\frac{x}{\\vartheta_{x}} (1 - \\theta_{2}(1 - \\frac{x}{\\vartheta_{x}}))^{\\frac{-1}{\\theta_{2}}}$$"),
                        sliderInput(
                            inputId = "BNR_t2",
                            HTML("$$\\theta_{2}$$"),
                            min = -1,
                            max = 1,
                            value = 0.5,
                            step = 0.1,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "BNR_vX",
                            HTML("$$\\vartheta_{x}$$"),
                            min = 0,
                            max = 20,
                            value = 5,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "BNR_vY",
                            HTML("$$\\vartheta_{y}$$"),
                            min = 0,
                            max = 20,
                            value = 5,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        )
                    ) # conditionalPanel()
                ), # sidebarPanel()
                #-----------------------------------------------------------
                mainPanel(
                    plotOutput(outputId = "BLEA"),
                    width = 5
                )
            ) # sidebarLayout()
        ), # tabPanel()
        tabPanel(title = tab_names$doc,
                 if (file.exists("Models/BleNel/description.html")) {
                     includeHTML("Models/BleNel/description.html")
                 } else {
                     includeMarkdown("Models/BleNel/description.md")
                 }),
        tabPanel(title = tab_names$code,
                 includeMarkdown("Models/BleNel/code.md"))
    ) # tabsetPanel()
) # tagList()