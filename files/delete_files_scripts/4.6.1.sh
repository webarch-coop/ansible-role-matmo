#!/bin/bash

set -e

DIRS="plugins/Feedback/angularjs
vendor/szymach/c-pchart/src/Resources"
FILES="babel.config.js
core/Composer/ScriptHandler.php
core/Db/Adapter/Pdo/Mssql.php
core/Db/Adapter/Pdo/Pgsql.php
core/Tracker/Db/Pdo/Pgsql.php
core/Translation/Transifex/API.php
jest.config.js
misc/composer/build-xhprof.sh
misc/composer/clean-xhprof.sh
node_modules/jquery.dotdotdot/src/jquery.dotdotdot.min.js
plugins/CoreHome/angularjs/activity-indicator/activityindicator.directive.js
plugins/CoreHome/angularjs/activity-indicator/activityindicator.html
plugins/CoreHome/angularjs/alert/alert.directive.html
plugins/CoreHome/angularjs/alert/alert.directive.js
plugins/CoreHome/angularjs/alert/alert.directive.less
plugins/CoreHome/angularjs/common/directives/dialog.js
plugins/CoreHome/angularjs/common/directives/focus-anywhere-but-here.js
plugins/CoreHome/angularjs/common/directives/focusif.js
plugins/CoreHome/angularjs/common/filters/startfrom.spec.js
plugins/CoreHome/angularjs/common/services/global-ajax-queue.js
plugins/CoreHome/angularjs/common/services/periods.js
plugins/CoreHome/angularjs/common/services/periods.spec.js
plugins/CoreHome/angularjs/common/services/piwik-api.spec.js
plugins/CoreHome/angularjs/common/services/piwik-helper.spec.js
plugins/CoreHome/angularjs/common/services/piwik-url.js
plugins/CoreHome/angularjs/common/services/piwik.js
plugins/CoreHome/angularjs/common/services/piwik.spec.js
plugins/CoreHome/angularjs/comparisons/comparisons.component.html
plugins/CoreHome/angularjs/comparisons/comparisons.component.js
plugins/CoreHome/angularjs/comparisons/comparisons.component.less
plugins/CoreHome/angularjs/comparisons/comparisons.service.js
plugins/CoreHome/angularjs/comparisons/comparisons.service.spec.js
plugins/CoreHome/angularjs/content-block/content-block.directive.html
plugins/CoreHome/angularjs/content-block/content-block.directive.js
plugins/CoreHome/angularjs/date-picker/date-picker.directive.js
plugins/CoreHome/angularjs/date-range-picker/date-range-picker.component.html
plugins/CoreHome/angularjs/date-range-picker/date-range-picker.component.js
plugins/CoreHome/angularjs/date-range-picker/date-range-picker.component.less
plugins/CoreHome/angularjs/dropdown-menu/dropdown-menu.directive.js
plugins/CoreHome/angularjs/dropdown-menu/dropdown-menu.directive.less
plugins/CoreHome/angularjs/enrichedheadline/enrichedheadline.directive.html
plugins/CoreHome/angularjs/enrichedheadline/enrichedheadline.directive.js
plugins/CoreHome/angularjs/enrichedheadline/enrichedheadline.directive.less
plugins/CoreHome/angularjs/enrichedheadline/help.png
plugins/CoreHome/angularjs/iecheck.js
plugins/CoreHome/angularjs/menudropdown/menudropdown.directive.html
plugins/CoreHome/angularjs/menudropdown/menudropdown.directive.js
plugins/CoreHome/angularjs/menudropdown/menudropdown.directive.less
plugins/CoreHome/angularjs/notification/notification.controller.js
plugins/CoreHome/angularjs/notification/notification.directive.html
plugins/CoreHome/angularjs/notification/notification.directive.js
plugins/CoreHome/angularjs/notification/notification.directive.less
plugins/CoreHome/angularjs/notification/notification.service.js
plugins/CoreHome/angularjs/period-date-picker/period-date-picker.component.html
plugins/CoreHome/angularjs/period-date-picker/period-date-picker.component.js
plugins/CoreHome/angularjs/period-date-picker/period-date-picker.component.less
plugins/CoreHome/angularjs/selector/selector.directive.js
plugins/CoreHome/angularjs/selector/selector.directive.less
plugins/CoreHome/javascripts/broadcast.spec.js
plugins/CoreVue/polyfills/babel.config.js
plugins/CoreVue/polyfills/tsconfig.json
plugins/CoreVue/polyfills/vue.config.js
plugins/Feedback/ReferReminder.php
plugins/Feedback/images/facebook_logo.svg
plugins/Feedback/images/linkedin_logo.svg
plugins/Feedback/images/mastodon_logo.svg
plugins/Feedback/images/twitter_logo.svg
plugins/Feedback/templates/feedbackPopup.twig
plugins/Feedback/templates/referBanner.twig
plugins/LanguagesManager/Commands/CreatePull.php
plugins/Morpheus/javascripts/ajaxHelper.js
tsconfig.json
tsconfig.spec.json
vendor/lox/xhprof/scripts/xhprofile.php
vendor/maxmind-db/reader/phpstan.neon
vendor/pear/pear_exception/package.xml
vendor/php-di/php-di/404.md
vendor/php-di/php-di/CONTRIBUTING.md
vendor/php-di/php-di/SECURITY.md
vendor/php-di/php-di/couscous.yml
vendor/php-di/php-di/phpstan-baseline.neon
vendor/php-di/php-di/phpstan.neon
vendor/szymach/c-pchart/resources/doc/2d_pie.md
vendor/szymach/c-pchart/resources/doc/2d_ring.md
vendor/szymach/c-pchart/resources/doc/3d_pie.md
vendor/szymach/c-pchart/resources/doc/3d_ring.md
vendor/szymach/c-pchart/resources/doc/area.md
vendor/szymach/c-pchart/resources/doc/bar.md
vendor/szymach/c-pchart/resources/doc/barcode_128.md
vendor/szymach/c-pchart/resources/doc/barcode_39.md
vendor/szymach/c-pchart/resources/doc/best_fit.md
vendor/szymach/c-pchart/resources/doc/bubble.md
vendor/szymach/c-pchart/resources/doc/cache.md
vendor/szymach/c-pchart/resources/doc/contour.md
vendor/szymach/c-pchart/resources/doc/filled_spline.md
vendor/szymach/c-pchart/resources/doc/filled_step.md
vendor/szymach/c-pchart/resources/doc/line.md
vendor/szymach/c-pchart/resources/doc/plot.md
vendor/szymach/c-pchart/resources/doc/polar.md
vendor/szymach/c-pchart/resources/doc/progress.md
vendor/szymach/c-pchart/resources/doc/radar.md
vendor/szymach/c-pchart/resources/doc/scatter_best_fit.md
vendor/szymach/c-pchart/resources/doc/scatter_line.md
vendor/szymach/c-pchart/resources/doc/scatter_plot.md
vendor/szymach/c-pchart/resources/doc/scatter_spline.md
vendor/szymach/c-pchart/resources/doc/scatter_threshold.md
vendor/szymach/c-pchart/resources/doc/scatter_threshold_area.md
vendor/szymach/c-pchart/resources/doc/spline.md
vendor/szymach/c-pchart/resources/doc/split_path.md
vendor/szymach/c-pchart/resources/doc/spring.md
vendor/szymach/c-pchart/resources/doc/stacked_area.md
vendor/szymach/c-pchart/resources/doc/stacked_bar.md
vendor/szymach/c-pchart/resources/doc/step.md
vendor/szymach/c-pchart/resources/doc/stock.md
vendor/szymach/c-pchart/resources/doc/surface.md
vendor/szymach/c-pchart/resources/doc/zone.md
vendor/szymach/c-pchart/resources/fonts/Bedizen.ttf
vendor/szymach/c-pchart/resources/fonts/Forgotte.ttf
vendor/szymach/c-pchart/resources/fonts/MankSans.ttf
vendor/szymach/c-pchart/resources/fonts/Silkscreen.ttf
vendor/szymach/c-pchart/resources/fonts/advent_light.ttf
vendor/szymach/c-pchart/resources/fonts/calibri.ttf
vendor/szymach/c-pchart/resources/fonts/pf_arma_five.ttf
vendor/szymach/c-pchart/resources/fonts/verdana.ttf
vendor/szymach/c-pchart/src/Chart/Barcode128.php
vendor/szymach/c-pchart/src/Chart/Barcode39.php
vendor/szymach/c-pchart/src/Chart/BaseDraw.php
vendor/szymach/c-pchart/src/Chart/Cache.php
vendor/szymach/c-pchart/src/Chart/Data.php
vendor/szymach/c-pchart/src/Chart/Draw.php
vendor/szymach/c-pchart/src/Chart/Image.php
vendor/szymach/c-pchart/src/Exception/ChartIsAMethodException.php
vendor/szymach/c-pchart/src/Exception/FactoryException.php
vendor/szymach/c-pchart/src/Exception/IncorrectBarcodeNumberException.php
vendor/szymach/c-pchart/src/Exception/NotSupportedChartException.php
vendor/szymach/c-pchart/src/Factory/Factory.php
vendor/twig/twig/drupal_test.sh
vue.config.js
.browserslistrc
.eslintignore
.eslintrc.js
node_modules/iframe-resizer/.eslintrc
node_modules/jquery.dotdotdot/.npmignore
node_modules/ng-dialog/.eslintrc
vendor/php-di/php-di/.gitstats.yml
vendor/php-di/php-di/.phpstorm.meta.php
vendor/twig/twig/.php_cs.dist"
SYMLINKS="vendor/lox/xhprof/bin/xhprofile"

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
for s in ${SYMLINKS}; do
  if [[ -L "${s}" ]]; then
    echo "Deleting symlink ${s}"
    rm "${s}"
  else
    echo "Symlink ${s} has already been deleted"
  fi
done

# Delete directories
for d in ${DIRS}; do
  if [[ -d "${d}" ]]; then
    echo "Deleting directory ${d}"
    rmdir "${d}"
  else
    echo "Directory ${d} has already been deleeted"
  fi
done

exit 0
