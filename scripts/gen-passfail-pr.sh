#!/bin/sh

if ! command -v gh >/dev/null 2>&1; then
    echo "Install gh first"
    exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
    echo "You need to login: gh auth login"
    exit 1
fi

# Check if a command-line argument was provided
if [ $# -eq 0 ]
then
    echo "You must provide "pass" or "fail" as a param"
    exit 1
else
  # If an argument was provided, set the value of X to the argument
  param=$1
fi

git checkout main

source ./scripts/gen-passfail-file.sh "${param}"

git checkout -b "${param}/${filename}"
git add "${path}"

git commit -m "add ${param}"
git push -f
gh pr create --title "Add ${param} ${filename}" --body "Test PR. Not a real thing."

git checkout main
