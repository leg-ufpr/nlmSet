# Michaelis-Menten

## Descrição



  O Michaelis-Menten é o modelo mais conhecido de cinética enzimática. Seu nome
faz referência aos autores, o bioquímico Leonor Michaelis e o físico Maud
Menten. É uma função não negativa, monótona e côncava, com o seguinte
formato:


  $$f(x) = \frac{\theta_{a}x}{\theta_{v}+x}$$,

em que

- $x > 0$,
- $\theta_{a} \geq 0 (Y)$ é a assíntota $(\lim_{x\to\infty}f(x) = \theta_{a})$ e
- $\theta_{v} > 0 (X)$ é o tempo de meia vida, correspondendo
à abcissa para qual o valor da função vale $\frac{\theta_{a}}{2}$.



## Aplicações


O modelo assume a forma de uma equação que descreve a taxa de reações
enzimáticas, como a da Pepsina, Quimotripsina, Ribonuclease, etc. Também são
encontradas na literatura aplicações em outros ramos da bioquímica, como
o estudo da riqueza de espécies, medição de álcool no sangue, infeccções por
bacteriófagos, a relação entre fotossíntese e irradiância, etc.

Em reações enzimáticas, temos que $x$ é a concentração do substrato, $\theta_{a}$
  é a taxa máxima atingida pelo sistema na saturação máxima de $x$, e a constante
$\theta_{v}$ é o valor de $x$ em que a taxa de reação é metade de $\theta_{a}$.  


## Primeira Reparametrização


A primeira parametrização alternativa (ZEVIANI et al., 2012) deste modelo
apresentada no catálogo tem o formato:

  $$f(x) = \frac{\theta_{a}x}{\vartheta_{q}(\frac{1-q}{q})+x}$$,

agora tendo

- $\vartheta_{q}(\frac{1-q}{q}) > 0 (X)$ como o tempo de meia vida, correspondendo
à abcissa para qual o valor da função vale $\frac{\theta_{a}}{2}$.

Nesta reparametrização, temos que $0 < q < 1$ é uma constante,
representando uma fração de $\theta{a}$, para a qual $\vartheta_{q} > 0 (X)$ é
o valor correspondente na abcissa. Ou seja, $\vartheta_{q}$ é o tempo para uma
certa fração $q$ de vida.

Zeviani et al. (2012) consideraram este modelo em estudos sobre a liberação de
potássio no solo a partir de fontes orgânicas incubadas em latossolos.


## Segunda Reparametrização  


Como uma segunda opção para o modelo Michaelis-Menten, Zeviani et al
(2012) sugerem o seguinte:

  $$f(x) = \frac{\theta_{a}x}{1+\frac{1-q}{q}(\frac{\vartheta_{q}}{x})^{\theta_{c}}}$$,

e com isso

- $\theta_{c} > 0$ é incluído, sendo o parâmetro que controla a forma da
função.

Se $0 < \theta_{c} < 1$, a função é côncava; se $\theta_{c} > 1$, ela tem
formato sigmoidal, ou seja, apresenta ponto de inflexão; e se $\theta_{c} = 1$,
retorna-se ao modelo Michaelis-Menten anterior.

Esta reparametrização pode ser aplicada na representação da
produção de gases em ruminantes (Groot et al.(1996)) e no estudo do
crescimento de bactérias em relação ao tempo (Becker et al. (2007)).


## Terceira Reparametrização  


A terceira reparametrização deste modelo, proposta por Zeviani et al
(2012), é uma modificação do item anterior. Com isso, a função passa
a ser monótona decrescente, já que

- $\theta_{a} > 0 (Y)$ é agora intercepto $(f(x=0) = \theta_{a})$

  e

- a assíntota inferior é o zero $(\lim_{x\to\infty}f(x) = 0)$

  O parâmetro $\vartheta_{q} > 0 (X)$ traduz o valor na abcissa
correspondente a uma fração $q$ de vida. Esta reparametrização
tem o seguinte formato:

  $$f(x) = \frac{\theta_{a}x}{1+\frac{1-q}{q}(\frac{x}{\vartheta_{q}})^{\theta_{c}}}$$


## Quarta Reparametrização    

  A adição do parâmetro $\theta_{c}$ ao modelo original Michaelis-Menten
o faz tomar o formato conhecido por modelo de Hill (HILL, 1913):

  $$f(x) = \frac{\theta_{a}x^{\theta_{c}}}{\theta_{v}+x^{\theta_{c}}}$$


  Na reparametrização desta extensão do Michaelis-Menten, temos que a
função é positiva e monótona crescente, considerando:

  - $x \geq 0$,

- $\theta_{a} \geq 0 (Y)$ é a assíntota,

- $\theta_{v}^{\frac{1}{\theta_{c}}} (X)$ o tempo de meia vida

- $\theta_{c} > 0$ o parâmetro que controla a forma da função. Isto é,
caso $0 < \theta_{c} < 1$, ela é côncava; se $\theta_{c} > 1$, tem
formato sigmoidal, e se $\theta_{c} = 1$, retorna-se ao modelo original.


Este modelo descreve a fração de macromoléculas saturadas por ligandos
como função da concentração destes. Ele é utilizado na determinação
da influência do ligando na formação de uma enzima ou receptor. Isso
acontece quando já existem outros ligandos na macromolécula, o que
também é conhecido como cooperativismo dos ligantes
(outro nome para "ligando"). Goutelle et al. (2008) discorrem sobre mais propriedades
do modelo de Hill.

