#!/bin/bash
bundle-2.7 exec jekyll build
sed -i 's|https://kit.fontawesome.com/f7bad4bd2f.js|https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/all.js|g' _site/index.html
find _site \( -name '*.css' -o -name '*.html' -o -name '*.js' -o -name '*.json' -o -name '*.txt' -o -name '*.xml' -o -name '*.yml' \) -exec gzip --best --keep -f {} \;
rsync -Pvhr --delete _site/ server.internal:share/about/
