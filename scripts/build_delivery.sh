#!/bin/bash

set -e

PROJECT_NAME="pytest-ci-cd-delivery-basic"
DELIVERY_DIR="delivery"
PACKAGE_DIR="${DELIVERY_DIR}/${PROJECT_NAME}"

echo "Cleaning previous delivery files..."
rm -rf "${DELIVERY_DIR}"
mkdir -p "${PACKAGE_DIR}"

echo "Copying project files into delivery package..."
cp -R src "${PACKAGE_DIR}/src"
cp -R tests "${PACKAGE_DIR}/tests"
cp -R scripts "${PACKAGE_DIR}/scripts"
cp README.md "${PACKAGE_DIR}/README.md"
cp pytest.ini "${PACKAGE_DIR}/pytest.ini"
cp requirements.txt "${PACKAGE_DIR}/requirements.txt"

echo "Writing delivery information..."
cat > "${PACKAGE_DIR}/DELIVERY_INFO.txt" <<EOF
Project: ${PROJECT_NAME}
Delivery Type: GitHub Actions CD artifact
Generated At: $(date)
Purpose: This package is generated only after pytest validation passes.
EOF

echo "Creating compressed delivery package..."
cd "${DELIVERY_DIR}"
zip -r "${PROJECT_NAME}.zip" "${PROJECT_NAME}"

echo "Delivery package created:"
ls -la