#cp -r dist/ docs/
#cp index.html docs/
#sed -i -e 's@/dist/@@g' docs/index.html
#rm docs/index.html-e

mkdir docs
cp -rf dist/ docs/dist/
cp index.html docs/