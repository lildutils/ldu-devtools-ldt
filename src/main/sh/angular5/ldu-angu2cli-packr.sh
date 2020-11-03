#!/bin/bash

echo [LDU] ==================================================
echo [LDU] --- ldu-angu2cli-packr ---
echo [LDU] ==================================================
echo -n [LDU]  INFO: initialization

cd ..
echo -n .

$ng=$PWD/node_modules/.bin/ng
$ngDist=$1
if ["$ngDist"==""]; then
$ngDist=$PWD/_dist
fi
echo -n .

if [-d "$ngDist"]; then
rmdir "$ngDist"
fi
mkdir "$ngDist"
echo -n .

$ngc=$PWD/node_modules/.bin/ngc
echo -n .

echo OK
echo [LDU]  INFO: update...

npm prune
npm install
npm update

echo [LDU]  INFO: lint...

$ng lint --fix

echo [LDU]  INFO: pack...
echo [LDU]  INFO: project: $PWD

$ngc
cd $ngDist
ls
