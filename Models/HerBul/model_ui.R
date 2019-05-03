tagList(
    # Usar o que estiver definido como nome no `config.dcf`.
    tags$h1("Herschel-Bulkley"),
    tabsetPanel(
        tabPanel(
            title = tab_names$plot,
            sidebarLayout(
                sidebarPanel(
                    width = 4,
                    selectInput(
                        # paramet_<modelo>.
                        inputId = "paramet_HerBul",
                        label = tab_names$paramet,
                        choices = c("Herschel-Bulkley",
                                    "Herschel-Bulkley Reparametrized")),
                    #-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_HerBul == 'Herschel-Bulkley'",
                        tags$p("$$f(x) = \\theta_{0} + \\theta_{1}(x^{\\theta_{2}})$$"),
                        sliderInput(
                            inputId = "HB_t0",
                            HTML("$$\\theta_{0}$$"),
                            min = 1,
                            max = 100,
                            value = 50,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "HB_t1",
                            HTML("$$\\theta_{1}$$"),
                            min = 1,
                            max = 100,
                            value = 50,
                            animate = animationOptions(interval = 800, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "HB_t2",
                            HTML("$$\\theta_2$$"),
                            min = 0,
                            max = 5,
                            value = 3,
                            step = 0.2,
                            animate = animationOptions(interval = 800, loop = TRUE)
                        )

                    ), # conditionalPanel()
                    #-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_HerBul == 'Herschel-Bulkley Reparametrized'",
                        tags$p("$$f(x) = \\theta_{0} + \\theta_{1}x^{\\frac{\\log\\{q\\} - log\\{\\theta_{1}\\}}{\\log\\{\\vartheta_{q}\\}}}$$"),
                        sliderInput(
                            inputId = "HBR_t0",
                            HTML("$$\\theta_{0}$$"),
                            min = 0,
                            max = 100,
                            value = 50,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "HBR_t1",
                            HTML("$$\\theta_{1}$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "HBR_Q",
                            HTML("$$q$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "HBR_vT",
                            HTML("$$\\vartheta_{q}$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        )

                    ) # conditionalPanel()
                ), # sidebarPanel()
                #-----------------------------------------------------------
                mainPanel(
                    plotOutput(outputId = "HERB"),
                    width = 5
                )
            ) # sidebarLayout()
        ), # tabPanel()
        tabPanel(title = tab_names$doc,
                 if (file.exists("Models/HerBul/description.html")) {
                     includeHTML("Models/HerBul/description.html")
                 } else {
                     includeMarkdown("Models/HerBul/description.md")
                 }),
        tabPanel(title = tab_names$code,
                 includeMarkdown("Models/HerBul/code.md"))
    ) # tabsetPanel()
) # tagList()
