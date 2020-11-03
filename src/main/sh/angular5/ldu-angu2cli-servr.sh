#!/bin/bash

echo [LDU] =======================================================
echo [LDU] --- ldu-angu2cli-servr ---
echo [LDU] =======================================================
echo -n [LDU]  INFO: initialization

cd ..
echo -n .

$ng=$PWD/node_modules/.bin/ng
$ngTarget=development
$ngEnvironment=$1
if ["$ngEnvironment"==""]; then
$ngEnvironment=prod
fi
echo -n .

echo OK
echo [LDU]  INFO: update...

npm prune
npm install
npm update

echo [LDU]  INFO: lint...

$ng lint --fix

echo [LDU]  INFO: serve...
echo [LDU]  INFO: project: $PWD
echo [LDU]  INFO: profile: $ngEnvironment

$ng serve --target=$ngTarget --environment=$ngEnvironment --open
