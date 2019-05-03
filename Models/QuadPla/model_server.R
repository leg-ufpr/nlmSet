# Asymptotic Exponential -----------------------------------------------

# NOTE: for some unknown reason, Shiny does not work with
# `do.call(curve, ...)` ou defining a function `my_curve()` that calls
# `curve()` in a customized form to set some parameters (`xlab`, `col`,
# etc). We understand that the call of `curve()` is a little verbose,
# repeating explicitly commom arguments, but, as explained, there is no
# wat to avoid this. `curve()` must be called explicitly.

# ATTENTION: the list `curve_args` is kept in the ../../server.R file.

switch (input$paramet_QuadPla,
        "Quadratic Plateau" = {
            curve(expr = input$AE_tA * (1 - exp(-input$AE_t0 * x)),
                  xlim = c(0, 10),
                  ylim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
        },
        "Quadratic Plateau Reparametrized" = {
            curve(expr = input$AER_tA * (1 - exp((x * log(1 - input$AER_Q))/input$AER_t0)),
                  xlim = c(0, 10),
                  ylim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)       
        })

#-----------------------------------------------------------------------
