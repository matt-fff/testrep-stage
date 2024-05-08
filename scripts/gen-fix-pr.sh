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
testpath="./tests/test_range_pfd.py"
fixtemplate="./templates/range_pfd_fix.py"


git checkout -b "fix/${filename}"

echo "AHHH" >> "${path}"
git add "${path}"


rm -f "${testpath}"
cp "${fixtemplate}" "${testpath}"
git add "${testpath}"

git commit -m "add fix"
git push -f
gh pr create --title "Add fix ${filename}" --body "Test PR. Not a real thing."

git checkout main
