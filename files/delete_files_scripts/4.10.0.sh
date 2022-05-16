#!/bin/bash

set -e

DIRS="plugins/PrivacyManager/angularjs
plugins/Referrers/angularjs
plugins/ScheduledReports/angularjs
plugins/Transitions/angularjs
plugins/TwoFactorAuth/angularjs
plugins/UserCountry/angularjs
plugins/Widgetize/angularjs"
FILES="plugins/CoreHome/vue/src/MenuDropdown/MenuDropdown.adapter.ts
plugins/CoreHome/vue/src/MenuDropdown/MenuDropdown.less
plugins/CoreHome/vue/src/MenuDropdown/MenuDropdown.vue
plugins/ScheduledReports/templates/_addReport.twig
plugins/ScheduledReports/templates/_listReports.twig
plugins/SegmentEditor/angularjs/segment-generator/segmentgenerator-model.js
plugins/SegmentEditor/angularjs/segment-generator/segmentgenerator.directive.less
plugins/TwoFactorAuth/templates/_showRecoveryCodes.twig"
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
    echo "Directory ${d} has already been deleted"
  fi
done

exit 0
