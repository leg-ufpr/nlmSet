tagList(
    tags$h1("Gompertz"),
    tabsetPanel(
        tabPanel(
            title = tab_names$plot,
            sidebarLayout(
                sidebarPanel(
                    width = 4,
                    selectInput(
                        inputId = "paramet_Gomp",
                        label = tab_names$paramet,
                        choices = c("Gompertz",
                                    "Gompertz Reparametrization")),
                    # Gompertz --------------------------------------------------------
                    
                    conditionalPanel(
                        condition = "input.paramet_Gomp == 'Gompertz'",
                        tags$p("$$f(x) = \\theta_{a}(\\exp\\{-\\exp\\{\\theta_{0} - \\theta_{1}x \\}\\}$$"),
                        sliderInput(
                            inputId = "GO_tA",
                            min = 0,
                            max = 10,
                            value = 7,
                            step = 0.5,
                            HTML("$$\\theta_{a}$$"),
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "GO_t0",
                            min = 0,
                            max = 10,
                            value = 5,
                            step = 1,
                            HTML("$$\\theta_{0}$$"),
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "GO_t1",
                            min = 0,
                            max = 10,
                            value = 5,
                            step = 1,
                            HTML("$$\\theta_{1}$$"),
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        check1()
                        ),
                  # Gompertz Reparametrization ---------------
                    conditionalPanel(
                        condition = "input.paramet_Gomp == 'Gompertz Reparametrization'",
                        tags$p("$$f(x) = \\theta_{a} \\exp\\{\\log\\{q\\} \\exp\\{\\theta_{0}(1 - \\frac{x}{\\vartheta_{x}}\\}\\}$$"),
                        sliderInput(
                            inputId = "GOR_tA",
                            HTML("$$ \\theta_{a} $$"),
                            min = -10,
                            max = 10,
                            value = 7,
                            animate = animationOptions(interval = 1000, loop = TRUE)),
                        sliderInput(
                            inputId = "GOR_t0",
                            min = -10,
                            max = 10,
                            value = 5,
                            step = 1,
                            HTML("$$\\theta_{0}$$"),
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "GOR_vX",
                            HTML("$$\\vartheta_{x}$$"),
                            min = 1,
                            max = 20,
                            value = 5,
                            step = 1,
                            animate = animationOptions(interval = 1000, loop = TRUE)),
                        sliderInput(
                            inputId = "GOR_Q",
                            HTML("$$q$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            step = 0.05,
                            animate = animationOptions(interval = 1000, loop = TRUE))
                    )
                ),
                #-------------------------------------------------------
                mainPanel(
                    plotOutput(outputId = "GOMP"),
                    width = 5
                ) # mainPanel()
            ) # sidebarLayout()
        ), # tabPanel()
        tabPanel(title = tab_names$doc,
                 if (file.exists("Models/Gompertz/description.html")) {
                     includeHTML("Models/Gompertz/description.html")
                 } else {
                     includeMarkdown("Models/Gompertz/description.md")
                 }),
        tabPanel(title = tab_names$code,
                 includeMarkdown("Models/Gompertz/code.md"))
    ) # tabsetPanel()
) # tagList()

