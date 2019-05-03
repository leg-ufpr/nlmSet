# Mitscherlich ------------------------------------------------------------


# NOTE: for some unknown reason, Shiny does not work with
# `do.call(curve, ...)` ou defining a function `my_curve()` that calls
# `curve()` in a customized form to set some parameters (`xlab`, `col`,
# etc). We understand that the call of `curve()` is a little verbose,
# repeating explicitly commom arguments, but, as explained, there is no
# wat to avoid this. `curve()` must be called explicitly.

# ATTENTION: the list `curve_args` is kept in the ../../server.R file.

switch (input$paramet_Mits,
        "Mitscherlich" = {
            curve(expr = input$MI_t1 * (1 - exp(-input$MI_t0 * (x - input$MI_t0))),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
        },
        "Mitscherlich Reparametrized" = {
            curve(expr = input$MIR_tA * (1 - exp(x * log(1 - input$MIR_Q) * ((x - input$MIR_t0)/(input$MIR_vt - input$MIR_t0)) )),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)       
        })

#-----------------------------------------------------------------------
