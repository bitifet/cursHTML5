#!/usr/bin/env bash
source "./etc/build_prefs.sh";

# Dependencies:
# -------------
# Not in NPM:
#   * pandoc: sudo apt-get install pandoc


abs_figures_path=$(realpath "$(dirname ${0})/../public/apunts/Figures");
rel_figures_path='../Figures';


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
        echo '<link rel="stylesheet" type="text/css" href="/apunts/markdown/styles.css" />';
        echo '<meta charset="utf-8" />'
        echo '<meta name="viewport" content="width=device-width, initial-scale=1">'
        echo '</head>'
        echo '<body>'
        echo
        cat "${f}" \
            | perl -pe "s#__FIGURES_PATH__#${rel_figures_path}#g" \
            | perl -pe "s/__NAV_LINK__//" \
            | pandoc -f markdown -t html -o -
        echo '</body>'
        echo '</html>'
    ) > "${html_path}/${baseName}.html"

    echo "  * ${baseName}.odt"
    cat "${f}" \
        | perl -pe "s#__FIGURES_PATH__#${abs_figures_path}#g" \
        | perl -ne "/__NAV_LINK__/ || print" \
        | pandoc -f markdown -t odt -o  "${odt_path}/${baseName}.odt"
done;
echo "";

