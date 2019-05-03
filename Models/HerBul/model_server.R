# Herschel-Bulkley --------------------------------------------------------


# NOTE: for some unknown reason, Shiny does not work with
# `do.call(curve, ...)` ou defining a function `my_curve()` that calls
# `curve()` in a customized form to set some parameters (`xlab`, `col`,
# etc). We understand that the call of `curve()` is a little verbose,
# repeating explicitly commom arguments, but, as explained, there is no
# wat to avoid this. `curve()` must be called explicitly.

# ATTENTION: the list `curve_args` is kept in the ../../server.R file.

switch (input$paramet_HerBul,
        "Herschel-Bulkley" = {
            curve(expr = input$HB_t0 + (input$HB_t1 * (x^input$HB_t2)),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
        },
        "Herschel-Bulkley Reparametrized" = {
            curve(expr = input$HBR_t0 + (input$HBR_t1 * (x ^ ((log(input$HBR_Q) - log(input$HBR_t1))/log(input$HBR_vT)))),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
        })

#-----------------------------------------------------------------------
