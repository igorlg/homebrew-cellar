#!/bin/bash

#
# Install instructions from https://docs.aws.amazon.com/proton/latest/adminguide/setting-up-for-service.html#ag-setting-up-cli
#

scriptdir=`dirname "$0"`
modeldir="${HOME}/.aws/models/proton-review/2020-07-20"

aws configure add-model \
	--service-model "file://${scriptdir}/proton-2020-07-20.normal.json" \
	--service-name proton-preview

cp $scriptdir/waiters2.json $modeldir/waiters2.json

