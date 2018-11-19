# Asymptotic Exponential -----------------------------------------------

# NOTE: for some unknown reason, Shiny does not work with
# `do.call(curve, ...)` ou defining a function `my_curve()` that calls
# `curve()` in a customized form to set some parameters (`xlab`, `col`,
# etc). We understand that the call of `curve()` is a little verbose,
# repeating explicitly commom arguments, but, as explained, there is no
# wat to avoid this. `curve()` must be called explicitly.

# ATTENTION: the list `curve_args` is kept in the ../../server.R file.

switch (input$paramet_AsymExp,
        "Asymptotic Exponential" = {
            curve(expr = input$tA * (1 - exp(-input$t0 * x)),
                  xlim = c(0, 10),
                  ylim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
            if (input$check) {
                cols <- c("Asymptote" = "orange",
                          "Initial rate" = "purple")
                abline(h = input$tA, lty = 2, col = cols[1])
                abline(a = 0, b = input$tA * input$t0, lty = 2, col = cols[2])
                legend("bottomright",
                       legend = names(cols),
                       col = cols,
                       lty = 2,
                       bty = "n")
            }
        },
        "Asymptotic Exponential Reparametrized" = {
            curve(expr = input$tA_1*(1 - exp((x * log(1 - input$q_1))/input$t0_1)),
                  xlim = c(0, 10),
                  ylim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
        })

#-----------------------------------------------------------------------
