#!/bin/bash

echo [LDU] ==================================================
echo [LDU] --- ldu-angu2cli-buildr ---
echo [LDU] ==================================================
echo -n [LDU]  INFO: initialization

cd ..
echo -n .

$ng=$PWD/node_modules/.bin/ng
$ngTarget=production
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

echo [LDU]  INFO: build...

$ng build --target=$ngTarget --environment=$ngEnvironment --build-optimizer

echo [LDU]  INFO: project: $PWD
echo [LDU]  INFO: profile: $ngEnvironment
