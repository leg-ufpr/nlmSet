# Asymptotic Exponential -----------------------------------------------

# NOTE: for some unknown reason, Shiny does not work with
# `do.call(curve, ...)` ou defining a function `my_curve()` that calls
# `curve()` in a customized form to set some parameters (`xlab`, `col`,
# etc). We understand that the call of `curve()` is a little verbose,
# repeating explicitly commom arguments, but, as explained, there is no
# wat to avoid this. `curve()` must be called explicitly.

# ATTENTION: the list `curve_args` is kept in the ../../server.R file.

switch (input$paramet_LinPla,
        "Linear plateau (defined on origin)" = {
            curve(expr = input$LP_inter +
                      input$LP_rate * x * (x <= input$LP_break) +
                      input$LP_rate * input$LP_break * (x > input$LP_break),
                  xlim = c(0, 10),
                  ylim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
            if (input$check) {
                abline(v = input$LP_break)
                abline(a = input$LP_inter,
                       b = input$LP_rate)
            }
        },
        "Linear plateau defined on break point" = {
            curve(expr = input$LP2_plateau +
                      input$LP2_rate * (x - input$LP2_break) * (x <= input$LP2_break),
                  xlim = c(0, 10),
                  ylim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
            if (input$check) {
                abline(v = input$LP_break)
                abline(v = input$LP_plateau)
            }
        },
        "Plateau linear" = {
            curve(expr = input$LP3_plateau +
                      input$LP3_rate * (input$LP3_break - x) * (x > input$LP3_break),
                  xlim = c(0, 10),
                  ylim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
            if (input$check) {
                abline(v = input$LP_break)
                abline(v = input$LP_plateau)
            }
        })

#-----------------------------------------------------------------------
