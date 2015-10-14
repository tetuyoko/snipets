#!/bin/sh

# run at under unity project
CURRENT_DIR=`pwd`
SCRIPT_DIR=`dirname $0`
cd $SCRIPT_DIR

cp ./unity/unity_gitignore $CURRENT_DIR/.gitignore
cp -r ./unity/unityeditorenhancements $CURRENT_DIR/Assets

cd $CURRENT_DIR
git init && git commit -am 'initial commit'

echo "done"
