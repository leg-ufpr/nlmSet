# Bleasdale-Nelder ------------------------------------------------


# NOTE: for some unknown reason, Shiny does not work with
# `do.call(curve, ...)` ou defining a function `my_curve()` that calls
# `curve()` in a customized form to set some parameters (`xlab`, `col`,
# etc). We understand that the call of `curve()` is a little verbose,
# repeating explicitly commom arguments, but, as explained, there is no
# wat to avoid this. `curve()` must be called explicitly.

# ATTENTION: the list `curve_args` is kept in the ../../server.R file.

switch (input$paramet_BleNel,
        "Bleasdale-Nelder" = {
            curve(expr = x * (input$BN_t0 + (input$BN_t1 * x))^((-1)/(input$BN_t2)),
                  xlim = c(0,10),
                  ylim = c(0,5),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
        },
        "Bleasdale-Nelder Reparametrized" = {
            curve(expr = input$BNR_vY * ((x)/(input$BNR_vX)) * (1 - (input$BNR_t2 * (1 - ((x)/(input$BNR_vX)) ) ))^((-1)/(input$BNR_t2)),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)       
        })

#-----------------------------------------------------------------------
