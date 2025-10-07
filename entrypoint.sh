#!/bin/bash
set -e

if [ $# -eq 0 ]; then
    echo "first parameter must be the notebook file"
    exit 1
fi

notebook_filename="${1%.ipynb}"
notebook_file="$notebook_filename.ipynb"

if [ ! -f "$notebook_file" ]; then
    echo "'$notebook_file' not found"
    exit 1
fi

jupyter nbconvert "$notebook_file" --to pdf > /dev/null

output_file="$notebook_filename.pdf"
if [ -f "$output_file" ]; then
    echo -e "\n✓ Success! PDF created: $output_file"
fi
