#!/usr/bin/env bash

# motivation:
# graph.gv is a dotgraph generated by terraform graph command:
# the source project is:
# https://github.com/terraform-aws-modules/terraform-aws-vpc
# examples/complete-vpc

# I have to modify the procedurally generated dot graph, adding
# ranksep = 4.0 
# this way the resulting png is more readable. 

# the open command only works on mac:
# https://apple.stackexchange.com/questions/299900/how-to-open-an-image-file-from-bash-in-mac

thisdir=$( dirname ${BASH_SOURCE[0]} )

do_render() {
    mkdir -p /tmp/sut
    dot ${thisdir}/graph.gv | neato -n -Tpng -o /tmp/sut/out.png
    ls -l /tmp/sut/out.png
    open /tmp/sut/out.png
}

do_render
