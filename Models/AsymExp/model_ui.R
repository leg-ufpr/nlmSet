tabBox(
    # Usar o que estiver definido como nome no `config.dcf`.
    title = "Asymptotic Exponential",
    # Usar o mesmo nome do diretório.
    id = "AsymExp",
    width = 9,
    height = 600,
    tabPanel(
        title = "Plot",
        sidebarLayout(
            sidebarPanel(
                width = 4,
                selectInput(
                    # paramet_<modelo>.
                    inputId = "paramet_AsymExp",
                    label = "Parametrization",
                    choices = c("Asymptotic Exponential",
                                "Asymptotic Exponential Reparametrized"),
                    selected = 1),
                #-------------------------------------------------------
                conditionalPanel(
                    condition = "input.paramet_AsymExp == 'Asymptotic Exponential'",
                    sliderInput(
                        inputId = "tA",
                        HTML("$$\\theta_a$$"),
                        min = -10,
                        max = 10,
                        value = 5,
                        animate = animationOptions(interval = 1000, loop = TRUE)
                    ),
                    sliderInput(
                        inputId = "t0",
                        HTML("$$\\theta_0$$"),
                        min = 0,
                        max = 1,
                        value = 0.5,
                        animate = animationOptions(interval = 800, loop = TRUE)
                    )
                ), # conditionalPanel()
                #-------------------------------------------------------
                conditionalPanel(
                    condition = "input.paramet_AsymExp == 'Asymptotic Exponential Reparametrized'",
                    sliderInput(
                        inputId = "tA_1",
                        HTML("$$\\theta_{a}$$"),
                        min = -10,
                        max = 10,
                        value = 5,
                        animate = animationOptions(interval = 1000, loop = TRUE)
                    ),
                    sliderInput(
                        inputId = "t0_1",
                        HTML("$$\\theta_{0}$$"),
                        min = 0,
                        max = 1,
                        value = 0.5,
                        animate = animationOptions(interval = 1000, loop = TRUE)
                    ),
                    sliderInput(
                        inputId = "q_1",
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
                plotOutput(outputId = "EA"),
                width = 5
            )
        ) # sidebarLayout()
    ), # tabPanel()

    tabPanel(title = "Documentation",
             withMathJax(includeMarkdown("Models/AsymExp/description.md"))),

    tabPanel(title = "R Code",
             withMathJax(includeMarkdown("Models/AsymExp/code.md")))

) # tabBox()
