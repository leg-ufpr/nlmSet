tagList(
    # Usar o que estiver definido como nome no `config.dcf`.
    tags$h1("Van Genutchen"),
    tabsetPanel(
        tabPanel(
            title = tab_names$plot,
            sidebarLayout(
                sidebarPanel(
                    width = 4,
                    selectInput(
                        # paramet_<modelo>.
                        inputId = "paramet_VanGen",
                        label = tab_names$paramet,
                        choices = c("Van Genutchen",
                                    "Van Genutchen Reparametrized")),
                    #-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_VanGen == 'Van Genutchen'",
                        tags$p("$$f(x) = \\theta_{r} + \\frac{\\theta_{s} - \\theta_{r}}{(1 + \\exp\\{\\theta_{a} + x\\}^{\\theta_{n}})^{\\theta_{m}}}$$"),
                        sliderInput(
                            inputId = "VG_tA",
                            HTML("$$\\theta_a$$"),
                            min = -10,
                            max = 10,
                            value = -5,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "VG_tR",
                            HTML("$$\\theta_r$$"),
                            min = -10,
                            max = 10,
                            value = 5,
                            animate = animationOptions(interval = 800, loop = TRUE)
                        ),
                        sliderInput(
                          inputId = "VG_tS",
                          HTML("$$\\theta_s$$"),
                          min = -10,
                          max = 10,
                          value = 5,
                          animate = animationOptions(interval = 800, loop = TRUE)
                        ),
                        sliderInput(
                          inputId = "VG_tN",
                          HTML("$$\\theta_n$$"),
                          min = -10,
                          max = 10,
                          value = 5,
                          animate = animationOptions(interval = 800, loop = TRUE)
                        ),
                        sliderInput(
                          inputId = "VG_tM",
                          HTML("$$\\theta_m$$"),
                          min = -10,
                          max = 10,
                          value = 5,
                          animate = animationOptions(interval = 800, loop = TRUE)
                        )
                    ), # conditionalPanel()
                    #-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_VanGen == 'Van Genutchen Reparametrized'",
                        tags$p("$$f(x) = \\theta_{r} - \\frac{\\vartheta_{s} (1 + \\theta_{m})^{\\theta_{m} + 1}}{\\theta_{n} (1 + \\frac{\\exp\\{\\theta_{n} (x - \\vartheta_{i})\\}}{\\theta_{m}})^{\\theta_{m}}}$$"),
                        sliderInput(
                            inputId = "VGR_tR",
                            HTML("$$\\theta_{r}$$"),
                            min = -10,
                            max = 10,
                            value = 5,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "VGR_tN",
                            HTML("$$\\theta_{n}$$"),
                            min = -10,
                            max = 10,
                            value = 5,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "VGR_vI",
                            HTML("$$\\vartheta_{i}$$"),
                            min = -10,
                            max = 10,
                            value = 5,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                          inputId = "VGR_vS",
                          HTML("$$\\vartheta_{s}$$"),
                          min = 0,
                          max = 1,
                          value = 0.5,
                          animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                          inputId = "VGR_tM",
                          HTML("$$\\theta_{m}$$"),
                          min = 0,
                          max = 10,
                          value = 5,
                          animate = animationOptions(interval = 1000, loop = TRUE)
                        )
                    ) # conditionalPanel()
                ), # sidebarPanel()
                #-----------------------------------------------------------
                mainPanel(
                    plotOutput(outputId = "VANG"),
                    width = 5
                )
            ) # sidebarLayout()
        ), # tabPanel()
        tabPanel(title = tab_names$doc,
                 if (file.exists("Models/VanGen/description.html")) {
                     includeHTML("Models/VanGen/description.html")
                 } else {
                     includeMarkdown("Models/VanGen/description.md")
                 }),
        tabPanel(title = tab_names$code,
                 includeMarkdown("Models/VanGen/code.md"))
    ) # tabsetPanel()
) # tagList()