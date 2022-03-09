#!/bin/bash

set -e

DIRS="plugins/CoreAdminHome/angularjs
plugins/SitesManager/angularjs
plugins/TagManager/angularjs/selectVariable
plugins/UsersManager/angularjs"
FILES="plugins/CorePluginsAdmin/vue/src/PluginSettings/PluginSetting.vue
plugins/SitesManager/templates/dialogs/dialogs.html
plugins/SitesManager/templates/dialogs/remove-dialog.html
plugins/SitesManager/templates/global-settings.html
plugins/SitesManager/templates/help/excluded-ip-help.html
plugins/SitesManager/templates/help/excluded-query-parameters-help.html
plugins/SitesManager/templates/help/excluded-user-agents-help.html
plugins/SitesManager/templates/help/timezone-help.html
plugins/SitesManager/templates/index.html
plugins/SitesManager/templates/loading.html
plugins/SitesManager/templates/sites-list/add-entity-dialog.html
plugins/SitesManager/templates/sites-list/add-site-link.html
plugins/SitesManager/templates/sites-list/site-fields.html
plugins/SitesManager/templates/sites-list/site-search-field.html
plugins/SitesManager/templates/sites-list/sites-list.html
plugins/SitesManager/templates/sites-manager-header.html
plugins/TagManager/angularjs/form-field/field-variable-template.less
plugins/TagManager/angularjs/importVersion/import-version.controller.js
plugins/TagManager/angularjs/importVersion/import-version.directive.html
plugins/TagManager/angularjs/importVersion/import-version.directive.js
plugins/TagManager/angularjs/manageTag/edit.controller.js
plugins/TagManager/angularjs/manageTag/edit.directive.html
plugins/TagManager/angularjs/manageTag/edit.directive.js
plugins/TagManager/angularjs/manageTag/edit.directive.less
plugins/TagManager/angularjs/manageTag/list.controller.js
plugins/TagManager/angularjs/manageTag/list.directive.html
plugins/TagManager/angularjs/manageTag/list.directive.js
plugins/TagManager/angularjs/manageTag/manage.controller.js
plugins/TagManager/angularjs/manageTag/manage.directive.html
plugins/TagManager/angularjs/manageTag/manage.directive.js
plugins/TagManager/angularjs/manageTag/model.js
plugins/TagManager/angularjs/manageTrigger/edit.controller.js
plugins/TagManager/angularjs/manageTrigger/edit.directive.html
plugins/TagManager/angularjs/manageTrigger/edit.directive.js
plugins/TagManager/angularjs/manageTrigger/list.controller.js
plugins/TagManager/angularjs/manageTrigger/list.directive.html
plugins/TagManager/angularjs/manageTrigger/list.directive.js
plugins/TagManager/angularjs/manageTrigger/manage.controller.js
plugins/TagManager/angularjs/manageTrigger/manage.directive.html
plugins/TagManager/angularjs/manageTrigger/manage.directive.js
plugins/TagManager/angularjs/manageTrigger/model.js
plugins/TagManager/angularjs/manageVariable/edit.controller.js
plugins/TagManager/angularjs/manageVariable/edit.directive.html
plugins/TagManager/angularjs/manageVariable/edit.directive.js
plugins/TagManager/angularjs/manageVariable/list.controller.js
plugins/TagManager/angularjs/manageVariable/list.directive.html
plugins/TagManager/angularjs/manageVariable/list.directive.js
plugins/TagManager/angularjs/manageVariable/manage.controller.js
plugins/TagManager/angularjs/manageVariable/manage.directive.html
plugins/TagManager/angularjs/manageVariable/manage.directive.js
plugins/TagManager/angularjs/manageVariable/model.js
plugins/TagManager/angularjs/selectVariableType/select-variable-type.controller.js
plugins/TagManager/angularjs/selectVariableType/select-variable-type.directive.html
plugins/TagManager/angularjs/selectVariableType/select-variable-type.directive.js
plugins/TagManager/angularjs/selectVariableType/select-variable-type.directive.less"
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
