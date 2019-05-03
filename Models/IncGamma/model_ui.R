tagList(
    # Usar o que estiver definido como nome no `config.dcf`.
    tags$h1("Incomplete Gamma"),
    tabsetPanel(
        tabPanel(
            title = tab_names$plot,
            sidebarLayout(
                sidebarPanel(
                    width = 4,
                    selectInput(
                        # paramet_<modelo>.
                        inputId = "paramet_IncGamma",
                        label = tab_names$paramet,
                        choices = c("Incomplete Gamma",
                                    "Incomplete Gamma Reparametrized")),
                    #-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_IncGamma == 'Incomplete Gamma'",
                        tags$p("$$f(x) = \\theta_{0} x^{\\theta_{1}} \\exp\\{-\\theta_{2}x\\}$$"),
                        sliderInput(
                            inputId = "IG_t0",
                            HTML("$$\\theta_0$$"),
                            min = 0,
                            max = 10,
                            value = 8,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "IG_t1",
                            HTML("$$\\theta_1$$"),
                            min = 0,
                            max = 10,
                            value = 5,
                            animate = animationOptions(interval = 800, loop = TRUE)
                        ),
                        sliderInput(
                          inputId = "IG_t2",
                          HTML("$$\\theta_2$$"),
                          min = 0,
                          max = 10,
                          value = 5,
                          animate = animationOptions(interval = 800, loop = TRUE)
                        )
                        
                    ), # conditionalPanel()
                    #-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_IncGamma == 'Incomplete Gamma Reparametrized'",
                        tags$p("$$f(x) = \\vartheta_{y} \\frac{x^{\\theta_{1}} }{\\vartheta_{x}} \\exp\\{\\theta_{1}(1 - \\frac{x}{\\vartheta_{x}})\\}$$"),
                        sliderInput(
                            inputId = "IGR_t1",
                            HTML("$$\\theta_{1}$$"),
                            min = -5,
                            max = 10,
                            value = 9,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "IGR_vX",
                            HTML("$$\\vartheta_{x}$$"),
                            min = 0,
                            max = 15,
                            value = 5,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "IGR_vY",
                            HTML("$$\\vartheta_{y}$$"),
                            min = 0,
                            max = 15,
                            value = 5,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        )
                    ) # conditionalPanel()
                ), # sidebarPanel()
                #-----------------------------------------------------------
                mainPanel(
                    plotOutput(outputId = "INCG"),
                    width = 5
                )
            ) # sidebarLayout()
        ), # tabPanel()
        tabPanel(title = tab_names$doc,
                 if (file.exists("Models/IncGamma/description.html")) {
                     includeHTML("Models/IncGamma/description.html")
                 } else {
                     includeMarkdown("Models/IncGamma/description.md")
                 }),
        tabPanel(title = tab_names$code,
                 includeMarkdown("Models/IncGamma/code.md"))
    ) # tabsetPanel()
) # tagList()