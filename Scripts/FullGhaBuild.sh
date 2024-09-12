#!/bin/bash
source ../../env.sh && \
time ./Scripts/compile/getMavlinkHeaders.sh && \
time ./Scripts/compile/buildTSS_internal.sh -t docker && \
time ./Scripts/compile/buildTSS.sh -t docker && \
time ./Scripts/compile/buildGHAA.sh -t docker
