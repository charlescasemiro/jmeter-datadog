#!/bin/bash
#
# Run JMeter Docker image with options

NAME="jmeter$(echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM | md5| cut -c -8)"
JMETER_VERSION=${JMETER_VERSION:-"latest"}
IMAGE="justb4/jmeter:5.5"

# Finally run
docker run --rm --name ${NAME} -i -v ${PWD}:${PWD} -w ${PWD} ${IMAGE} $@
