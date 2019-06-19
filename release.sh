#!/usr/bin/env bash

rm -rf build dist
mkdir build dist

git clone .git --branch gh-pages dist

cp ./CNAME dist/CNAME
cp ./assets/index.html dist/index.html
cp -r ./assets/fonts dist/fonts

"$(npm bin)/elm" make src/Main.elm --optimize --output build/elm.js || exit
"$(npm bin)/uglifyjs" build/elm.js --compress "pure_funcs=[F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9],pure_getters,keep_fargs=false,unsafe_comps,unsafe" | "$(npm bin)/uglifyjs" --output build/elm.min.js --mangle || exit
"$(npm bin)/babel" src/index.js --presets=@babel/env > build/index.js || exit
echo -e "\n\n" | cat build/elm.min.js - build/index.js > build/scripts.js || exit
"$(npm bin)/uglifyjs" build/scripts.js --compress --mange --output dist/scripts.js || exit

pushd dist || exit
git add --all
git commit -m "Release v$(date -u +%FT%TZ)" --amend
git push origin gh-pages -f

popd || exit
git push origin gh-pages -f
