#!/bin/bash

set -e

FILE="plugins/Marketplace/Categories/PremiumFeaturesSubcategory.php"

if [[ -f "${FILE}" ]]
then
  echo "Deleting file ${FILE}"
  rm -f "${FILE}"
else
  echo "File ${FILE} is absent"
fi
exit 0
