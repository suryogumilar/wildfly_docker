#!/bin/bash

## Configure logging in WildFly to be able to dynamically change 
## logging while the application server is running

/opt/wildfly/bin/jboss-cli.sh --connect '/subsystem=logging/logger=org.signserver:add(level=INFO)'
/opt/wildfly/bin/jboss-cli.sh --connect '/subsystem=logging/logger=org.cesecore:add(level=INFO)'


## additional

/opt/wildfly/bin/jboss-cli.sh --connect '/subsystem=logging/logger=org.jboss.as.config:write-attribute(name=level, value=WARN)'
/opt/wildfly/bin/jboss-cli.sh --connect '/subsystem=logging/logger=org.jboss.as:add(level=WARN)'
/opt/wildfly/bin/jboss-cli.sh --connect '/subsystem=logging/logger=org.wildfly:add(level=WARN)'
/opt/wildfly/bin/jboss-cli.sh --connect '/subsystem=logging/logger=org.xnio:add(level=WARN)'
/opt/wildfly/bin/jboss-cli.sh --connect '/subsystem=logging/logger=org.hibernate:add(level=WARN)'
/opt/wildfly/bin/jboss-cli.sh --connect '/subsystem=logging/logger=org.apache.cxf:add(level=WARN)'
/opt/wildfly/bin/jboss-cli.sh --connect '/subsystem=logging/logger=org.cesecore.config.ConfigurationHolder:add(level=WARN)'
/opt/wildfly/bin/jboss-cli.sh --connect '/subsystem=logging/logger=org.infinispan:add(level=WARN)'

## add access log

/opt/wildfly/bin/jboss-cli.sh --connect '/subsystem=undertow/server=default-server/host=default-host/setting=access-log:add(pattern="%h %t \"%r\" %s \"%{i,User-Agent}\"", relative-to=jboss.server.log.dir, directory=access-logs)'
/opt/wildfly/bin/jboss-cli.sh --connect '/subsystem=logging/logger=io.undertow.accesslog:add(level=INFO)'


