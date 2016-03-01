#!/bin/sh

#  copy-framework.sh
#  SourceKit
#
#  Created by Isambard Poulson on 05/11/2015.
#  Copyright © 2015 Isambard Poulson. All rights reserved.

UNIVERSAL_OUTPUTFOLDER=${BUILD_DIR}/${CONFIGURATION}-universal

POD_DESTINATION="${SRCROOT}/../SourceKitPod/Pod/Frameworks/${PROJECT_NAME}.framework"
FRAMEWORK_TEST_DESTINATION="${SRCROOT}/../SourceKitFrameworkTest/SourceKitFrameworkTest/Frameworks/${PROJECT_NAME}.framework"
SAMPLE_DESTINATION="${SRCROOT}/../SourceKitSample/SourceKitSample/Frameworks/${PROJECT_NAME}.framework"

rm -rf "${POD_DESTINATION}"
cp -R "${UNIVERSAL_OUTPUTFOLDER}/${PROJECT_NAME}.framework" "${POD_DESTINATION}"

rm -rf "${FRAMEWORK_TEST_DESTINATION}"
cp -R "${UNIVERSAL_OUTPUTFOLDER}/${PROJECT_NAME}.framework" "${FRAMEWORK_TEST_DESTINATION}"

rm -rf "${SAMPLE_DESTINATION}"
cp -R "${UNIVERSAL_OUTPUTFOLDER}/${PROJECT_NAME}.framework" "${SAMPLE_DESTINATION}"