
UD03 - Posicionament i Ancoratge
================================

__NAV_LINK__[(⇧ Planificacio)](./Planificacio.html)


Índex
=====


<!-- vim-markdown-toc GitLab -->

* [Posicionament i ancoratge](#posicionament-i-ancoratge)
    * [Tipus de posicionament](#tipus-de-posicionament)
        * [static](#static)
        * [relative](#relative)
        * [absolute](#absolute)
        * [fixed](#fixed)
        * [sticky](#sticky)
    * [Ancoratge dels elements](#ancoratge-dels-elements)
    * [Model de Capes](#model-de-capes)
        * [La propietat *z-index*](#la-propietat-z-index)
        * [El *stacking context*](#el-stacking-context)
    * [Model de Caixa (Box Model)](#model-de-caixa-box-model)
        * [Propietat `box-sizing`](#propietat-box-sizing)
            * [Establir el box-sizing de forma global (WIP)](#establir-el-box-sizing-de-forma-global-wip)
    * [Marges](#marges)
        * [Marges negatius](#marges-negatius)
        * [Marges colapsats](#marges-colapsats)
    * [Voreres](#voreres)
* [Javascript - Components CSS](#javascript-components-css)
    * [CSS Modular](#css-modular)
    * [Components Javascript/jQuery + CSS](#components-javascriptjquery-css)

<!-- vim-markdown-toc -->



  * CSS - Posicionament i Ancoratge
  * Javascript - Components CSS


Posicionament i ancoratge
=========================


Tipus de posicionament
----------------------

La propietat `position` estableix la forma en que es posicionen els elements
dins el document i pot agafar els següents valors:


### static

  * És el valor per defecte.

  * L'element es posiciona d'acord al flux normal del document.

  * Les propietats *top*, *right*, *bottom*, *left* i *z-index* no ténen efecte
    amb aquest tipus de posicionament.

  * Es diu que els elements amb *posítion = static* **no estan posicionats**.

### relative

  * Com amb *static*, l'element es posiciona d'acord al flux normal del
    document.

  * Les propietats *top*, *right*, *bottom* i *left* el desplacen de la seva
    posició natural **però les posicions dels altres elements no es veuen
    afectats**.

  * Els valors de *z-index* distints de "auto" crearàn un nou "context
    d'amuntegament" o *stacking context*.

### absolute

  * L'element s'elimina del flux normal del document (ja no es crea un espaï per a ell).

  * És posicionat, mitjançant les propietats *top*, *right*, *bottom* i *left*,
    en relació al seu ancestre posicionat més proper o, si no n'hi ha cap,
    relatiu al contenidor inicial.

  * Els valors de *z-index* distints de "auto" crearàn un nou "context
    d'amuntegament" o *stacking context*.


### fixed

  * L'element s'elimina del flux normal del document (ja no es crea un espaï per a ell).

  * És posicionat, mitjançant les propietats *top*, *right*, *bottom* i *left*,
    en relació al contenidor inicial.

  * Sempre crea un nou *stacking context*.

  * En documents impresos (@media print) apareix a totes les pàgines i sempre a
    la mateixa posició.


### sticky


  * De recent introducció (pot no funcionar en alguns navegadors).

  * L'element es posiciona d'acord al flux normal del document. Però si el
    document (o un subcontenidor) es desplaça de manera que l'element anés a
    quedar ocult, es "desenganxa" quedant-se fitxat a un *offset* determinat.

  * No funciona en elements en que la propietat *overflow* valgui *hidden* o *auto*.



Ancoratge dels elements
-----------------------

La propietat "display" especifica el comportament de l'element en relació als
elements que l'envolten i als que conté.

El seu valor per defecte depèn del tipus d'element: Per exemple, per a un `div`
és "block" mentre que per un `span` és "inline".

De fet aquests dos son els seus possibles valors més elementals:

  * `inline`: L'element s'integra "en línia" amb els altres elements. Les seves
    dimensions s'adapten al contingut (els atributs *width* i *height* no ténen
    cap efecte).
  * `block`: Mostra l'element com un bloc que comença en una nova línia i agafa
    tota l'amplada disponible i l'alçada necessària per allotjar el contingut a
    no ser que les fixem amb les propietats *width* i *height*,
    respectivament..

Addicionalment tenim un tercer valor que és una combinació dels dos anteriors:

  * `inline-block`: Que flueix igual que els elements *inline* però permet
    fixar les seves dimensions (comportant-se, de portes endins, com un element
    de bloc).

N'hi ha bastantes més, com *flex* i *grid* de les que parlarem més endavant.
Però aquestes son les més essencials i, juntament amb *flex* i *grid*, les
úniques que manejarem en la majoria dels casos.



Model de Capes
--------------

Quan activam el posicionament (*position* distint de *static*), els elements es
poden moure (*relative*) del lloc que ténen assignat o fins i tot deixar
d'ocupar cap espaï pel que fa al flux normal del contingut (*absolute*,
*fixed*...).

Això fa que puguin sol·lapar-se amb altres.

Per decidir quin element es dibuixa a sobre de quin altre tenim una regla molt
senzilla: **El que apareix més avall al DOM es pinta davant**. És a dir: van
"trepitjant-se" a mida que es renderitzen.

### La propietat *z-index*

De vegades això no és suficient i necessitam poder definir quins elements
cobriran quins...

Per això tenim la propietat *z-index*:

  * El valor per defecte de la propietat *z-index* és "auto", que significa que
    els elements seguiran la regla anterior.

  * Però *z-index* també pot agafar un valor numèric enter.

  * Els elements amb z-index positíu o zero es situaran per sobre dels que
    ténen *z-index* "auto" i més al front com més elevat sigui el seu valor.

  * Els elements amb z-index negatiu es situaran per davall fins i tot dels
    elements no posicionats i més avall com menor sigui el seu valor.


### El *stacking context*

Sempre que assignam un valor distint de "auto" a la propietat "z-index" (o el
tipus de posicionament és un dels que ja hem indicat que el creen sempre), es
crearà un nou *Stacking Context* en relació a l'element.

Això vol dir que tots els elements que contengui podràn intercalar-se entre
ells segons les regles anteriors, però **cap element exterior podrà
intercalar-se entre dos d'ells**.

Per aquest motiu no és recomanable abusar de la propietat *z-index*.



Model de Caixa (Box Model)
--------------------------

![](__FIGURES_PATH_RIGHT__/boxmodel.gif)



Font: [https://www.w3schools.com/css/css_boxmodel.asp]()

### Propietat `box-sizing`

Estableix què mesuren les propietats `height`, `width` i derivades
(`min-height`, `max-height`, ...).

Sense comptar `initial` (que en aquest cas equivaldria a `content-box` i
`inherit`, la propietat `box-sizing` pot agafar dos valors:

  * content-box.

  * border-box.


Així, quan està establerta a `content-box` (per defecte), `height`, `width`,
etc... defineixen el tamany del contingut. **Per això, si afegim voreres,
marges o, fins i tot *padding*, l'element ens ocuparà més espaï del que hem
especificat**.


En canvi, si l'establim a `border-box` aquesta mesura inclourà també el
*padding* i les vores (*border*), fent molt més senzilla la tasca de sumar els
espaïs que ens ocupa cada element a l'hora de maquetar.


>
**⚠ Avís:** Així i tot, encara haurem de tenir en compte els marges, si en tenim.
>


#### Establir el box-sizing de forma global (WIP)


Si ho preferim, podem establir el `box-sizing` a `border-box` de forma global
amb una senzilla regla:

```
*,
::before,
::after {
  box-sizing: border-box; 
}
```


>
:bomb: Però si estam treballant en un projecte preexistent, podria passar que
tinguéssim codi css anterior que, al estar calculat segons el comportament per
defecte, deixas de funcionar corrèctament.
>
El mateix ens pot passar si fem servir frameworks css externs que hagin estat
dissenyats en base a `border-sizing: content-box`. Si be molts, com *Bootstrap*
ja fan servir `border-box` i/o fixen explícitament aquesta propietat per al seu
css.
>

En qualsevol cas, el següent exemple ens mostra una forma més refinada de fer-ho:

```
:root {
  box-sizing: border-box;
}

*,
::before,
::after {
  box-sizing: inherit;
}
```

Establint `box-sizing` a `inherit` obrim la possibilitat de canviar aquesta
propietat recursivament de forma selectiva a les parts que ens interessi del
DOM (per exemple `.oldCss {box-sizing: content-box;}`) mentre que la regla que
hem definit sobre el selector `:root` ens garanteix que la resta heredarà el
valor `border-box`.





Marges
------

### Marges negatius


### Marges colapsats


**Casos en que els marges no colapsen:**


  * Establint la propietat `overflow` a qualsevol valor distint de `visible` a
    un contenidor s'evita que els marges interiors colapsin amb els exteriors.

  * Si hi ha una vorera (border) entre dos marges (per exemple transparent, si
    la volem fer servir com a truc per evitar el colapsament).

  * Cap a fora d'un contenidor dels següents contenidors:
    - Flotant ("floated")
    - Amb la propietat `display` a `inline-block`.
    - Amb posicionament absolut (`position: absolute`) o fix (`position: fixed`)

  * A dins d'un contenidor flexbox (`display: flex`) o grid (`display: grid`).

  * Els elements amb `display: table-cell`, `table-row` i la majoria de la
    resta de tipus de display de taules a excepció de `table`, `table-inline` i
    `table-caption` no tenen marges, així que no poden colapsar.



Voreres
-------





Javascript - Components CSS
===========================

CSS Modular
-----------

Components Javascript/jQuery + CSS
----------------------------------

