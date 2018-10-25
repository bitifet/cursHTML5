#!/usr/bin/env bash

# Dependencies:
# -------------
# In NPM: 
#   * pretty-js: npm install --save-dev pretty-js
#   * sass: npm install --save-dev sass

source "./etc/build_prefs.sh";

# Unbuild CSS:
echo "Unbuilding stylesheets:";
echo "  * ${css_path}";
sass "${css_path}" "${css_path}"

# Unbuild javascript:
jsfilelist=$(echo find ${js_path} \
    -not \\\( -path ${js_path}/lib/3rdParty -prune \\\) \
    -iname \'*.js\' \
    | bash # Jo som més caparrut que tu
);

echo "Unbuilding javascript:";
for f in ${jsfilelist}; do
    echo "  * ${f}";
    tmpFile=$(mktemp);
    pretty-js ${f} > ${tmpFile};
    cp ${tmpFile} ${f};
    rm ${tmpFile};
done;

