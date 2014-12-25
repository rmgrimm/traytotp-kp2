#!/bin/bash

SOURCE_DIR=$(cd "$(dirname "$BASH_SOURCE[0]}")" && pwd -L)
PLGX_BUILD_DIR="$SOURCE_DIR/build-plgx"

mkdir -p -- "$PLGX_BUILD_DIR"

cp -R -- "$SOURCE_DIR"/{Libraries/,Properties/,Resources/,*.cs,*.csproj,*.ico,*.resx,version_manifest.txt} "$PLGX_BUILD_DIR"
keepass2 --plgx-create "$PLGX_BUILD_DIR"
rm -rf -- "$PLGX_BUILD_DIR"

if [ -e "$SOURCE_DIR"/build-plgx.plgx ]; then
    mv "$SOURCE_DIR"/build-plgx.plgx "$SOURCE_DIR"/TrayTOTP.plgx
    echo Successfully generated "$SOURCE_DIR"/TrayTOTP.plgx
fi
