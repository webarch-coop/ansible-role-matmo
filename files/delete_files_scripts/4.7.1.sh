#!/bin/bash

set -e

DIRS="node_modules/jquery/external
plugins/TagManager/vue"
FILES="config/environment/test.php
config/environment/ui-test.php
core/Updates/5.0.0-b1.php
node_modules/mousetrap/mousetrap.sublime-project
node_modules/ng-dialog/yarn.lock
node_modules/vue/dist/vue.cjs.js
node_modules/vue/dist/vue.cjs.prod.js
node_modules/vue/dist/vue.d.ts
node_modules/vue/dist/vue.esm-browser.js
node_modules/vue/dist/vue.esm-browser.prod.js
node_modules/vue/dist/vue.esm-bundler.js
node_modules/vue/dist/vue.runtime.esm-browser.js
node_modules/vue/dist/vue.runtime.esm-browser.prod.js
node_modules/vue/dist/vue.runtime.esm-bundler.js
node_modules/vue/dist/vue.runtime.global.js
node_modules/vue/dist/vue.runtime.global.prod.js
plugins/CoreAdminHome/config/test.php
plugins/CoreAdminHome/vue/src/TrackingFailures/FailureRow.vue
plugins/CoreAdminHome/vue/src/TrackingFailures/TrackingFailures.adapter.ts
plugins/CoreAdminHome/vue/src/TrackingFailures/TrackingFailures.less
plugins/CoreAdminHome/vue/src/TrackingFailures/TrackingFailures.vue
plugins/CoreHome/config/test.php
plugins/CoreHome/vue/src/lazyInitSingleton.ts
plugins/CorePluginsAdmin/config/test.php
plugins/CorePluginsAdmin/vue/src/GroupedSettings/GroupedSetting.vue
plugins/CorePluginsAdmin/vue/src/GroupedSettings/GroupedSettings.vue
plugins/DBStats/config/test.php
plugins/GeoIp2/config/test.php
plugins/Login/config/test.php
plugins/Marketplace/config/test.php
plugins/Overlay/config/ui-test.php
plugins/ProfessionalServices/config/test.php
plugins/SEO/config/ui-test.php
plugins/TagManager/config/test.php
plugins/Tour/config/test.php
plugins/TwoFactorAuth/config/test.php
plugins/UserCountry/LocationProvider/DisabledProvider.php
vendor/davaxi/sparkline/Dockerfile
vendor/davaxi/sparkline/composer-8.json
vendor/davaxi/sparkline/docker-compose.yml
vendor/geoip2/geoip2/examples/benchmark.php
vendor/geoip2/geoip2/phpstan.neon
vendor/maxmind-db/reader/package.xml
vendor/monolog/monolog/phpstan.neon.dist
vendor/pear/archive_tar/package.xml
vendor/pear/console_getopt/package.xml
vendor/szymach/c-pchart/codeception.yml
vendor/szymach/c-pchart/coverage.sh
vendor/tecnickcom/tcpdf/tools/convert_fonts_examples.txt
vendor/tecnickcom/tcpdf/tools/tcpdf_addfont.php
node_modules/chroma-js/.npmignore
node_modules/iframe-resizer/.ncurc.json
node_modules/iframe-resizer/.prettierrc
node_modules/jquery.browser/.npmignore
node_modules/jquery.scrollto/.jscsrc
node_modules/jquery.scrollto/.npmignore
node_modules/ng-dialog/.npmignore
node_modules/qrcodejs2/.npmignore
vendor/twig/twig/.php-cs-fixer.dist.php"
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
