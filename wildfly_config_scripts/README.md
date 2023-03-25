# Configuration scripts for Wildfly

refer to this [link](https://doc.primekey.com/signserver511/signserver-installation/application-server-setup/wildfly-24-and-jboss-eap-7-4)


## Add datasource script mariadb

you might want to start mariadb first

```sh
docker run -itd --name wfmariadb \
 -v ./mariadb_dir:/var/lib/mysql
 -p 33060:33060
 -p 3306:3306
 --env-file ./mariadb.env
 mariadb:10.7.3-focal
```

create network 

`docker network create wfNetwork`

and then attach both of the containers

```sh
docker network connect wfNetwork wfmariadb
docker network connect wfNetwork wildfly_2701 
```

Check if containers are part of the new network:

`docker network inspect wfNetwork`
