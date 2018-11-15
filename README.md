# Nonlinear Regression Models Catalogue

[Augusto Calcanhoto](https://github.com/Buzzonicalcanhoto), graduating in statistic Federal University of Paraná.

[Bruna Wundervald](https://gitlab.c3sl.ufpr.br/u/bdw13),
graduate in statistic at the Federal University of Paraná.  

[Willian Ramos](https://github.com/willianramos12),
graduating in statistic Federal University of Paraná.

[Walmes Zeviani](https://gitlab.c3sl.ufpr.br/u/walmes),
lecturer at Department of Statistics at Federal University of Paraná.

## Project's Description 

Regression models, usually, are used to explain a dependent 
variable's behavior by reason of one ou more explanatory variable. 
This project is developing a R package with a Shiny interface to document 
and explore nonlinear regression models. The model curve can be 
manipulated using sliders, so allowing the user select the most 
apropriate model for applications.


### Examples of non-linear models:

$\large{\hat{y} = \beta_{0}^{} + \beta_{1}^{}(x + \beta_{2}^{})^{2}}$
  
$\large{\hat{y} = \beta_{0}^{} + (1 - \exp(- \beta_{1}^{}(x - \beta_{0}^{})))}$



Para estes modelos, a forma como os parâmetros se relacionam com a
função não é óbvia. Com isso, é difícil perceber se a forma destas
funções condiz com a relaçãoentre as variáveis observadas.


### Exemplo com curvas de um mesmo modelo variando seus parâmetros:

![](Photos/gompertz_effect.png)

Com ajuda gŕafica, é mais fácil perceber como os parâmetros afetam
as curvas da equação, como é notável na imagem acima. Assim,
este projeto tem como objetivo apresentar um catálogo interativo de
modelos não lineares. A ideia principal do catálogo é possibilitar ao
usuário escolher qual modelo melhor se aplica aos seus dados.

O catálogo é uma aplicação *web* que usa recursos
interativos para alterar a forma da função através dos parâmetros. O
usuário final interage com uma página *web*, que contém:

  - 1. o gráfico com a curva do modelo,
  - 2. uma coluna com *sliders* de alteração dos parâmetros,
e, consequentemente, da forma da curva,
  - 3. os respectivos acessórios, como botões de acesso a
documentação e ao código-fonte.

A interface proposta contém materiais para cada modelo presente, aonde
constam suas especificações, propriedades, aplicações e parametrizações
conhecidas. São utilizados o software estatístico R, e o Shiny, para
a construção da interface web.

Os resultados, em termos gerais, são uma melhora na visualização dos
modelos, o que leva a uma compreensão mais rápida sobre como eles
funcionam e se relacionam com seus respectivos  parâmetros.

O projeto está sendo desenvolvido no LEG (Laboratório de Estatística e
Geoinformação), da Universidade Federal do Paraná, em Curitiba.
Sugestões de implementação, comentários e contribuições são bem vindas.
