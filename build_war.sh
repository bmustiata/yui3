#!/usr/bin/env bash

#
# Clean up first the target
#
rm -fr target

#
# Compile first the YUI modules
#
cd src
shifter --walk --no-lint
cd ..

#
# Build the output structure.
#
mkdir target
mkdir target/yui-repository
cp -R war/* target/yui-repository
cp -R build target/yui-repository/yui3

#
# Archive the whole thing.
#
cd target/yui-repository
zip --recurse-paths ../yui-repository.war *
cd ../..

#
# Show success info.
#
echo "Built yui3-repository.war at: `pwd`/target/yui-repository.war"

