# Create Wildfly Docker Image

This repository for creating wildfly docker image. Using : 
 - Wildfly version *27.0.1-Final* 
 - JDK *java-17-openjdk-devel.x86_64* *(java-17-openjdk-17.0.1.0.12-2.el8_5.x86_64)* 
 - Ant *apache-ant-1.10.13* 

See also https://github.com/suryogumilar/primekey_ss_docker/blob/main/instalasi.md

## Command to create the image

`docker build -t <tag_name>:<tag_version> -f Dockerbuild.wildfly .`

the &lt;tag_name&gt;:&lt;tag_version&gt; examples is: local_wildfly:27.0.1.Final
