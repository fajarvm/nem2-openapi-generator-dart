#!/usr/bin/env bash

## The custom template directory for Dart2
TEMPLATE_DIR="./dart2-template"

## Source folder for generated code as defined in the 'openapi-config.yml'
SOURCE_FOLDER="./lib/src/sdk/infrastructure"

## Download NEM2 OpenAPI definition
## NEM2 OpenAPI v3: https://github.com/nemtech/nem2-openapi/
curl -O https://nemtech.github.io/nem2-openapi/openapi3.yml

OPENAPI_DEFINITION_FILE="./openapi3.yml"

## Install openapi-generator CLI
## Dart generator issue: https://github.com/OpenAPITools/openapi-generator/pull/3656
brew list openapi-generator || brew install openapi-generator

## Generate DTO files
##
## Param: -c path/to/config.yml
## Uses the configuration file to configure package names, prefixes, model source, etc.
## The configuration file can be JSON or YML formatted.
##
## Param: --generate-alias-as-moodel
## Generates alias as model
##
## Param: --enable-post-process-file
## Enables post processing. Make sure the environment variable DART_POST_PROCESS_FILE is defined.
## For example: export DART_POST_PROCESS_FILE="/usr/local/bin/dartfmt -w"
##
## Param: -t path/to/custom_template_dir
## Uses the custom template when generating the code.
openapi-generator generate \
 -g dart-dio \
 -i $OPENAPI_DEFINITION_FILE \
 -c openapi-config.yml \
 --generate-alias-as-model \
 --enable-post-process-file
# -t $TEMPLATE_DIR

## Move generated files to the correct source folder. For some reasons, the generator creates
## an extra 'lib' folder and puts all of the generated code in there.
OUTPUT_LIB_FOLDER="$SOURCE_FOLDER/lib"
mv $OUTPUT_LIB_FOLDER/* $SOURCE_FOLDER && rmdir $OUTPUT_LIB_FOLDER
