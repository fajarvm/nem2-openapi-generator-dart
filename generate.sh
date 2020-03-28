#!/usr/bin/env bash
#######################
####### configs #######
#######################
## Dart generator: dart | dart-dio | dart-jaguar
DART_GENERATOR="dart"

## The custom template directory for Dart2
TEMPLATE_DIR="dart2-template"

## Source folder for generated code as defined in the 'openapi-dart-config.yml'
SOURCE_FOLDER="lib/src/sdk/infrastructure"

## OpenAPI custom configuration file
OPENAPI_CONFIG_FILE="openapi-dart-config.yml"

## OpenAPI definition file name
OPENAPI_DEFINITION_FILE="openapi3-dart.yml"

#########################
####### operation #######
#########################
## Download Symbol OpenAPI definition
## Symbol OpenAPI v3: https://github.com/nemtech/symbol-openapi/
# curl -o $OPENAPI_DEFINITION_FILE https://nemtech.github.io/symbol-openapi/openapi3.yml

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
echo "Generating '$DART_GENERATOR' code. Definition: '$OPENAPI_DEFINITION_FILE'. Custom config: '$OPENAPI_CONFIG_FILE'"

openapi-generator generate \
 -g $DART_GENERATOR \
 -i $OPENAPI_DEFINITION_FILE \
 -c $OPENAPI_CONFIG_FILE \
 --generate-alias-as-model \
 --enable-post-process-file
# -t $TEMPLATE_DIR

#######################
###### clean-up #######
#######################
## Move generated files to the correct source folder. For some reasons, the generator creates
## an extra 'lib' folder and puts all of the generated code in there.
# OUTPUT_LIB_FOLDER="$SOURCE_FOLDER/lib"
# mv $OUTPUT_LIB_FOLDER/* $SOURCE_FOLDER && rmdir $OUTPUT_LIB_FOLDER
