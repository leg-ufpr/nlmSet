tagList(
    # Usar o que estiver definido como nome no `config.dcf`.
    tags$h1("Quadratic Plateau"),
    tabsetPanel(
        tabPanel(
            title = tab_names$plot,
            sidebarLayout(
                sidebarPanel(
                    width = 4,
                    selectInput(
                        # paramet_<modelo>.
                        inputId = "paramet_QuadPla",
                        label = tab_names$paramet,
                        choices = c("Quadratic plateau",
                                    "Canonical quadratic plateau",
                                    "Plateau quadratic")),
                    #-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_QuadPla == 'Quadratic plateau'",
                        tags$p("$$f(x) = \\theta_0 + \\theta_1 x + \\theta_2 x^2 \\text{ se } x \\leq b = -\\frac{\\theta_1}{2\\theta_2}$$"),
                        tags$p("$$f(x) = \\theta_0 + \\theta_1 b + \\theta_2 b^2 \\text{ se } x > b$$"),
                        sliderInput(
                            inputId = "QuadPla_th0",
                            HTML("$$\\theta_0$$"),
                            min = 0,
                            max = 10,
                            value = 3,
                            step = 0.1,
                            animate = animationOptions(interval = 100, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "QuadPla_th1",
                            HTML("$$\\theta_1$$"),
                            min = -10,
                            max = 10,
                            value = 3,
                            step = 0.1,
                            animate = animationOptions(interval = 100, loop = TRUE)
                        ),
                        sliderInput(
                          inputId = "QuadPla_th2",
                          HTML("$$\\theta_2$$"),
                          min = -3,
                          max = 3,
                          value = -2,
                          step = 0.1,
                          animate = animationOptions(interval = 100, loop = TRUE)
                        )
                    ), # conditionalPanel()
                    #-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_QuadPla == 'Canonical quadratic plateau'",
                        tags$p("$$f(x) = \\theta_p + \\theta_2 (x - \\theta_b)^2 \\text{ se } x \\leq \\theta_b$$"),
                        tags$p("$$f(x) = \\theta_p \\text{ se } x > \\theta_b$$"),
                        sliderInput(
                            inputId = "QuadPla2_thp",
                            HTML("$$\\theta_p$$"),
                            min = 0,
                            max = 10,
                            value = 8,
                            step = 0.1,
                            animate = animationOptions(interval = 100, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "QuadPla2_thb",
                            HTML("$$\\theta_b$$"),
                            min = 0,
                            max = 10,
                            value = 3,
                            step = 0.1,
                            animate = animationOptions(interval = 100, loop = TRUE)
                        ),
                        sliderInput(
                          inputId = "QuadPla2_th2",
                          HTML("$$\\theta_2$$"),
                          min = -3,
                          max = 3,
                          value = -2,
                          step = 0.1,
                          animate = animationOptions(interval = 100, loop = TRUE)
                        )
                    ), # conditionalPanel()
                    conditionalPanel(
                        condition = "input.paramet_QuadPla == 'Plateau quadratic'",
                        tags$p("$$f(x) = \\theta_p \\text{ se } x \\leq \\theta_b$$"),
                        tags$p("$$f(x) = \\theta_p + \\theta_2 (\\theta_b - x)^2 \\text{ se } x > \\theta_b$$"),
                        sliderInput(
                            inputId = "QuadPla3_thp",
                            HTML("$$\\theta_p$$"),
                            min = 0,
                            max = 10,
                            value = 8,
                            step = 0.1,
                            animate = animationOptions(interval = 100, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "QuadPla3_thb",
                            HTML("$$\\theta_b$$"),
                            min = 0,
                            max = 10,
                            value = 3,
                            step = 0.1,
                            animate = animationOptions(interval = 100, loop = TRUE)
                        ),
                        sliderInput(
                          inputId = "QuadPla3_th2",
                          HTML("$$\\theta_2$$"),
                          min = -3,
                          max = 3,
                          value = -2,
                          step = 0.1,
                          animate = animationOptions(interval = 100, loop = TRUE)
                        )
                    ) # conditionalPanel
                ), # sidebarPanel()
                #-----------------------------------------------------------
                mainPanel(
                    plotOutput(outputId = "QP"),
                    width = 5
                )
            ) # sidebarLayout()
        ), # tabPanel()
        tabPanel(title = tab_names$doc,
                 if (file.exists("Models/QuadPla/description.html")) {
                     includeHTML("Models/QuadPla/description.html")
                 } else {
                     includeMarkdown("Models/QuadPla/description.md")
                 }),
        tabPanel(title = tab_names$code,
                 includeMarkdown("Models/QuadPla/code.md"))
    ) # tabsetPanel()
) # tagList()
