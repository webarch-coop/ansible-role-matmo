#!/bin/bash

set -e

DIRS="plugins/CoreAdminHome/angularjs
plugins/CoreHome/angularjs/widget
plugins/CorePluginsAdmin/angularjs"
FILES="core/Updates/2.2.0-b15.php
plugins/CoreHome/angularjs/ajax-form/ajax-form.controller.js
plugins/CoreHome/angularjs/ajax-form/ajax-form.directive.js
plugins/CoreHome/angularjs/common/directives/dropdown-button.js
plugins/CoreHome/angularjs/common/directives/select-on-focus.js
plugins/CoreHome/angularjs/common/directives/show-sensitive-data.js
plugins/CoreHome/angularjs/common/directives/side-nav.js
plugins/CoreHome/angularjs/common/services/report-metadata-model.js
plugins/CoreHome/angularjs/common/services/reporting-pages-model.js
plugins/CoreHome/angularjs/content-intro/content-intro.directive.js
plugins/CoreHome/angularjs/content-table/content-table.directive.js
plugins/CoreHome/angularjs/field-array/field-array.controller.js
plugins/CoreHome/angularjs/field-array/field-array.directive.html
plugins/CoreHome/angularjs/field-array/field-array.directive.js
plugins/CoreHome/angularjs/field-array/field-array.directive.less
plugins/CoreHome/angularjs/multipairfield/multipairfield.controller.js
plugins/CoreHome/angularjs/multipairfield/multipairfield.directive.html
plugins/CoreHome/angularjs/multipairfield/multipairfield.directive.js
plugins/CoreHome/angularjs/multipairfield/multipairfield.directive.less
plugins/CoreHome/angularjs/period-selector/period-selector.controller.js
plugins/CoreHome/angularjs/period-selector/period-selector.directive.html
plugins/CoreHome/angularjs/period-selector/period-selector.directive.js
plugins/CoreHome/angularjs/period-selector/period-selector.directive.less
plugins/CoreHome/angularjs/popover-handler/popover-handler.directive.js
plugins/CoreHome/angularjs/progressbar/progressbar.directive.html
plugins/CoreHome/angularjs/progressbar/progressbar.directive.js
plugins/CoreHome/angularjs/progressbar/progressbar.directive.less
plugins/CoreHome/angularjs/quick-access/quick-access.controller.js
plugins/CoreHome/angularjs/quick-access/quick-access.directive.html
plugins/CoreHome/angularjs/quick-access/quick-access.directive.js
plugins/CoreHome/angularjs/quick-access/quick-access.directive.less
plugins/CoreHome/angularjs/report-export/reportexport.directive.js
plugins/CoreHome/angularjs/report-export/reportexport.popover.html
plugins/CoreHome/angularjs/report-export/reportexport.popover.less
plugins/CoreHome/angularjs/reporting-menu/reportingmenu-model.js
plugins/CoreHome/angularjs/reporting-menu/reportingmenu.controller.js
plugins/CoreHome/angularjs/reporting-menu/reportingmenu.directive.html
plugins/CoreHome/angularjs/reporting-menu/reportingmenu.directive.js
plugins/CoreHome/angularjs/reporting-page/reportingpage-model.js
plugins/CoreHome/angularjs/reporting-page/reportingpage.controller.js
plugins/CoreHome/angularjs/reporting-page/reportingpage.directive.html
plugins/CoreHome/angularjs/reporting-page/reportingpage.directive.js
plugins/CoreHome/angularjs/reporting-page/reportingpage.directive.less
plugins/CoreHome/angularjs/siteselector/siteselector-model.service.js
plugins/CoreHome/angularjs/siteselector/siteselector.controller.js
plugins/CoreHome/angularjs/siteselector/siteselector.directive.html
plugins/CoreHome/angularjs/siteselector/siteselector.directive.js
plugins/CoreHome/angularjs/siteselector/siteselector.directive.less
plugins/CoreHome/angularjs/sparkline/sparkline.component.js
plugins/CoreHome/angularjs/sparkline/sparkline.component.less
plugins/CoreHome/vue/src/Menudropdown/Menudropdown.adapter.ts
plugins/CoreHome/vue/src/Menudropdown/Menudropdown.less
plugins/CoreHome/vue/src/Menudropdown/Menudropdown.vue
plugins/TagManager/angularjs/importVersion/import-version.controller.js
plugins/TagManager/angularjs/importVersion/import-version.directive.html
plugins/TagManager/angularjs/importVersion/import-version.directive.js
vendor/matomo/device-detector/phpstan.neon
vendor/matomo/device-detector/.yamllint"
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
