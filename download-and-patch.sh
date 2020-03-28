#!/bin/bash
set -e

SNAPSHOT_PREFIX=-SNAPSHOT
FULL_VERSION=$(head -n 1 version.txt)
VERSION="${FULL_VERSION%$SNAPSHOT_PREFIX}"

rm -f openapi3.yml
rm -f openapi3-dart.yml
# wget "https://github.com/nemtech/symbol-openapi/releases/download/v$VERSION/openapi3.yml" -O openapi3.yml
wget "https://nemtech.github.io/symbol-openapi/openapi3.yml" -O openapi3.yml

cp openapi3.yml openapi3-dart.yml

OPEN_API_VERSION="$(yaml get openapi3-dart.yml info.version)"

if [ "$OPEN_API_VERSION" != "$VERSION" ]; then
    echo "Download open api version $OPEN_API_VERSION doesn't not match current version $VERSION !!!!"
    exit 1
fi

echo "Open api version $OPEN_API_VERSION has been downloaded"

for value in EmbeddedTransactionInfoDTO.properties.transaction \
              TransactionInfoDTO.properties.transaction \
              ResolutionEntryDTO.properties.resolved \
              ResolutionStatementBodyDTO.properties.unresolved \
              MetadataEntryDTO.properties.targetId \
              TransactionStatementBodyDTO.properties.receipts.items \
              AccountRestrictionDTO.properties.values.items; do
  echo $value
  yaml set openapi3-dart.yml "components.schemas.$value.type" object >tmp.yml
  cp tmp.yml openapi3-dart.yml
  yaml set openapi3-dart.yml "components.schemas.$value.anyOf" > tmp.yml
  cp tmp.yml openapi3-dart.yml
done

# Dart is using the string as number
#for value in Amount BlockDuration Difficulty Height Importance Score Timestamp RestrictionValue; do
#  echo $value
#  yaml set openapi3-dart.yml "components.schemas.$value.type" x-number-string >tmp.yml
#  cp tmp.yml openapi3-dart.yml
#done

sed -i '/anyOf: ''/d' openapi3-dart.yml

rm -f tmp.yml
