# Modelo Exponencial Assintótico


## Descrição

O modelo Exponencial Assintótico, também conhecido como negativo exponencial
 <cite>[Tjorve2009][1]</cite> ou monomolecular <cite>[Box-Lucas1959][2]</cite>,
é uma função positiva, monótona crescente e côncava, dada pela função
$$
  f(x) = \theta_{a}(1 - \exp\{-\theta_{c}x\}), \quad x \geq 0,
$$
em que

  * $\theta_{a} > 0$ (u.m. $\texttt{Y}$) é a assíntota da função, ou
    seja, $\lim_{x \to \infty} f(x) = \theta_a$.
  * $\theta_{c}$ (u.m. $\texttt{X}^{-1})$ é diretamente proporcional a
    taxa da função na origem, $f'(0) = \theta_c \theta_a$.

## Reparametrização

Em uma particular parametrização deste modelo, obtida por @zeviani-tese,
substiui-se o parâmentro $\theta_c$ pelo parâmentro $\vartheta_q$
(u.m. $\texttt{X}$) que é o valor nas abcissas correpondente a uma
fração $q \in (0, 1)$ da assíntota, ou seja
$$
  f(\vartheta_q) = q \theta_a =
    \theta_a (1 - \exp\{-\theta_c \vartheta_q\}.
$$

Isolando-se $\theta_c$ nessa expressão, tem-se que $\theta_c =
-\log(1-q)/\vartheta_q$. Com isso, depois da substituição, o modelo
reparametrizado é escrito como
$$
  f(x) = \theta_{a}\left(1 - \exp\left\{\frac{x
    \log(1 - q)}{\vartheta_q}\right\}\right)
$$
em que $q$ é um valor fixado pelo usuário. Uma escolha comum é $q =
1/2$, onde $\vartheta_q$ é chamado de "meia vida".

Simplificando ainda mais os termos dentro de modelo
$$
\begin{align*}
\exp\{-x \log(1-q)/\vartheta_q\} &=
  \left(\text{e}^{\log(1-q)}\right)^{x/\vartheta_q} \\
 &= (1-q)^{x/\vartheta_q},
\end{align*}
$$
podemos reescrever-lo como
$$
  f(x) = \theta_{a} (1 - (1 - q)^{\frac{x}{\vartheta_q}}).
$$

## Casos particulares

O modelo até agora descrito parte da origem. Em muitas situações, é
necessário a inclusão de um intercepto $\theta_0$ (u.m. $\texttt{Y}$)
para dar mais flexibilidade ao modelo. Com isso, o modelo é
$$
  f(x) = \theta_0 + \theta_{a} (1 - (1 - q)^{\frac{x}{\vartheta_q}}).
$$

A interpretação dos parâmetros muda. A assíntota é data por
$$
  \lim_{x \to infty} = \theta_0 + \theta_a
$$
que dá uma interpretação de complemento, ou seja, do quanto a assíntota
está acima do intercepto. O parâmetro $\vartheta_q$ passa a ser
$$
  f(\vartheta_q) = \theta_0 + \frac{1}{q} \theta_a.
$$

Com a inclusão do intercepto, o modelo pode admitir valores de $\theta_a
< 0$ para representar curvas de decaimento também.

```{r, include = FALSE, eval = FALSE}
fx <- function(x, th0, tha, thq, q) {
    th0 + tha * (1 - (1 - q)^(x/thq))
}

library(rpanel)

draw <- function(panel) {
    with(panel, {
        curve(fx(x, th0, tha, thq, q), 0, 10, asp = 1)
        abline(v = thq, h = th0 + q * tha)
    })
    return(panel)
}

panel <- rp.control(q = 0.5)
rp.slider(panel = panel, variable = th0, from = 0, to = 2,
          action = draw, showvalue = TRUE)
rp.slider(panel = panel, variable = tha, from = -5, to = 5,
          action = draw, showvalue = TRUE)
rp.slider(panel = panel, variable = thq, from = 0, to = 5,
          action = draw, showvalue = TRUE)
```

## Aplicações

Este modelo tem aplicações semelhantes às do Michaelis-Menten. Entre
elas, estão a explicação do comportamento da liberação de nutrientes no
solo [@Zeviani-etal2012] e do progresso de doenças
[@Kranz1990; @Segarra-etal2001].

Além disso, em (BASSANEZI et al. TODO) o modelo exponencial assintótico
foi utilizado para a previsão de recordes na Olímpiada de Pequim e em
estudos sobre os índices de criminalidade no ABCD paulista.

## Referências


