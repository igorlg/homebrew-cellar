#!/bin/bash

mkdir -p $HOME/.aws/models/proton-preview/2020-07-20/
ln -s `pwd`/proton-2020-07-20.normal.json $HOME/.aws/models/proton-preview/2020-07-20/service-2.json
ln -s `pwd`/waiters-2.json $HOME/.aws/models/proton-preview/2020-07-20/waiters-2.json

