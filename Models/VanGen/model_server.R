# Van Genutchen -----------------------------------------------

# NOTE: for some unknown reason, Shiny does not work with
# `do.call(curve, ...)` ou defining a function `my_curve()` that calls
# `curve()` in a customized form to set some parameters (`xlab`, `col`,
# etc). We understand that the call of `curve()` is a little verbose,
# repeating explicitly commom arguments, but, as explained, there is no
# wat to avoid this. `curve()` must be called explicitly.

# ATTENTION: the list `curve_args` is kept in the ../../server.R file.

switch (input$paramet_VanGen,
        "Van Genutchen" = {
            curve(expr = input$VG_tR + ((input$VG_tS - input$VG_tR)/((1 + exp(input$VG_tA + x)^input$VG_tN)^input$VG_tM)),
                  xlim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)
        },
        "Van Genutchen Reparametrized" = {
            curve(expr = input$VGR_tR - ((input$VGR_vS * ((1 + input$VGR_tM)^(input$VGR_tM + 1)))/(input$VGR_tN * (1 + (exp(input$VGR_tN * (x - input$VGR_vI)))/(input$VGR_tM))^(input$VGR_tM))),
                  xlim = c(0, 10),
                  col = curve_args$col,
                  lwd = curve_args$lwd,
                  xlab = curve_args$xlab,
                  ylab = curve_args$ylab)       
        })

#-----------------------------------------------------------------------
