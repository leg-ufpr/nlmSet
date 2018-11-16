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
                                    "Extention Michaelis-Menten 1",
                                    "Extention Michaelis-Menten 2",
                                    "Extention Michaelis-Menten 3")),
                    # Michaelis-Menten -------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_MM == 'Michaelis-Menten'",
                        sliderInput(
                            inputId = "tA_0",
                            min = -10,
                            max = 10,
                            value = 1,
                            step = 0.5,
                            HTML("$$\\theta_{a}$$"),
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "tV_0",
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
                        sliderInput(
                            inputId = "tA_1",
                            HTML("$$ \\theta_{a} $$"),
                            min = -10,
                            max = 10,
                            value = 2,
                            animate = animationOptions(interval = 1000, loop = TRUE)),
                        sliderInput(
                            inputId = "tV_1",
                            HTML("$$\\theta_{v}$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            step = 0.05,
                            animate = animationOptions(interval = 1000, loop = TRUE)),
                        sliderInput(
                            inputId = "q_1",
                            HTML("$$q$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            step = 0.05,
                            animate = animationOptions(interval = 1000, loop = TRUE))
                    ),
                    # Extention Michaelis-Menten -----------------------
                    conditionalPanel(
                        condition = "input.paramet_MM == 'Extention Michaelis-Menten 1' ",
                        sliderInput(
                            inputId = "tA_2",
                            HTML("$$\\theta_{a}$$"),
                            min = -10,
                            max = 10,
                            value = 1,
                            step = 0.05,
                            animate = animationOptions(interval = 1000, loop = TRUE)),
                        sliderInput(
                            inputId = "tV_2",
                            HTML("$$\\theta_{v}$$"),
                            min = 1,
                            max = 10,
                            value = 1,
                            step = 0.05,
                            animate = animationOptions(interval = 1000, loop = TRUE)),
                        sliderInput(
                            inputId = "q_2",
                            HTML("$$q$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            step = 0.05,
                            animate = animationOptions(interval = 1000, loop = TRUE)),
                        sliderInput(
                            inputId = "tC_2",
                            HTML("$$\\theta_{c}$$"),
                            min = -10,
                            max = 10,
                            value = 1,
                            step = 0.05,
                            animate = animationOptions(interval = 1000, loop = TRUE))
                    ),
                    # Extention Michaelis-Menten 2 ---------------------
                    conditionalPanel(
                        condition = "input.paramet_MM == 'Extention Michaelis-Menten 2'",
                        sliderInput(
                            inputId = "tA_3",
                            HTML("$$\\theta_{a}$$"),
                            min = -10,
                            max = 10,
                            value = 1,
                            step = 0.05,
                            animate = animationOptions(interval = 1000, loop = TRUE)),
                        sliderInput(
                            "tV_3",
                            HTML("$$\\theta_{v}$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            step = 0.05,
                            animate = animationOptions(interval = 1000, loop = TRUE)),
                        sliderInput(
                            inputId = "q_3",
                            HTML("$$q$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            step = 0.05,
                            animate = animationOptions(interval = 1000, loop = TRUE)),
                        sliderInput(
                            inputId = "tC_3",
                            HTML("$$\\theta_{c}$$"),
                            min = -10,
                            max = 10,
                            value = 1,
                            step = 0.05,
                            animate = animationOptions(interval = 1000, loop = TRUE))
                    ),
                    # Extention Michaelis-Menten 3 ---------------------
                    conditionalPanel(
                        condition = "input.paramet_MM == 'Extention Michaelis-Menten 3'",
                        sliderInput(
                            inputId = "tA_4",
                            HTML("$$\\theta_{a}$$"),
                            min = -10,
                            max = 10,
                            value = 1,
                            step = 0.05,
                            animate = animationOptions(interval = 1000, loop = TRUE)),
                        sliderInput(
                            inputId = "tV_4",
                            HTML("$$\\theta_{v}$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            step = 0.05,
                            animate = animationOptions(interval = 1000, loop = TRUE)),
                        sliderInput(
                            inputId = "q_4",
                            HTML("$$q$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            step = 0.05,
                            animate = animationOptions(interval = 1000, loop = TRUE)),
                        sliderInput(
                            inputId = "tC_4",
                            HTML("$$\\theta_{c}$$"),
                            min = -10,
                            max = 10,
                            value = 1,
                            step = 0.05,
                            animate = animationOptions(interval = 1000, loop = TRUE))
                    )
                ),
                #-------------------------------------------------------
                mainPanel(
                    plotOutput(outputId = "mm"),
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
