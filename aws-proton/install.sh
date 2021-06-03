#!/bin/bash

#
# Install instructions from https://docs.aws.amazon.com/proton/latest/adminguide/setting-up-for-service.html#ag-setting-up-cli
#

aws configure add-model --service-model "file://proton-2020-07-20.normal.json" --service-name proton-preview
cp waiters2.json $HOME/.aws/models/proton-preview/2020-07-20/waiters2.json

