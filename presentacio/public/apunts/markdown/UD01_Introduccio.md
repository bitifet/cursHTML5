
```
－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
ＵＤ０１  －  Ｉｎｔｒｏｄｕｃｃｉｏ  ａ  ＨＴＭＬ５，  ＣＳＳ
              ｉ  ｅｉｎｅｓ  ｄｅ  ｐｒｅｐｒｏｃｅｓｓａｔ
－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
```

__NAV_LINK__[(⇧ Planificacio)](./Planificacio.html)

Índex
=====


<!-- vim-markdown-toc GFM -->

* [Introducció](#introducció)
    * [Història](#història)
        * [Abans de HTML5](#abans-de-html5)
    * [A partir d'HTML5](#a-partir-dhtml5)
* [Ecosistema HTML 5](#ecosistema-html-5)
* [Llenguatge de Marques (Markup)](#llenguatge-de-marques-markup)
    * [Elements (Tags)](#elements-tags)
        * [Anatomia](#anatomia)
        * [Custom Elements](#custom-elements)
    * [Atributs](#atributs)
        * [Atributs "data-xxx"](#atributs-data-xxx)
    * [Estructura de l'HTML](#estructura-de-lhtml)
        * [Elements de la Capçalera](#elements-de-la-capçalera)
        * [Elements del Cos](#elements-del-cos)
    * [Exercicis](#exercicis)
        * [Exercici 1:](#exercici-1)
    * [Referències](#referències)
* [Entorn de Treball](#entorn-de-treball)
    * [Editor de Text](#editor-de-text)
    * [Servidor Web i Motor de Plantilles PUG.](#servidor-web-i-motor-de-plantilles-pug)
        * [Prerequisits](#prerequisits)
        * [Procediment](#procediment)
    * [Referències](#referències-1)
* [Preprocessadors](#preprocessadors)
    * [Preprocessadors HTML](#preprocessadors-html)
    * [Preprocessadors CSS](#preprocessadors-css)
    * [Preprocessadors Javascript](#preprocessadors-javascript)
    * [Referències](#referències-2)

<!-- vim-markdown-toc -->


Introducció
===========

Benvinguts al curs d'HTML5 de l'EBAP.

Aquest és un curs avançat. Motiu pel qual es pressuposen uns mínims
coneixements previs d'HTML, CSS i Javascript.

En aquesta unitat didàctica repassarem breument els conceptes més importants,
sense entrar en detalls, per assegurar que tots tenim, més o menys, els
mateixos coneixements bàsics que ens seran clau per a poder seguir la resta del
curs.

Si alguna cosa no l'entenem o ens resulta nova, és important preguntar al
professor i/o investigar pel nostre compte a fi de poder entendre millor la
resta d'unitats didàctiques.


Història
--------

### Abans de HTML5

**HTML 4.01**

  * Strict

```
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">
```

  * Transitional

```
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
```

  * Frameset

```
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN"
   "http://www.w3.org/TR/html4/frameset.dtd">
```

**XHTML 1.0**

  * Strict (quick reference)

```
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
```

  * Transitional

```
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
```

  * Frameset

```
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
```

**XHTML 1.1**

```
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" 
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
```

**XHTML Basic 1.1**

```
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML Basic 1.1//EN"
    "http://www.w3.org/TR/xhtml-basic/xhtml-basic11.dtd">
```

**Font:** [https://www.w3.org/QA/2002/04/valid-dtd-list.html]()


A partir d'HTML5
----------------

```
<!DOCTYPE HTML>
```

Al contrari que les versions anteriors, HTML5 és una especificació oberta que
va creixent al llarg del temps.

Abans els navegadors aplicaven estrictament les normes imposades per
l'especificació corresponent al DTD.

I si no hi havia DTD, reportaven un error per la consola (que l'usuari corrent
normalment no veu) i, "feien el que podien".

Al final un s'adonava que de vegades era millor treure DTD perquè així solien
funcionar totes les funcionalitats de les distintes especificacions.


**A partir d'HTML5, aquell "feien el que podien" passa a ser la norma:** Si el
navegador no reconeix un tag, un atribut o es troba amb qualsevol altra
circumstància que no casi amb les especificacions que ell coneix, ha d'intentar
resoldre-ho "de la millor manera possible" per tal de minimitzar l'impacte de
cara a l'usuari.

**Per exemple:** un navegador que no conegui el tag `<progress>`, el tractarà
com si en el seu lloc hi hagués un simple `<div>`


Això no vol dir que puguem fer el que vulguem ni que ja no hagem de fer servir
validadors d'HTML:

  * Primer perquè sempre és bo verificar que el nostre codi s'ajusta als
    estàndards actuals.

  * I segon perquè és fàcil cometre errors quan escrivim html i, tot i que els
    navegadors intentaran endevinar "què volíem dir realment", sempre n'hi
    haurà que hi tindran més traça que d'altres..


Ecosistema HTML 5
=================

  * Markup (HTML)
  * Fulls d'Estil (StyleSheets)
  * Javascript
  * DOM
  * Frameworks
    · jQuery
    · [You might not need jQuery](http://youmightnotneedjquery.com/)
  * Atributs data-*
  * Forms
    - Form Validation
  * HTML5 APIs


Llenguatge de Marques (Markup)
==============================

Elements (Tags)
---------------


### Anatomia


```html
<div class="menu">
    (contingut...)
</div>
```

```html
<input name="age" type="number" />
```


### Custom Elements

Els elements de client o "custom" son aquells en els que el nom del tag està en
minúscules i conté al menys un guió ("-"). Llevat d'algunes excepcions que no
vénen al cas.

Els elements "custom" no seran reportats com a "desconeguts" per un validador.
I la seva finalitat és la de poder implementar components específics del costat
del navegador.

```html
<my-component>
    (contingut...)
</my-component>
```

>
:point-right: [React](https://reactjs.org/),
[Polymer](https://www.polymer-project.org/) i [Angular](https://angular.io/)
son alguns dels frameworks més coneguts que en fan ús.
>


Atributs
--------

  * Els noms del atributs és "case-insensitive" a HTML5.


### Atributs "data-xxx"

De forma semblant als *Custom Elements*, els atributs el nom dels quals comenci
per "data-", son considerats atributs d'usuari.

Aquests atributs es poden fer servir lliurement a qualsevol element sense que
mai cap validador ens alerti de que no el reconeix i, **el que és molt més
important:** sense el perill que nous atributs que s'estandarditzin en el futur
hi puguin col·lisionar.

Resulten **molt útils** per atribuir informació semàntica a elements
determinats que després podem fer servir tant des dels nostres controladors
javascript com, si cal, des del full d'estil CSS.




Estructura de l'HTML
--------------------

  * DTD
  * Document (`<html>`)
    - Capçalera (`<head>`)
    - Cos (`<body>`)

### Elements de la Capçalera

  * Títol (`<title>`)
  * Codificació de caràcters: `<meta charset='utf-8' />`
  * Viewport: `<meta name="viewport" content="width=device-width, initial-scale=1">`
  * Fulls d'estil
    - Externs: `<link rel="stylesheet" type="text/css" href="..." />`
    - Interns: `<style>...</style>` (També poden anar dins el cos)
  * Scripts (?)
    - Externs: `<script src="..." />` (També poden anar dins el cos\*)
    - Interns: `<script>...</script>` (També poden anar dins el cos\*)

>
**NOTA:** Avui en dia els scripts es solen ubicar al propi cos del document i,
preferentment, al final per dues raons:
>
  1. Per evitar retardar la descàrrega (i, com a conseqüència, també la
     renderització) del document.
  2. Perquè si el script necessita capturar elements del DOM, no pot fer-ho
     fins que aquests s'hagin creat. **I aquesta és la millor manera
     d'assegurar-ho**.
>


### Elements del Cos

Els mes comuns son:

  * `<div></div>`
  * `<span></span>`
  * `<h1></h1>`, `<h2></h2>`, `<h3></h3>`, ...
  * `<a href="..."></a>`
  * `<p></p>`
  * `<br />`
  * `<pre></pre>`
  * etcètera...

Llistes:

  * `<ul></ul>` / `<ol></ol>` 
    - `<li></li>` / `<li></li>` 

Taules:

  * `<table></table>`
    - `<thead></thead>` / `<tbody></tbody>` / `<tfooter></tfooter>`
    - `<tr></tr>`
      + `<td></td>` / `<th></th>`


Nous a HTML5

  * `<header></header>`
  * `<footer></footer>`
  * `<section></section>`
  * `<article></article>`
  * `<aside></aside>`
  * etcètera...







-----------------------------------------------------------------------------------------

Exercicis
---------

### Exercici 1:

Redactar una carta de presentació, estil currículum en HTML5. Ha de contenir com a mínim:

  - El vostre nom i llinatges.
  - Els vostres coneixements i experiència en HTML i/o altres tecnologies.
  - Motiu que vos ha impulsat a fer aquest curs.

Heu d'aplicar el que heu après fins ara. Però podeu anar més enllà si en sabeu
(incloure una fotografia, aplicar estils, etcètera...).


-----------------------------------------------------------------------------------------


Referències
-----------

  * **Elements HTML5:**
    - Nous elements HTML5: [https://www.w3schools.com/html/html5_new_elements.asp]().
    - Referència completa: [https://www.tutorialspoint.com/html5/html5_tags.htm]().
  * **Atributs HTML5:**
    - Referència competa d'atributs: [https://www.w3schools.com/tags/ref_attributes.asp]().
  * **Altres:**
    - Viewport: [https://developer.mozilla.org/en-US/docs/Mozilla/Mobile/Viewport_meta_tag]().


\newpage

Entorn de Treball
=================

Per poder seguir aquest curs necessitarem principalment tres coses:

  1. Un editor de text que suporti ressaltat sintàctic.

  2. Un servidor web per poder visualitzar els exercicis que anem fent no només
     al nostre ordinador, sinó com a mínim també al nostre smartphone.

  3. També farem servir un motor de plantilles HTML. Concretament el *Pug*
     (abans conegut com a "Jade"). Això ens permetrà:
     - Generar HTML molt més ràpidament.
     - Amb menys propensió a errors (perquè la sintaxi és més clara i perquè si
       cometem errors greus el compilador els detectarà).
     - Fer servir models de dades externs (el que seria separar la vista de les
       dades en un model MVC).


Editor de Text
--------------

Podeu fer servir el que vulgueu si el teniu disponible.

Als ordinadors de l'aula trobareu preparat el Sublime Text.

Si el voleu fer servir també a casa, heu de saber que Sublime Text no incorpora
per defecte el ressaltat sintàctic per a fitxers *Pug*. Però se li pot afegir
mitjançant el seu sistema de paquets:

  * Menú Preferences -> Package Control

  * Teclejam 'pi' i sel·leccionam "Install Package"

  * Teclejam 'Pug' i sel·leccionam "Pug"


Servidor Web i Motor de Plantilles PUG.
---------------------------------------

Com a Servidor Web, farem servir *Express*. Que és un framework per *Node.JS*
disponible al repositori de paquets *NPM*.

Explicar Node.JS i el funcionament de Express està fora dels objectius d'aquest
curs. Simplement els farem servir perquè son la forma més ràpida i senzilla
d'obtenir un entorn de treball amb les eines que necessitam.

Així que, seguidament, ens limitarem a relacionar les passes a seguir per crear
un projecte *Express* per poder començar a treballar:

### Prerequisits

  * *Node.JS* i *NPM*: Els ordinadors de l'aula ja els tenen instal·lats.
    - A l'apartat de [referències](#referències-1) trobareu més informació si
      voleu instal·lar-vos-els a casa.

  * *Express-generator*: És una eina en línia de comandes que ens permetrà
    crear projectes *Expres* funcionals només executant una comanda.
    - Si no el tenim ja instal·lat, l'instal·larem amb la comanda `npm install
      -g express-generator`.


### Procediment

Obrirem una terminal i seguirem els passos següents:

*1.* Cream un directori, per exemple de nom "exercicis", on emmagatzemar els
nostres exercicis i projectes i ens situam en ell.

```sh
usuari@maquina:~$ mkdir exercicis
usuari@maquina:~$ cd exercicis
usuari@maquina:~/exercicis$
```

*2.* Repetirem el pas anterior per crear a dins d'aquest un subdirectori, per
exemple "cursHTML5" per al nostre primer projecte.

```sh
usuari@maquina:~/exercicis$ mkdir cursHTML5
usuari@maquina:~/exercicis$ cd cursHTML5/
usuari@maquina:~/exercicis/cursHTML5$
```

*3.* Fem servir la comanda `express` (l'*express-generator*) per crear un
projecte buit:

```sh
usuari@maquina:~/exercicis/cursHTML5$ express --view=pug

   create : public/
   create : public/javascripts/
   create : public/images/
   create : public/stylesheets/
   create : public/stylesheets/style.css
   create : routes/
   create : routes/index.js
   create : routes/users.js
   create : views/
   create : views/error.pug
   create : views/index.pug
   create : views/layout.pug
   create : app.js
   create : package.json
   create : bin/
   create : bin/www

   install dependencies:
     $ npm install

   run the app:
     $ DEBUG=curshtml5:* npm start

```

Això ens haurà creat una estructura de fitxers i directoris com aquesta:

```
.
├── app.js
├── bin
│   └── www
├── package.json
├── package-lock.json
├── public
│   ├── images
│   ├── javascripts
│   └── stylesheets
│       └── style.css
├── routes
│   ├── index.js
│   └── users.js
└── views
    ├── error.pug
    ├── index.pug
    └── layout.pug
```


Les dues següents passes ja ens les ha suggerit el propi express-generator...


*4.* Executam `npm install` per tal que s'instal·lin totes les dependències:

```sh
usuari@maquina:~/exercicis/cursHTML5$ npm install
npm notice created a lockfile as package-lock.json. You should commit this file.
added 118 packages from 174 contributors and audited 247 packages in 3.707s
found 0 vulnerabilities
```

i...

*5.* Arrancam el nostre nou servidor web. Podem fer servir la comanda que s'ens
o, en el nostre cas, amb `npm start` serà suficient.


```sh
usuari@maquina:~/exercicis/cursHTML5$ npm start

> curshtml5@0.0.0 start /home/usuari/exercicis/cursHTML5
> node ./bin/www
```

Ara hauríem de poder accedir al nostre servidor web a través del port 3000 del
nostre PC. És a dir: a la url [http://localhost:3000]().

  * També, si tenim el nostre mòbil connectat a la xarxa inalàmbrica i coneixem
    l'adreça IP del nostre ordinador (que podem obtenir amb les comandes
    `ifconfig` o `ip addr list`), hi podrem accedir canviant "localhost" per la
    nostre IP a l'enllaç anterior. 


Si ara desam el fitxer que hem creat a l'exercici anterior sota el directori
"public" i amb el nom "curriculum.html", veurem que podem accedir a ell sota al
url [http://localhost:3000/curriculum.html]() (o amb la IP corresponent si
volem poder accedir-hi també des del nostre smartphone).




Referències
-----------

  * *Sublime Text*: [https://www.sublimetext.com/]().

  * Instal·lació Node.JS i NPM:
    - Via *NVM* (recomanat):
      [https://github.com/creationix/nvm/blob/master/README.md#install-script]().
    - Amb el gestor de paquets del Sistema Operatiu:
      [https://nodejs.org/es/download/package-manager/]().
    - Instal·lació manual: [https://nodejs.org/en/download/]().


\newpage


Preprocessadors
===============

Els preprocessadors son eines que ens permeten transformar un fitxer de codi
escrit en un llenguatge modificat o totalment distint al que entén compilador o
intèrpret al que estan destinats.

Per exemple, el motor de plantilles *Pug* és un preprocessador que transforma
una plantilla *Pug* en un document HTML vàlid que pot llegir qualsevol
navegador.

Al projecte *Expres* que hem creat anteriorment, podem veure com a dins el
directori *views* tenim tres fitxers:

error.pug  index.pug  layout.pug



**layout.pug:**

```
doctype html
html
  head
    title= title
    link(rel='stylesheet', href='/stylesheets/style.css')
  body
    block content
```


**index.pug:**

```
extends layout

block content
  h1= title
  p Welcome to #{title}
```

**error.pug:**

```
extends layout

block content
  h1= message
  h2= error.status
  pre #{error.stack}
```





Definicions:

  * shims
  * polyfills
  * transpilers


Preprocessadors HTML
--------------------

Preprocessadors CSS
-------------------


  * PostCSS: [https://postcss.org/]().
    - Autoprefixer: [https://github.com/postcss/autoprefixer]().

Preprocessadors Javascript
--------------------------

  * Babel


Referències
-----------

  * Motors de Plantilles
    - Pug (Jade): [https://pugjs.org]()
    - Handlebars: [https://handlebarsjs.com]()




