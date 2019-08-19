# Asymptotic Exponential -----------------------------------------------

# NOTE: for some unknown reason, Shiny does not work with
# `do.call(curve, ...)` ou defining a function `my_curve()` that calls
# `curve()` in a customized form to set some parameters (`xlab`, `col`,
# etc). We understand that the call of `curve()` is a little verbose,
# repeating explicitly commom arguments, but, as explained, there is no
# wat to avoid this. `curve()` must be called explicitly.

# ATTENTION: the list `curve_args` is kept in the ../../server.R file.

switch (input$paramet_QuadPla,
        "Quadratic plateau" = {
            b <- -input$QuadPla_th1/(2 * input$QuadPla_th2)
            curve(expr = input$QuadPla_th0 +
                      (input$QuadPla_th1 * x + input$QuadPla_th2 * x^2) * (x <= b) +
                      (input$QuadPla_th1 * b + input$QuadPla_th2 * b^2) * (x > b),
                  xlim = c(0, 10),
                  ylim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
        },
        "Canonical quadratic plateau" = {
            curve(expr = input$QuadPla2_thp +
                      input$QuadPla2_th2 * (x - input$QuadPla2_thb)^2 * (x <= input$QuadPla2_thb),
                  xlim = c(0, 10),
                  ylim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
        },
        "Plateau quadratic" = {
            curve(expr = input$QuadPla3_thp +
                      input$QuadPla3_th2 * (input$QuadPla3_thb - x)^2 * (x > input$QuadPla3_thb),
                  xlim = c(0, 10),
                  ylim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
        })

#-----------------------------------------------------------------------
