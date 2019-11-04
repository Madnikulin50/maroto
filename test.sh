#!/usr/bin/env bash
set -e
echo "" > coverage.txt
for d in $(go list ./... | grep -v vendor); do
    go test -coverprofile=profile.out -coverpkg=github.com/madnikulin50/maroto/pkg/pdf,github.com/madnikulin50/maroto/pkg/props,github.com/madnikulin50/maroto/internal $d
    if [ -f profile.out ]; then
        cat profile.out >> coverage.txt
        rm profile.out
    fi
done