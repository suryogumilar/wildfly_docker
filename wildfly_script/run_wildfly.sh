#!/bin/bash

source /etc/profile.d/wildfly_setenv.sh
/opt/wildfly/bin/launch.sh $WILDFLY_MODE $WILDFLY_CONFIG $WILDFLY_BIND
