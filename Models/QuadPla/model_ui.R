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
                        choices = c("Quadratic Plateau",
                                    "Quadratic Plateau Reparametrized")),
                    #-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_QuadPla == 'Quadratic Plateau'",
                        tags$p("$$f(x) = \\theta_{0} + \\theta_{1}x, se x < \\theta_{b}$$"),
                        tags$p("$$f(x) = \\theta_{0} + \\theta_{1} + \\theta_{2}(x - \\theta_{b}), se x > \\theta_{b}$$"),
                        sliderInput(
                            inputId = "_t0",
                            HTML("$$\\theta_0$$"),
                            min = -10,
                            max = 10,
                            value = 8,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "_t1",
                            HTML("$$\\theta_1$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            animate = animationOptions(interval = 800, loop = TRUE)
                        ),
                        sliderInput(
                          inputId = "_t2",
                          HTML("$$\\theta_2$$"),
                          min = 0,
                          max = 1,
                          value = 0.5,
                          animate = animationOptions(interval = 800, loop = TRUE)
                        ),
                        sliderInput(
                          inputId = "_tb",
                          HTML("$$\\theta_b$$"),
                          min = -10,
                          max = 10,
                          value = 5,
                          animate = animationOptions(interval = 800, loop = TRUE)
                        )
                    ), # conditionalPanel()
                    #-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_QuadPla == 'Quadratic Plateau Reparametrized'",
                        tags$p("$$f(x) = \\vartheta_{b} + \\theta_{1}(x - \\theta_{b}) se x < \\vartheta_{b}$$"),
                        sliderInput(
                            inputId = "AER_tA",
                            HTML("$$\\theta_{a}$$"),
                            min = 0,
                            max = 10,
                            value = 9,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "AER_t0",
                            HTML("$$\\theta_{0}$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "AER_Q",
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
                    plotOutput(outputId = "QUADP"),
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