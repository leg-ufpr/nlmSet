# Logistic --------------------------------------------------------


# NOTE: for some unknown reason, Shiny does not work with
# `do.call(curve, ...)` ou defining a function `my_curve()` that calls
# `curve()` in a customized form to set some parameters (`xlab`, `col`,
# etc). We understand that the call of `curve()` is a little verbose,
# repeating explicitly commom arguments, but, as explained, there is no
# wat to avoid this. `curve()` must be called explicitly.

# ATTENTION: the list `curve_args` is kept in the ../../server.R file.

switch (input$paramet_Logi,
        "Logistic" = {
            curve(expr = (input$LO_tA)/(1 + exp(input$LO_t0 + input$LO_t1 * x)),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
        },
        "Logistic Reparametrized" = {
            curve(expr = (input$LOR_tA)/(1 + ((1 - input$LOR_Q)/input$LOR_Q) * exp((-4 * input$LOR_vT) * (x - input$LOR_vQ))),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)       
        })

#-----------------------------------------------------------------------
