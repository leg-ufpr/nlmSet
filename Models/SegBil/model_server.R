# Segmented Bilinear ----------------------------------------------


# NOTE: for some unknown reason, Shiny does not work with
# `do.call(curve, ...)` ou defining a function `my_curve()` that calls
# `curve()` in a customized form to set some parameters (`xlab`, `col`,
# etc). We understand that the call of `curve()` is a little verbose,
# repeating explicitly commom arguments, but, as explained, there is no
# wat to avoid this. `curve()` must be called explicitly.

# ATTENTION: the list `curve_args` is kept in the ../../server.R file.



switch (input$paramet_SegBil,
        "Segmented Bilinear" = {
            curve(ifelse(test = (x < input$SB_tB),
                         yes = (input$SB_t0 + (input$SB_t1 * x)),
                         no = (input$SB_t0 + input$SB_t1 + input$SB_t2 * (x - input$SB_tB))),
                  xlim = c(0, 10),
                  ylim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
        },
        "Segmented Bilinear Reparametrized" = {
            curve(expr = input$SBR_vB + input$SBR_t1 * (x - input$SBR_tB),
                  xlim = c(0, 10),
                  ylim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)       
        })

#-----------------------------------------------------------------------
