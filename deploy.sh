#!/bin/bash
BINTRAY_USER=$1
BINTRAY_API_KEY=$2

function show_help_and_exit() {
	echo "Usage:"
	echo " deploy.sh bintrayUser apiKey"
	exit 1
}

if [ -z "$BINTRAY_USER" ]; then
	echo "bintray user not set"
	show_help_and_exit;
fi
if [ -z "$BINTRAY_API_KEY" ]; then
	echo "bintray api key not set"
	show_help_and_exit;
fi
# use bintray upload script from vogella:
# https://github.com/vogellacompany/bintray-publish-p2-updatesite (de-jcup fork)
./../bintray-publish-p2-updatesite/pushToBintray.sh ${BINTRAY_USER} ${BINTRAY_API_KEY} de-jcup test-generic update-site current ./test-updatesite/
