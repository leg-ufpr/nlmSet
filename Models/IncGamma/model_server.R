# Incomplete Gamma ------------------------------------------------


# NOTE: for some unknown reason, Shiny does not work with
# `do.call(curve, ...)` ou defining a function `my_curve()` that calls
# `curve()` in a customized form to set some parameters (`xlab`, `col`,
# etc). We understand that the call of `curve()` is a little verbose,
# repeating explicitly commom arguments, but, as explained, there is no
# wat to avoid this. `curve()` must be called explicitly.

# ATTENTION: the list `curve_args` is kept in the ../../server.R file.

switch (input$paramet_IncGamma,
        "Incomplete Gamma" = {
            curve(expr = (input$IG_t0) * (x^(input$IG_t1)) * exp(-(input$IG_t2)*x),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab,
                  xlim = c(0,5))
        },
        "Incomplete Gamma Reparametrized" = {
            curve(expr = (input$IGR_vY) * ((x^(input$IGR_t1))/(input$IGR_vX))*exp((input$IGR_t1) * ((x)/(input$IGR_vX))),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)       
        })

#-----------------------------------------------------------------------
