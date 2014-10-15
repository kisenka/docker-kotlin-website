#!/bin/sh

JEKYLL_TMP_DIR=/tmp/kotlin-api-docs
API_OUT_DIR=/data/_api-docs/latest/jvm
API_MODULE_NAME=stdlib

mkdir -p $JEKYLL_TMP_DIR $API_OUT_DIR

# Isolate Jekyyl installation
cp -r /data/{_data,_includes,_layouts,_plugins,_rake,assets,css,js,_config.yml} $JEKYLL_TMP_DIR

# Generate source docs
java -jar /scripts/dokka.jar \
    /kotlin/libraries/stdlib/src /kotlin/core/builtins -samples /kotlin/libraries/stdlib/test \
    -include /kotlin/libraries/stdlib/src/Module.md \
    -output $JEKYLL_TMP_DIR/api \
    -module $API_MODULE_NAME \

# Build static pages
jekyll build --source=$JEKYLL_TMP_DIR --destination=$JEKYLL_TMP_DIR/_site

# Copy to site source
\cp -rf $JEKYLL_TMP_DIR/_site/api/* $API_OUT_DIR
rm -rf $JEKYLL_TMP_DIR