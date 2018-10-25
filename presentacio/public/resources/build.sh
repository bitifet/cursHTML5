#!/usr/bin/env bash

# Dependencies:
# -------------
# In NPM: 
#   * babel-cli: npm install --save-dev babel-cli
#   * babel-preset-env: npm install --save-dev babel-preset-env
#   * sass: npm install --save-dev sass
# Not in NPM:
#   * Inotify: sudo apt-get install inotify-tools


mode="${1}";

source "./etc/build_prefs.sh";

function doSass() {
    rm "${css_path}";
    sass $1 -s compressed "${scss_src}" "${css_path}";
}

function doCssJs() {

    echo "Building css component controllers.";
    local cssjs_src=$(dirname "${scss_src}");
    local cssjs_path=$(dirname "${css_path}");

    function writeController() {
        if (
            (
                for f in $(find "${cssjs_src}" -type f -iname '*.js'); do
                        echo "(function(){";
                        cat $f
                        echo "})();";
                done;
            ) | babel \
                --compact true \
                --no-comments \
                --minified \
                > "${cssjs_path}/${css_controllers_file}"
        ); then
            echo "Updated ${cssjs_path}/${css_controllers_file}" >&2
        else
            echo "ERROR updating ${cssjs_path}/${css_controllers_file}" >&2
        fi;
    }

    writeController;
    if [ "$1" == "--watch" ]; then
        while true; do
            inotifywait -e modify, -e delete -r -qq "${cssjs_src}"
            sleep .5;
            writeController;
        done;
    fi;
}


function doBabel() {
    babel $1 --compact true --no-comments --minified "${js_src}" --out-dir "${js_path}"
}



if [ "${mode,,}" == "watch" ]; then
    if [ -z $(which inotifywait) ]; then
        echo "inotifywait required and not found!" >&2
        exit 1;
    fi;
    doBabel --watch &
    babelPID=$?
    doSass --watch &
    doSassPID=$?
    doCssJs --watch
    # Kill sass process after babel terminated.
    kill $babelPID $doSassPID
else
    doBabel
    doSass
    doCssJs
fi;

