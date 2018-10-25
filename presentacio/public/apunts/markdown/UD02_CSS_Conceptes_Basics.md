
```
－－－－－－－－－－－－－－－－－－－－－－－
ＵＤ０２  －  Ｃｏｎｃｅｐｔｅｓ  Ｂｓｉｃｓ
－－－－－－－－－－－－－－－－－－－－－－－
```

__NAV_LINK__[(⇧ Planificacio)](./Planificacio.html)

Índex
=====


<!-- vim-markdown-toc GitLab -->

* [Formularis](#formularis)
* [Fulls d'estil (CSS)](#fulls-destil-css)
    * [Conceptes bàsics (WIP)](#conceptes-bàsics-wip)
    * [Regles "AT" (@)](#regles-at-)
    * [Variables](#variables)
    * [Referències](#referències)
* [Javascript](#javascript)
    * [Història](#història)
    * [ECMASCRIPT](#ecmascript)
    * [Referències](#referències-1)

<!-- vim-markdown-toc -->



Formularis
==========


Fulls d'estil (CSS)
===================

  CSS - Cascade Style Sheets


:pushpin: **Nivells d'estandardització:**

  1. Editor's Draft (ED)
  2. Working Draft (WD)
  3. Transition – Last Call Working Draft (LCWD)
  4. Candidate Recommendation (CR)
  5. Transition – Proposed Recommendations (PR)
  6. Recommendation (REC)

**Font:** [https://css-tricks.com/css-standards-process/]()


Conceptes bàsics (WIP)
----------------------


![](__FIGURES_PATH__/NomenclaturaCSS_medium.png)


  * **Propietat:** Designa un paràmetre o característica que desitjam ajustar a
    l'element o elements seleccionats.

  * **Valor:** El valor que li volem assignar a una *propietat*.

  * **Declaració:** És el conjunt d'una *propietat* i el seu *valor*, separades
    per dos punts (":").

  * **Bloc de Declaracions:** És una llista d'una o més *declaracions*, separades
    per punt i coma (";"), i envoltes en claus ("{ ... }").

  * **Selector:** És una expressió que ens permet seleccionar un o varis
    elements del DOM als que volem aplicar un *bloc de declaracions*.

  * **Regla:** Es el conjunt format per un *selector* i un *bloc de declaracions*.
    - També pot tenir varis selectors separats per comes (",").

  * **"Multipropietats" (shorthand property):**
    - Ex: `font` = `font-style` + `font-weight` + `font-size` + `line-height` + `font-family`.
    - Ex: `margin` = `margin-top` + `margin-right` + `margin-bottom` + `margin-left`.
    - Acostumen guardar coherència:
      - Ex: Top - Right - Bottom - Left ("TRouBLe" / Des d'amunt i en sentit de
        les agulles del rellotge).
      - Valors per defecte "simètrics"
    - En cas de dubte, consultar documentació.
    - **Efecte col·lateral:** SEMPRE estableixen totes les propietats (encara que
      s'ometin).


Regles "AT" (@)
---------------



Variables
---------

Una variable CSS es defineix mitjançant una declaració a la qual, el nom de la
propietat comença per dos guions ("--").

**Exemple:**

```
--home_background_color: cyan;
```

Funcionen com una declaració normal i son heretades pels elements descendents
amb la única diferència que no tenen cap efecte per si mateixes.

Per llegir-les fem servir la funció `var()`.

**Exemple:


```
background-color: var(--home_background_color);
```






Referències
-----------


Javascript
==========

Història
--------

ECMASCRIPT
----------

Referències
-----------


\newpage


