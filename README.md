# Create Wildfly Docker Image

This repository for creating wildfly docker image. Using : 
 - Wildfly version *24.0.1-Final* 
 - JDK *java-17-openjdk-devel.x86_64* *(java-17-openjdk-17.0.1.0.12-2.el8_5.x86_64)* 
 - Ant *apache-ant-1.10.13* 

See also https://github.com/suryogumilar/primekey_ss_docker/blob/main/instalasi.md

## Command to create the image

`docker build -t <tag_name>:<tag_version> -f Dockerbuild.wildfly .`

the &lt;tag_name&gt;:&lt;tag_version&gt; examples is: local_wildfly:24.0.1.Final

## Using TLS Certificate Configuration

The keystore would be placed in path `/opt/wildfly/standalone/configuration/keystore/keystore.jks` 

using local_wildfly:24.0.1.Final as a tag name and version:


but first configure the keystore and alias. Import the private and certificate into the keystore (this one use p12 but also feel free to use JKS)

```sh
openssl pkcs12 -export -in server.crt -inkey server.key \
               -out wildfly_keystore.p12 -name wildfly0001 \
               -CAfile ca.crt -caname root

### check again
keytool -v -list -keystore  wildfly_keystore.p12

```

Note on converting P12 file into JKS, follow this additional step:

```sh

keytool -importkeystore \
        -deststorepass [changeit] -destkeypass [changeit] -destkeystore wildfly_ks.keystore \
        -srckeystore wildfly_keystore.p12 -srcstoretype PKCS12 -srcstorepass [p12 password] \
        -alias wildfly0001
```


### entering bash to access jboss-cli

```sh

docker run -it --rm --name wildfly_2401 \
 -p 8888:8080 -p 8443:8443 -p 8442:8442 -p 9990:9990 \
 -v ./certificates_dir/certa_wildfly/wildfly_keystore.p12:/opt/wildfly/standalone/configuration/keystore/wildfly_keystore.p12:ro \
 -v ./certificates_dir/certa_client_wildfly/apptrustore.jks:/opt/wildfly/standalone/configuration/keystore/truststore.jks \
 -v ./transit_folder:/mnt/transit_folder \
 local_wildfly:24.0.1.Final
```

Wait until the server is up, test by connecting to the server through the three port opened by the server. At this state the port 8443 running using self signed certificate

Connect to the container

`docker exec -it wildfly_2401 bash`

then run script in folder config_scripts




