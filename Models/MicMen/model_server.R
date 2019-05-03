switch (input$paramet_MM,
        "Michaelis-Menten" = {
            curve(expr = (input$MM_tA * x)/(input$MM_tV + x),
                  xlim = c(0, 10),
                  ylim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
        },
        "Michaelis-Menten Reparametrization" = {
            curve(expr = (input$MMR_tA * x)/((input$MMR_tV * ((1 - input$MMR_Q)/input$MMR_Q)) + x),
                  xlim = c(0, 10),
                  ylim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
        },
        "Extention Michaelis-Menten 1" = {
            curve(expr = (input$EMM_tA * (x^input$EMM_tC))/(input$EMM_tV * ((1 - input$EMM_Q)/input$EMM_Q) + x^input$EMM_tC),
                  xlim = c(0, 10),
                  ylim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
        })
