---
output:
  html_fragment
bibliography: "../../config/refs.bib"
---

## Description

The function
$$
  f(x) = \theta_{a}(1 - \exp\{-\theta_{c}x\}), \quad x \geq 0,
$$
is known by several names: [exponencial decay](https://people.richland.edu/james/lecture/m116/logs/models.html),
[asymptotic exponential](https://math.stackexchange.com/questions/1670018/how-to-fit-data-to-an-asymptotic-exponential),
[monomolecular growth](https://help.ixellence.com/dataplore/dp_manual104.html).

This function is positive, increasing monotonic and concave. It has two parameters

  * $\theta_{a} > 0$ ($\mathrm{y}$) is the superior asymptote, i.e.,
    $\lim_{x \to \infty} f(x) = \theta_a$.
  * $\theta_{c}$ ($\mathrm{x}^{-1})$ is proportional to the function
    rate at the origin since $f'(0) = \frac{\mathrm{d} f}{\mathrm{d} x}
    \Big |_{x = 0} = \theta_c \theta_a$.

## Parametrizations

The function
$$
  f(x) = \theta_{a}\left(1 - \exp\left\{\frac{x
    \log(1 - q)}{\theta_q}\right\}\right)
$$
is a reparatrization obtained by replacing $\theta_c$ by $\theta_q$ [@zeviani-tese]. $q
\in (0, 1)$ is a known variable related to the meaning of $\theta_q > 0$ ($\mathrm{x}$).
that is
$$
  f(x = \theta_q) = q \theta_a = \theta_a (1 - \exp\{-\theta_c \theta_q\},
$$
so, isolating $\theta_c$ gives
$$
  \theta_c = -\dfrac{\log(1 - q)}{\theta_q}.
$$

More manipulations leads to the following final expression
$$
\begin{aligned}
  f(x) &= \theta_a \left(1 - \exp\left\{\dfrac{x \log(1 - q)}{\theta_q}\right\} \right ) \\
       &= \theta_a \left(1 - \exp\left\{\log(1 - q)\right\}^{\frac{x}{\theta_q}} \right )\\
       &= \theta_a \left(1 - (1 - q)^{\frac{x}{\theta_q}} \right )\\
       &= \theta_a \left(1 - \left(\frac{1}{1 - q} \right)^{-\frac{x}{\theta_q}} \right ).
\end{aligned}
$$

If $q = 0.5$, the function becames
$$
  f(x) = \theta_a \left(1 - 2^{-\frac{x}{\theta_q}} \right ),
$$
and $\theta_q$ is the half-life period.

## Extensions

The asymptotic model passes through the origin because $f(x = 0) = 0$. A
natural extension is the inclusion of an intercept $\theta_0 \in
\mathbb{R}$ ($\mathrm{y}$). The model equation now has three parameters,
$$
  f(x) = \theta_{0} + (\theta_{a} - \theta_{0})(1 - \exp\{-\theta_{c} x\}).
$$

## References
