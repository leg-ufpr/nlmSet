tagList(
    # Usar o que estiver definido como nome no `config.dcf`.
    tags$h1("Mitscherlich"),
    tabsetPanel(
        tabPanel(
            title = tab_names$plot,
            sidebarLayout(
                sidebarPanel(
                    width = 4,
                    selectInput(
                        # paramet_<modelo>.
                        inputId = "paramet_Mits",
                        label = tab_names$paramet,
                        choices = c("Mitscherlich",
                                    "Mitscherlich Reparametrized")),
#-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_Mits == 'Mitscherlich'",
                        tags$p("$$ f(x) = \\theta_{1}(1 - \\exp\\{-\\theta_{0}(x - \\theta_{0})\\})$$"),
                        sliderInput(
                            inputId = "MI_t1",
                            HTML("$$\\theta_1$$"),
                            min = 0,
                            max = 1,
                            value = 0.8,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "MI_t0",
                            HTML("$$\\theta_0$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            animate = animationOptions(interval = 800, loop = TRUE)
                        )
                    ), # conditionalPanel()
                    #-------------------------------------------------------
                    conditionalPanel(
                        condition = "input.paramet_Mits == 'Mitscherlich Reparametrized'",
                        tags$p("$$f(x) = \\theta_{a}(1 - \\exp\\{x \\log\\{1-q \\} \\frac{x - \\theta_{0}}{\\vartheta{q} - \\theta_{0}} \\})$$"),
                        sliderInput(
                            inputId = "MIR_tA",
                            HTML("$$\\theta_{a}$$"),
                            min = 1,
                            max = 100,
                            value = 50,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "MIR_t0",
                            HTML("$$\\theta_{0}$$"),
                            min = 1,
                            max = 100,
                            value = 50,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "MIR_Q",
                            HTML("$$q$$"),
                            min = 0,
                            max = 1,
                            value = 0.5,
                            animate = animationOptions(interval = 1000, loop = TRUE)
                        ),
                        sliderInput(
                            inputId = "MIR_vt",
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
                    plotOutput(outputId = "MITS"),
                    width = 5
                )
            ) # sidebarLayout()
        ), # tabPanel()
        tabPanel(title = tab_names$doc,
                 if (file.exists("Models/Mitscherlich/description.html")) {
                     includeHTML("Models/Mitscherlich/description.html")
                 } else {
                     includeMarkdown("Models/Mitscherlich/description.md")
                 }),
        tabPanel(title = tab_names$code,
                 includeMarkdown("Models/Mitscherlich/code.md"))
    ) # tabsetPanel()
) # tagList()