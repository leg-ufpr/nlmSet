tagList(
    # Usar o que estiver definido como nome no `config.dcf`.
    tags$h1("Linear plateau"),
    tabsetPanel(
        tabPanel(
            title = tab_names$plot,
            sidebarLayout(
                sidebarPanel(
                    width = 4,
                    selectInput(
                        # paramet_<modelo>.
                        inputId = "paramet_LinPla",
                        label = tab_names$paramet,
                        choices = c("Linear plateau (defined on origin)",
                                    "Linear plateau defined on break point",
                                    "Plateau linear")),
                    #-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_LinPla == 'Linear plateau (defined on origin)'",
                        tags$p("$$f(x) = \\theta_{0} + \\theta_{1} x\\cdot I(x \\leq \\theta_{b}) + \\theta_{1} \\theta_{b}\\cdot I(x > \\theta_{b})$$"),
                        sliderInput(
                            inputId = "LP_inter",
                            HTML("$$\\theta_0$$"),
                            min = 0,
                            max = 10,
                            value = 1,
                            step = 0.1,
                            animate = animationOptions(interval = 100, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "LP_rate",
                            HTML("$$\\theta_1$$"),
                            min = -1,
                            max = 1,
                            value = 0.5,
                            step = 0.01,
                            animate = animationOptions(interval = 100, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "LP_break",
                            HTML("$$\\theta_b$$"),
                            min = 2,
                            max = 10,
                            value = 4,
                            step = 0.1,
                            animate = animationOptions(interval = 100, loop = TRUE)
                        ),
                        check()
                    ), # conditionalPanel()
                    #-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_LinPla == 'Linear plateau defined on break point'",
                        tags$p("$$f(x) = \\theta_{p} + \\theta_{1} (x - \\theta_{b})\\cdot I(x \\leq \\theta_{b})$$"),
                        sliderInput(
                            inputId = "LP2_plateau",
                            HTML("$$\\theta_p$$"),
                            min = 0,
                            max = 10,
                            value = 1,
                            step = 0.1,
                            animate = animationOptions(interval = 100, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "LP2_rate",
                            HTML("$$\\theta_1$$"),
                            min = -1,
                            max = 1,
                            value = 0.5,
                            step = 0.01,
                            animate = animationOptions(interval = 100, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "LP2_break",
                            HTML("$$\\theta_b$$"),
                            min = 2,
                            max = 10,
                            value = 4,
                            step = 0.1,
                            animate = animationOptions(interval = 100, loop = TRUE)
                        ),
                        check()
                    ), # conditionalPanel()
                    conditionalPanel(
                        condition = "input.paramet_LinPla == 'Plateau linear'",
                        tags$p("$$f(x) = \\theta_{p} + \\theta_{1} (\\theta_{b} - x)\\cdot I(x > \\theta_{b})$$"),
                        sliderInput(
                            inputId = "LP3_plateau",
                            HTML("$$\\theta_p$$"),
                            min = 0,
                            max = 10,
                            value = 1,
                            step = 0.1,
                            animate = animationOptions(interval = 100, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "LP3_rate",
                            HTML("$$\\theta_1$$"),
                            min = -1,
                            max = 1,
                            value = 0.5,
                            step = 0.01,
                            animate = animationOptions(interval = 100, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "LP3_break",
                            HTML("$$\\theta_b$$"),
                            min = 2,
                            max = 10,
                            value = 4,
                            step = 0.1,
                            animate = animationOptions(interval = 100, loop = TRUE)
                        ),
                        check()
                    )
                ), # sidebarPanel()
                #-----------------------------------------------------------
                mainPanel(
                    plotOutput(outputId = "LP"),
                    width = 5
                )
            ) # sidebarLayout()
        ), # tabPanel()
        tabPanel(title = tab_names$doc,
                 if (file.exists("Models/LinPla/description.html")) {
                     includeHTML("Models/LinPla/description.html")
                 } else {
                     includeMarkdown("Models/LinPla/description.md")
                 }),
        tabPanel(title = tab_names$code,
                 includeMarkdown("Models/LinPla/code.md"))
    ) # tabsetPanel()
) # tagList()
