#!/bin/sh

echo "${CONFIGURATION}"
if [[ $CONFIGURATION == *"Development"* ]]; then
    cp "${PROJECT_DIR}/${PROJECT_NAME}/Firebase/GoogleService-Info-Development.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist"
    echo "Development GoogleService-Info copied."
elif [[ $CONFIGURATION == *"Staging"* ]]; then
    cp "${PROJECT_DIR}/${PROJECT_NAME}/Firebase/GoogleService-Info-Staging.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist"
    echo "Production GoogleService-Info copied."
elif [[ $CONFIGURATION == *"Production"* ]]; then
    cp "${PROJECT_DIR}/${PROJECT_NAME}/Firebase/GoogleService-Info-Production.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist"
    echo "Production GoogleService-Info copied."
else
    cp "${PROJECT_DIR}/${PROJECT_NAME}/Firebase/GoogleService-Info-Development.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist"
    echo "else GoogleService-Info copied."
fi
