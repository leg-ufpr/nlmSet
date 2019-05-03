tagList(
    # Usar o que estiver definido como nome no `config.dcf`.
    tags$h1("Segmented Bilinear"),
    tabsetPanel(
        tabPanel(
            title = tab_names$plot,
            sidebarLayout(
                sidebarPanel(
                    width = 4,
                    selectInput(
                        # paramet_<modelo>.
                        inputId = "paramet_SegBil",
                        label = tab_names$paramet,
                        choices = c("Segmented Bilinear",
                                    "Segmented Bilinear Reparametrized")),
                    #-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_SegBil == 'Segmented Bilinear'",
                        tags$p("$$f(x) = \\theta_{0} + \\theta_{1}x, se x \\leq \\theta_{b}$$"),
                        tags$p("$$f(x) = \\theta_{0} + \\theta_{1} + \\theta_{2}(x - \\theta_{b}), se x > \\theta_{b}$$"),
                        sliderInput(
                            inputId = "SB_t0",
                            HTML("$$\\theta_0$$"),
                            min = -10,
                            max = 10,
                            value = 8,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "SB_t1",
                            HTML("$$\\theta_1$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            animate = animationOptions(interval = 800, loop = TRUE)
                        ),
                        sliderInput(
                          inputId = "SB_t2",
                          HTML("$$\\theta_2$$"),
                          min = 0,
                          max = 1,
                          value = 0.5,
                          animate = animationOptions(interval = 800, loop = TRUE)
                        ),
                        sliderInput(
                          inputId = "SB_tb",
                          HTML("$$\\theta_b$$"),
                          min = -10,
                          max = 10,
                          value = 5,
                          animate = animationOptions(interval = 800, loop = TRUE)
                        )
                    ), # conditionalPanel()
                    #-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_SegBil == 'Segmented Bilinear Reparametrized'",
                        tags$p("$$f(x) = \\vartheta_{b} + \\theta_{1}(x - \\theta_{b}) se x \\leq \\vartheta_{b}$$"),
                        sliderInput(
                            inputId = "SBR_t1",
                            HTML("$$\\theta_{1}$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "SBR_t2",
                            HTML("$$\\theta_{2}$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "SBR_tB",
                            HTML("$$\\theta_{b}$$"),
                            min = -10,
                            max = 10,
                            value = 5,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                          inputId = "SBR_vB",
                          HTML("$$\\vartheta_{b}$$"),
                          min = -10,
                          max = 10,
                          value = 5,
                          animate = animationOptions(interval = 1000, loop = TRUE)
                        )
                        
                    ) # conditionalPanel()
                ), # sidebarPanel()
                #-----------------------------------------------------------
                mainPanel(
                    plotOutput(outputId = "BILS"),
                    width = 5
                )
            ) # sidebarLayout()
        ), # tabPanel()
        tabPanel(title = tab_names$doc,
                 if (file.exists("Models/SegBil/description.html")) {
                     includeHTML("Models/SegBil/description.html")
                 } else {
                     includeMarkdown("Models/SegBil/description.md")
                 }),
        tabPanel(title = tab_names$code,
                 includeMarkdown("Models/SegBil/code.md"))
    ) # tabsetPanel()
) # tagList()