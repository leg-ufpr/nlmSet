tagList(
    # Usar o que estiver definido como nome no `config.dcf`.
    tags$h1("Logistic"),
    tabsetPanel(
        tabPanel(
            title = tab_names$plot,
            sidebarLayout(
                sidebarPanel(
                    width = 4,
                    selectInput(
                        # paramet_<modelo>.
                        inputId = "paramet_Logi",
                        label = tab_names$paramet,
                        choices = c("Logistic",
                                    "Logistic Reparametrized")),
                    #-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_Logi == 'Logistic'",
                        tags$p("$$f(x) = \\frac{\\theta_{a} }{1 + \\exp\\{\\theta_{0} + \\theta_{1}x\\} }$$"),
                        sliderInput(
                            inputId = "LO_tA",
                            HTML("$$\\theta_a$$"),
                            min = -10,
                            max = 10,
                            value = 8,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "LO_t0",
                            HTML("$$\\theta_0$$"),
                            min = -10,
                            max = 10,
                            value = 5,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                          inputId = "LO_t1",
                          HTML("$$\\theta_1$$"),
                          min = -10,
                          max = 10,
                          value = 5,
                          animate = animationOptions(interval = 1000, loop = TRUE)
                        )
                        
                    ), # conditionalPanel()
                    #-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_Logi == 'Logistic Reparametrized'",
                        tags$p("$$f(x) = \\frac{\\theta_{a} }{1 + (\\frac{1 - q}{q}) \\exp\\{-4 \\vartheta_{t} (x - \\vartheta_{q}x)\\} }$$"),
                        sliderInput(
                            inputId = "LOR_tA",
                            HTML("$$\\theta_{a}$$"),
                            min = -10,
                            max = 10,
                            value = 9,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "LOR_Q",
                            HTML("$$q$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "LOR_vT",
                            HTML("$$\\vartheta_{t}$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                          inputId = "LOR_vQ",
                          HTML("$$\\vartheta_{q}$$"),
                          min = 1,
                          max = 20,
                          value = 5,
                          animate = animationOptions(interval = 1000, loop = TRUE)
                        )
                    ) # conditionalPanel()
                ), # sidebarPanel()
                #-----------------------------------------------------------
                mainPanel(
                    plotOutput(outputId = "LOGI"),
                    width = 5
                )
            ) # sidebarLayout()
        ), # tabPanel()
        tabPanel(title = tab_names$doc,
                 if (file.exists("Models/Logistic/description.html")) {
                     includeHTML("Models/Logistic/description.html")
                 } else {
                     includeMarkdown("Models/Logistic/description.md")
                 }),
        tabPanel(title = tab_names$code,
                 includeMarkdown("Models/Logistic/code.md"))
    ) # tabsetPanel()
) # tagList()