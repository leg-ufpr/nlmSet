switch (input$paramet_MM,
        "Michaelis-Menten" = {
            curve(expr = (input$tA_0 * x)/(input$tV_0 + x),
                  xlim = c(0, 10),
                  ylim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
        },
        "Michaelis-Menten Reparametrization" = {
            curve(expr = (input$tA_1 * x)/((input$tV_1 * ((1 - input$q_1)/input$q_1)) + x),
                  xlim = c(0, 10),
                  ylim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
        },
        "Extention Michaelis-Menten 1" = {
            curve(expr = input$tA_2/(1 + ((input$tV_2/x) * ((1 - input$q_2)/input$q_2))^input$tC_2),
                  xlim = c(0, 10),
                  ylim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
        },
        "Extention Michaelis-Menten 2" = {
            curve(expr = input$tA_3/(1 + ((x/input$tV_3) * ((1 - input$q_3)/input$q_3))^input$tC_3),
                  xlim = c(0, 10),
                  ylim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)

        },
        "Extention Michaelis-Menten 3" = {
            curve(expr = (input$tA_4 * (x^input$tC_4))/(input$tV_4 * ((1 - input$q_4)/input$q_4) + x^input$tC_4),
                  xlim = c(0, 10),
                  ylim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
        })
