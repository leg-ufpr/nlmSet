tagList(
    tags$h1("Michaelis-Menten"),
    tabsetPanel(
        tabPanel(
            title = tab_names$plot,
            sidebarLayout(
                sidebarPanel(
                    width = 4,
                    selectInput(
                        inputId = "paramet_MM",
                        label = tab_names$paramet,
                        choices = c("Michaelis-Menten",
                                    "Michaelis-Menten Reparametrization",
                                    "Extention Michaelis-Menten 1")),
                    # Michaelis-Menten -------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_MM == 'Michaelis-Menten'",
                        tags$p("$$f(x) = \\frac{\\theta_{a} x}{\\theta_{v} + x}$$"),
                        sliderInput(
                            inputId = "MM_tA",
                            min = 0,
                            max = 10,
                            value = 7,
                            step = 0.5,
                            HTML("$$\\theta_{a}$$"),
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "MM_tV",
                            min = 0,
                            max = 1,
                            value = 0.5,
                            step = 0.05,
                            HTML("$$\\theta_{v}$$"),
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        )),
                    # Michaelis-Menten Reparametrization ---------------
                    conditionalPanel(
                        condition = "input.paramet_MM == 'Michaelis-Menten Reparametrization'",
                        tags$p("$$f(x) = \\frac{\\theta_{a}x}{\\theta_{v}(\\frac{1-q}{q})+x}$$"),
                        sliderInput(
                            inputId = "MMR_tA",
                            HTML("$$ \\theta_{a} $$"),
                            min = 0,
                            max = 10,
                            value = 7,
                            animate = animationOptions(interval = 1000, loop = TRUE)),
                        sliderInput(
                            inputId = "MMR_tV",
                            HTML("$$\\theta_{v}$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            step = 0.05,
                            animate = animationOptions(interval = 1000, loop = TRUE)),
                        sliderInput(
                            inputId = "MMR_Q",
                            HTML("$$q$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            step = 0.05,
                            animate = animationOptions(interval = 1000, loop = TRUE))
                    ),
                    # Extention Michaelis-Menten 1 ---------------------
                    conditionalPanel(
                        condition = "input.paramet_MM == 'Extention Michaelis-Menten 1'",
                        tags$p("$$f(x) = \\frac{\\theta_{a} x^{\\theta_{c}}}{\\theta_{v} (\\frac{1-q}{q}) + x^{\\theta_c}} $$"),
                        sliderInput(
                            inputId = "EMM_tA",
                            HTML("$$\\theta_{a}$$"),
                            min = 0,
                            max = 10,
                            value = 7,
                            step = 0.05,
                            animate = animationOptions(interval = 1000, loop = TRUE)),
                        sliderInput(
                            inputId = "EMM_tV",
                            HTML("$$\\theta_{v}$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            step = 0.05,
                            animate = animationOptions(interval = 1000, loop = TRUE)),
                        sliderInput(
                            inputId = "EMM_Q",
                            HTML("$$q$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            step = 0.05,
                            animate = animationOptions(interval = 1000, loop = TRUE)),
                        sliderInput(
                            inputId = "EMM_tC",
                            HTML("$$\\theta_{c}$$"),
                            min = 0,
                            max = 10,
                            value = 1,
                            step = 0.05,
                            animate = animationOptions(interval = 1000, loop = TRUE))
                    )
                ),
                #-------------------------------------------------------
                mainPanel(
                    plotOutput(outputId = "MM"),
                    width = 5
                ) # mainPanel()
            ) # sidebarLayout()
        ), # tabPanel()
        tabPanel(title = tab_names$doc,
                 if (file.exists("Models/MicMen/description.html")) {
                     includeHTML("Models/MicMen/description.html")
                 } else {
                     includeMarkdown("Models/MicMen/description.md")
                 }),
        tabPanel(title = tab_names$code,
                 includeMarkdown("Models/MicMen/code.md"))
    ) # tabsetPanel()
) # tagList()
