Curs HTML5 EBAP 2018
====================

Apunts i Diapositives del Curs Avançat d'HTML5 de l'EBAP (2018).

El directori `presentacio` d'aquest repositori conté el projecte *Express* amb
els apunts i les diapositives.

Els apunts es troben sota la ruta `public/apunts` agrupats en directoris segons
el format:

  * markdown (originals).
  * html (apunts online + comandament de les diapositives)
  * pdf (versió per als alumnes)
  * libreoffice (finalment no usats)

Les diapositives es troben sota 'views/slides' i es visualitzen des de l'arrel
del servidor (http://localhost:3000/).

Per a la resta hi ha un petit índex sota /mapa.html

Sota el directori bin, tenim els scripts build.sh que s'invoca amb 'npm run
build' o 'npm run build watch' (durant el desenvolupament). Aquest ens permet:

  * Ens permet fer servir SASS (scss) ubicant els fitxers sota el directori
    `views` (el css es crearà a la ruta indicada al fitxer de configuració).

  * Similarment, si colocam fitxers javascript (ES6+) sota `views` aquests es
    transpilaran amb destí a la mateixa ruta de `public`.

  * A més, en ambdós casos, els fitxers son minificats per tal d'estalviar
    ample de banda.


El script *unbuild.sh* (`npm run unbuild`) ens permet fer temporalment
llegibles els fitxers generats per poder inspeccionar el resultat.


Finalment *builddoc.sh* (`npm run builddoc`) és el responsable de generar els apunts.

He fet servir un script apart perquè aquest no procés no és tan "fi" com els
altres i tampoc s'ha implementat la funcionalitat de "watch".


**NOTA per als alumnes:** A qui li interessi, els fitxers "build.sh" i
"unbuild.sh" els teniu al directori de recursos i també ja copiats al projecte
*Express* de les pràctiques. Per que funcionin cal declarar-los al fitxer
*package.json*. Podeu consultar el d'aquest projecte a mode d'exemple.


-----------------------------------------------------------------------
PROGRAMA DE FORMACIÓ: Pla d'Entitats Locals 2018
NOM DEL CURS: HTML5 I CSS
CODIS: TIC0037-101

