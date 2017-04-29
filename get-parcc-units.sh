#!/bin/bash
# @(#) get-parcc-units.sh - dump the contents page from a PARCC cache
# and extract a list of the Units it contains to stdout

SRV_NAME=$1

curl -o - http://${SRV_NAME}.ccpcs.local:4480/contents.jsp?locale=en_US \
    | grep '<a href="contentdetails.jsp' \
    | sed -E 's/^.*<a href="contentdetails.jsp.+>([^<]+)<.*$/\1/' \
    | sort
