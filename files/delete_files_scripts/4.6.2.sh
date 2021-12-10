#!/bin/bash

set -e

DIRS="vendor/lox/xhprof/xhprof_html"
FILES="plugins/CoreVue/plugin.json
vendor/lox/xhprof/examples/sample.php
vendor/lox/xhprof/extension/Makefile.local
vendor/lox/xhprof/extension/config.m4
vendor/lox/xhprof/extension/php_xhprof.h
vendor/lox/xhprof/extension/xhprof.c
vendor/lox/xhprof/package.xml
vendor/lox/xhprof/scripts/xhprofile.php"
# SYMLINKS=""

# Delete files
for f in ${FILES}; do
  if [[ -f "${f}" ]]; then
    echo "Deleting file ${f}"
    rm "${f}"
  else
    echo "File ${f} has already been deleted"
  fi
done

# Delete symlinks
# for s in ${SYMLINKS}; do
#   if [[ -L "${s}" ]]; then
#     echo "Deleting symlink ${s}"
#     rm "${s}"
#   else
#     echo "Symlink ${s} has already been deleted"
#   fi
# done

# Delete directories
for d in ${DIRS}; do
  if [[ -d "${d}" ]]; then
    echo "Deleting directory ${d}"
    rm -rf "${d}"
  else
    echo "Directory ${d} has already been deleeted"
  fi
done

exit 0
