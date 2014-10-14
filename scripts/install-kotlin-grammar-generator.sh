#!/bin/sh

GRAMMAR_GENERATOR_URL=https://github.com/JetBrains/kotlin-grammar-generator/releases/download/v0.2/kotlin-grammar-generator.tar.gz

wget $GRAMMAR_GENERATOR_URL && \
tar -xzf ./kotlin-grammar-generator.tar.gz && \
rm ./kotlin-grammar-generator.tar.gz