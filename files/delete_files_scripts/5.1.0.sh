#!/bin/bash

set -e

# https://github.com/matomo-org/matomo/issues/22300

DIRS="node_modules/jquery.dotdotdot"
# FILES=""
# SYMLINKS=""

# Delete files
# for f in ${FILES}; do
#   if [[ -f "${f}" ]]; then
#     echo "Deleting file ${f}"
#     rm "${f}"
#   else
#     echo "File ${f} has already been deleted"
#   fi
# done

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
    echo "Directory ${d} has already been deleted"
  fi
done

exit 0
