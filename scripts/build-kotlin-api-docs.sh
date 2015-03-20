#!/bin/sh

JEKYLL_TMP_DIR=/tmp/kotlin-api-docs
API_OUT_DIR=/data/_api-docs/latest/jvm/stdlib
API_MODULE_NAME=stdlib
API_DOCS_SRC_URL=https://teamcity.jetbrains.com/guestAuth/repository/download/Kotlin_StandardLibraryDocumentation/421865:id/stdlib-docs.zip

mkdir -p $JEKYLL_TMP_DIR $API_OUT_DIR

# Download docs sources
wget -O $JEKYLL_TMP_DIR/api-docs.zip $API_DOCS_SRC_URL
unzip $JEKYLL_TMP_DIR/api-docs.zip -d $JEKYLL_TMP_DIR/api

# Isolate Jekyyl installation
cp -r /data/{_data,_includes,_layouts,_plugins,_rake,assets,css,js,_config.yml} $JEKYLL_TMP_DIR

# Build static pages
jekyll build --source=$JEKYLL_TMP_DIR --verbose --destination=$JEKYLL_TMP_DIR/_site

# Copy to site source
\cp -rf $JEKYLL_TMP_DIR/_site/api/* $API_OUT_DIR
rm -rf $JEKYLL_TMP_DIR