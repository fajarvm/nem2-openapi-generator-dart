#!/usr/bin/env bash

TEMPLATE_DIR="./dart2-template"
NEM2_API_DIR="./lib/src/infrastructure/"
NEM2_API_MODEL_DIR=$NEM2_API_DIR"model/"

## Download NEM2 OpenAPI definition
## OpenAPI v3: https://raw.githubusercontent.com/nemtech/nem2-openapi/master/spec/openapi3.yaml
## Dart generator issue: https://github.com/OpenAPITools/openapi-generator/pull/3656
#curl -O https://raw.githubusercontent.com/nemtech/nem2-openapi/master/spec/openapi3.yaml

#OPENAPI_DEFINITION_FILE="openapi3.yaml"
OPENAPI_DEFINITION_FILE="openapi3-anyOf-fix.yaml"

## Install openapi-generator CLI
brew list openapi-generator || brew install openapi-generator
## Install RPL tool
#brew list rpl || brew install rpl

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
 -g dart \
 -i ./$OPENAPI_DEFINITION_FILE \
 -c openapi-config.yml \
 --generate-alias-as-model
# -t $TEMPLATE_DIR

## TODO: clean-up the code below when they are no longer in use for development.
### Create a new api library file
#FILE=$NEM2_API_DIR"model.dart"
#touch $FILE
#cat <<EOM >$FILE
#library nem2_sdk_dart.infrastructure.model;
#
#EOM
#
### Add all model files as part of the library
#for filename in "$NEM2_API_MODEL_DIR"*.dart; do
#    [ -e "$filename" ] || continue
#        # Replace package name using rpl text replacement tool
#        rpl -iw 'nem2_sdk_dart.api;' 'nem2_sdk_dart.infrastructure.model;' "$filename"
#
#        # Include file as part of the model package
#        basename "$filename";
#        f="$(basename -- "$filename")";
#        printf "part 'model/%s';\n" "$f" >> $FILE;
#done
