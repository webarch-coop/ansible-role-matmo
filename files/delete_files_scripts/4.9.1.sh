#!/bin/bash

set -e

DIRS="plugins/CoreVisualizations/angularjs
plugins/CustomDimensions/angularjs
plugins/Dashboard/angularjs
plugins/GeoIp2/angularjs
plugins/Goals/angularjs
plugins/LanguagesManager/angularjs
plugins/Live/angularjs
plugins/Marketplace/angularjs"
FILES="plugins/CoreHome/vue/src/lazyInitSingleton.ts
plugins/Goals/templates/_formAddGoal.twig
plugins/Goals/templates/_listGoalEdit.twig
plugins/Marketplace/templates/paid-plugins-install-list.twig
plugins/MobileMessaging/angularjs/delegate-mobile-messaging-settings.controller.js
plugins/MobileMessaging/angularjs/manage-mobile-phone-numbers.controller.js
plugins/MobileMessaging/angularjs/manage-sms-provider.controller.js
plugins/MobileMessaging/angularjs/sms-provider-credentials.directive.js
plugins/MultiSites/angularjs/dashboard/dashboard-model.service.js
plugins/MultiSites/angularjs/dashboard/dashboard.directive.less
plugins/MultiSites/angularjs/site/site.controller.js
plugins/MultiSites/angularjs/site/site.directive.html
plugins/MultiSites/angularjs/site/site.directive.js
plugins/PrivacyManager/angularjs/anonymize-ip/anonymize-ip.controller.js
plugins/PrivacyManager/angularjs/anonymize-log-data/anonymize-log-data.controller.js
plugins/PrivacyManager/angularjs/anonymize-log-data/anonymize-log-data.directive.html
plugins/PrivacyManager/angularjs/anonymize-log-data/anonymize-log-data.directive.js
plugins/PrivacyManager/angularjs/anonymize-log-data/anonymize-log-data.directive.less
plugins/PrivacyManager/angularjs/do-not-track-preference/do-not-track-preference.controller.js
plugins/TagManager/angularjs/containerDashboard/container-dashboard.controller.js
plugins/TagManager/angularjs/containerDashboard/container-dashboard.directive.html
plugins/TagManager/angularjs/containerDashboard/container-dashboard.directive.js
plugins/TagManager/angularjs/containerSelector/container-selector.controller.js
plugins/TagManager/angularjs/containerSelector/container-selector.directive.html
plugins/TagManager/angularjs/containerSelector/container-selector.directive.js
plugins/TagManager/angularjs/containerSelector/container-selector.less
plugins/TagManager/angularjs/debugging/debugging.controller.js
plugins/TagManager/angularjs/manageContainer/edit.controller.js
plugins/TagManager/angularjs/manageContainer/edit.directive.html
plugins/TagManager/angularjs/manageContainer/edit.directive.js
plugins/TagManager/angularjs/manageContainer/list.controller.js
plugins/TagManager/angularjs/manageContainer/list.directive.html
plugins/TagManager/angularjs/manageContainer/list.directive.js
plugins/TagManager/angularjs/manageContainer/manage.controller.js
plugins/TagManager/angularjs/manageContainer/manage.directive.html
plugins/TagManager/angularjs/manageContainer/manage.directive.js
plugins/TagManager/angularjs/manageContainer/model.js
plugins/TagManager/angularjs/manageInstallCode/manage-install-tag-code.controller.js
plugins/TagManager/angularjs/manageInstallCode/manage-install-tag-code.directive.html
plugins/TagManager/angularjs/manageInstallCode/manage-install-tag-code.directive.js
plugins/TagManager/angularjs/manageVersion/diff.js
plugins/TagManager/angularjs/manageVersion/edit.controller.js
plugins/TagManager/angularjs/manageVersion/edit.directive.html
plugins/TagManager/angularjs/manageVersion/edit.directive.js
plugins/TagManager/angularjs/manageVersion/edit.directive.less
plugins/TagManager/angularjs/manageVersion/list.controller.js
plugins/TagManager/angularjs/manageVersion/list.directive.html
plugins/TagManager/angularjs/manageVersion/list.directive.js
plugins/TagManager/angularjs/manageVersion/manage.controller.js
plugins/TagManager/angularjs/manageVersion/manage.directive.html
plugins/TagManager/angularjs/manageVersion/manage.directive.js
plugins/TagManager/angularjs/manageVersion/model.js
plugins/TagManager/angularjs/tagmanagerTrackingCode/tagmanager.controller.js
plugins/TagManager/angularjs/tagmanagerTrackingCode/tagmanager.directive.html
plugins/TagManager/angularjs/tagmanagerTrackingCode/tagmanager.directive.js"
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
