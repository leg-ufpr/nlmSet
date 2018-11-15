# Nonlinear Regression Models Catalogue

  * [Augusto Calcanhoto](https://github.com/Buzzonicalcanhoto),
    undergraduate student of the Bachelor in Statistics at Federal
    University of Paraná (developer).
  * [Willian Ramos](https://github.com/willianramos12), undergraduate
    student of the Bachelor in Statistics at Federal University of
    Paraná (developer).
  * [Bruna Wundervald](https://brunaw.com/), PhD student
    at the Maynooth University (creator).
  * [Walmes Zeviani](http://leg.ufpr.br/~walmes/),
    lecturer at Department of Statistics at Federal University of Paraná
    (supervisor).

## Project's Description

Regression models, usually, are used to explain a dependent variable's
behavior by means of one ou more explanatory variables.  This project is
developing a R package with a Shiny interface to document and explore
nonlinear regression models.  The model curve can be manipulated using
sliders, so allowing the user select the most apropriate model for
applications.

## Nonlinear models

A nonlinear model is when the model's parameters ($\theta$) are nonlinear
in the expression, that is, the first derivatives of the model with
relation to the parameters (gradient vector) depends on, at least, one
of them. The model
$$
  \eta(x, \theta) = \frac{\theta_a}{\theta_h + x}
$$
is nonlinear on the parameters because the gradient vector
$$
  \frac{\partial \eta}{\partial \theta^\top} = \begin{bmatrix}
    \dfrac{x}{\theta_h + x}\\
    \dfrac{\theta_a x}{(\theta_h + x)^2}
  \end{bmatrix}
$$
depends on the (unknown) parameters.

How these parameters controls the behavior of the function $\eta$?
Thats is a simple question but the answer may be depend on a lot of
math to have it determined.  The purpose of this application is provide
a visual way to inspect the effect of each parameter in the behavior of
the function $\eta$. We beliave that this can simplify the process of
choosing a nonlinear model for a particular application and also help
the practioner unsterstand the model parameters.

The following equation
$$
  \eta(x, \theta) = \theta_0 \exp\{-\exp\{\theta_1 (x - \theta_2) \}\},
$$

is known as Gompertz growth model because its describe the growth of
organisms and populations based on some theory.  Provided this theory,
the parameters usually have some meaning but the effect of changing each
one separatelly is showed on the following figure.

![](Photos/gompertz_effect.png)

Based on this figure, is pretty fast to notice that

  * $\theta_0$ is related to the superior asymptote;
  * $\theta_1$ is related to the rate of the function;
  * $\theta_2$ is related to the horizontal shift;

This figure also give some idea about which forms this model can assume
and, after realizing that, weather this model is appropriate to a
particular application.

The main idea of this application is:

  1. to make the function inspection process intective.
  2. to catallogue nonlinear models because with a large collection you
     can
     1. have a higher chance to choose the most appropriate model.
     2. recognize that some models are simple reparametrizations of
        anothers.
     3. notice that some parametrizations are more interting than others
        because of the meaning or effects of the parameters on the
        function.
  3. to describe each (family of) nonlinear regression model in
     mathematical, historical and applied aspects.
  4. to provide some code for the R language to simulate data from
     each model and fit them to real data.
