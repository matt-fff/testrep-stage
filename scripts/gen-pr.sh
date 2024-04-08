#!/bin/sh

if ! command -v gh >/dev/null 2>&1; then
    echo "Install gh first"
    exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
    echo "You need to login: gh auth login"
    exit 1
fi

git checkout main

# Generate a random number between 1 and 100000
rand=$((RANDOM % 100000))
filename="changes.${rand}"
path="./arbitrary/${filename}"

git checkout -b ${filename}

echo "AHHH" >> "${path}"
git add "${path}"
git commit -m "add ${filename}"
git push

gh pr create --title "Add ${filename}" --body "Test PR. Not a real thing." --base origin/main --head ${filename}

git checkout main
