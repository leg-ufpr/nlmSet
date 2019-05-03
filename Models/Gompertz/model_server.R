switch (input$paramet_Gomp,
        "Gompertz" = {
            curve(expr = input$GO_tA * (exp(-exp(input$GO_t0 - (input$GO_t1 * x)))),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab,
                  ylim = c(0,10),
                  xlim = c(0,10))
            if (input$check1) {
                cols <- c("Inflection point" = "orange",
                          "Asymptote" = "purple")
                abline(v = input$GO_t0/input$GO_t1, lty = 2, col = cols[1])
                abline(h = input$GO_tA, lty = 2, col = cols[2])
                legend("bottomright",
                       legend = names(cols),
                       col = cols,
                       lty = 2,
                       bty = "n")
            }
            
        },
        "Gompertz Reparametrization" = {
            curve(expr = input$GOR_tA * exp(log(input$GOR_Q) * exp((input$GOR_t0) * (1 - (x/input$GOR_vX)))),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
        })