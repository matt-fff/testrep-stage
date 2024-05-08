#!/bin/sh

# Check if a command-line argument was provided
if [ $# -eq 0 ]
then
    echo "You must provide "pass" or "fail" as a param"
    exit 1
else
  # If an argument was provided, set the value of X to the argument
  param=$1
fi


if [[ "${param}" != "pass" && "${param}" != "fail" ]]; then
    echo "Error: Invalid value. The param must be either 'pass' or 'fail'."
    exit 1
fi

filename="file_$(date +%Y-%m-%dT%H:%M:%S).txt"
path="./passfail/${filename}"

echo "${param}" > "${path}"

