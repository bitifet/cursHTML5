#!/usr/bin/env bash
source "./etc/build_prefs.sh";

# Dependencies:
# -------------
# Not in NPM:
#   * pandoc: sudo apt-get install pandoc


abs_figures_path=$(realpath "$(dirname ${0})/../public/images/figures");
rel_figures_path='../../images/figures';
url_figures_path='http://localhost:3000/images/figures';


function utfIcons() {
  cat \
      | perl -pe 's/:warning:/⚠ /g' \
      | perl -pe 's/:point-right:/☞/g' \
      | perl -pe 's/:pushpin:/📌/g' \
      | perl -pe 's/:bomb:/💣/g' \
  ;
};

function enhanceImages() {
  cat \
    | perl -pe "s#^(.*?)__FIGURES_PATH_RIGHT__(.*)\$#<div class='img right'>\$1${1}\$2</div>#g" \
    | perl -pe "s#^(.*?)__FIGURES_PATH_LEFT__(.*)\$#<div class='img left'>\$1${1}\$2</div>#g" \
    | perl -pe "s#^(.*?)__FIGURES_PATH_BIG_LEFT__(.*)\$#<div class='img big left'>\$1${1}\$2</div>#g" \
    | perl -pe "s#^(.*?)__FIGURES_PATH_BIG_RIGHT__(.*)\$#<div class='img big right'>\$1${1}\$2</div>#g" \
    | perl -pe "s#^(.*?)__FIGURES_PATH_SMALL_LEFT__(.*)\$#<div class='img small left'>\$1${1}\$2</div>#g" \
    | perl -pe "s#^(.*?)__FIGURES_PATH_SMALL_RIGHT__(.*)\$#<div class='img small right'>\$1${1}\$2</div>#g" \
    | perl -pe "s#^(.*?)__FIGURES_PATH_BIG__(.*)\$#<div class='img big'>\$1${1}\$2</div>#g" \
    | perl -pe "s#^(.*?)__FIGURES_PATH_SMALL__(.*)\$#<div class='img small'>\$1${1}\$2</div>#g" \
    | perl -pe "s#^(.*?)__FIGURES_PATH__(.*)\$#<div class='img'>\$1${1}\$2</div>#g" \
    | perl -pe "s#__CLEARFIX__#<div class='clearfix'></div>#g" \
  ;
}



echo "Compiling stylesheet..."
sass -s compressed ./views/stylesheets/apunts.scss ./public/stylesheets/apunts.css;
echo "  * apunts.css"
echo "";

echo "Exporting markdown..."
for f in $(find "${markdown_path}" -type f -iname '*.md'); do
    fileName=$(basename "${f}");
    baseName="${fileName%.*}"
    echo "  * ${baseName}.html"
    ( \
        echo '<!DOCTYPE HTML>'
        echo '<html>'
        echo '<head>'
        echo "<title>${baseName}</title>"
        echo '<link rel="stylesheet" type="text/css" href="/stylesheets/apunts.css" />';
        echo '<meta charset="utf-8" />'
        echo '<meta name="viewport" content="width=device-width, initial-scale=1">'
        echo '</head>'
        echo '<body>'
        echo
        cat "${f}" \
            | enhanceImages "${rel_figures_path}" \
            | perl -pe "s/__NAV_LINK__//" \
            | pandoc -f markdown -t html -o - \
            | utfIcons \
        ;
        echo '<footer>'
        echo '<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Llicència de Creative Commons" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a>'
        echo '</footer>'
        echo '<script src="/javascripts/jquery-3.3.1.min.js"></script>'
        echo '<script src="/javascripts/remote_controller.js"></script>'
        echo '</body>'
        echo '</html>'
    ) > "${html_path}/${baseName}.html"

    echo "  * ${baseName}.odt"
    ( \
        cat "${f}" \
            | enhanceImages "${abs_figures_path}" \
            | perl -ne "/__NAV_LINK__/ || print" \
            | perl -ne "/\\/setslide\\// || print" \
            | utfIcons \
        ;
    ) | pandoc \
        -f markdown \
        -c ./public/stylesheets/apunts.css \
        -t odt \
        -o "${odt_path}/${baseName}.odt" \
    ;

    echo "  * ${baseName}.pdf"
    ( \
        echo '<!DOCTYPE HTML>'
        echo '<html>'
        echo '<head>'
        echo "<title>${baseName}</title>"
        echo '<meta charset="utf-8" />'
        echo '<meta name="viewport" content="width=device-width, initial-scale=1">'
        echo '</head>'
        echo '<body>'
        echo '<div id="contents">'
        echo
        cat "${f}" \
            | enhanceImages "${url_figures_path}" \
            | perl -ne "/__NAV_LINK__/ || print" \
            | perl -ne "/\\/setslide\\// || print" \
            | utfIcons \
        ;
        echo '</div>'
        echo '<footer>'
        echo '<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Llicència de Creative Commons" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a>'
        echo '</footer>'
        echo '<style>'
        echo 'table {'
        echo '  width: 100%;'
        echo '}'
        echo '#contents {'
        echo '  position: relative;'
        echo '  z-index: 10;'
        echo '}'
        echo 'footer {'
        echo '  z-index: 1;'
        echo '  display: block;'
        echo '  position: fixed;'
        echo '  bottom: 0;'
        echo '  right: 0;'
        echo '  overflow: display;'
        echo '  opacity: .5;'
        echo '}'
        echo ''
        echo '.content-block, p {'
        echo '  page-break-inside: avoid;'
        echo '}'
        echo 'pre {'
        echo '  max-height: none !important;'
        echo '}'
        echo ''
        echo 'html, body {'
        echo '  width: 210mm;'
        echo '  height: 297mm;'
        echo '}'
        echo '</style>'
        echo '<script src="/javascripts/jquery-3.3.1.min.js"></script>'
        echo '<script src="/javascripts/remote_controller.js"></script>'
        echo '</body>'
        echo '</html>'
    ) \
        | pandoc -f markdown -t html -o - \
        > "${pdf_path}/${baseName}.html" \
    ;

    md-to-pdf \
        --stylesheet ./public/stylesheets/apunts.css \
        "${pdf_path}/${baseName}.html" \
        "${pdf_path}/${baseName}.pdf" \
        2>/dev/null \
    ;

    rm "${pdf_path}/${baseName}.html";

done;
echo "";


