#!/bin/sh
# Writes the current date/time into the #ver span in index.html.
# Run by the pre-commit hook, so the stamp lands within seconds of the
# commit date — `git log --format='%h %cd' --date=format:'%Y.%m.%d.%H%M'`
# maps a stamp you see in the browser back to the commit that served it.
set -e

cd "$(dirname "$0")"
stamp=$(date +%Y.%m.%d.%H%M)

perl -pi -e 's{(<span id="ver">)[^<]*(</span>)}{${1}'"$stamp"'${2}}' index.html

echo "stamped $stamp"
