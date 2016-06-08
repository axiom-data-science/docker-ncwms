# ncWMS on Docker

A feature full Tomcat (SSL over APR, etc.) running [ncWMS](http://www.resc.rdg.ac.uk/trac/ncWMS/)

Available versions:

* `axiom/docker-ncwms` (currently `2.1.2`)


### tl;dr

**Quickstart**

```bash
$ docker run \
    -d \
    -p 80:8080 \
    -p 443:8443 \
    axiom/docker-ncwms
```

**Production**

```bash
$ docker run \
    -d \
    -p 80:8080 \
    -p 443:8443 \
    -v /path/to/your/ssl.crt:/opt/tomcat/conf/ssl.crt \
    -v /path/to/your/ssl.key:/opt/tomcat/conf/ssl.key \
    -v /path/to/your/tomcat-users.xml:/opt/tomcat/conf/tomcat-users.xml \
    -v /path/to/your/ncwms/config:/config \
    -e "ADVERTISED_PALETTES=div-RdBu" \
    -e "DEFAULT_PALETTE=div-RdBu" \
    --name ncwms \
    axiom/docker-ncwms
```

## Configuration

### Tomcat

See [these instructions](https://github.com/axiom-data-science/docker-tomcat) for configuring Tomcat


### ncWMS

Mount your own `config` directory:

```bash
$ docker run \
    -v /path/to/your/ncwms/config/directory:/config \
    ... \
    axiom/docker-ncwms
```

Set your own [default palette](https://github.com/Reading-eScience-Centre/edal-java/blob/cef96a148ea37be4dbfdf24096396607f5fe8b96/ncwms/src/main/webapp/WEB-INF/web.xml#L115-L121)

```bash
$ docker run \
    -e "DEFAULT_PALETTE=seq-BuYl" \
    ... \
    axiom/docker-ncwms
```

Set your own [advertised palettes](https://github.com/Reading-eScience-Centre/edal-java/blob/cef96a148ea37be4dbfdf24096396607f5fe8b96/ncwms/src/main/webapp/WEB-INF/web.xml#L122-L129)

```bash
$ docker run \
    -e "ADVERTISED_PALETTES=div-RdBu,div-RdBu-inv,seq-cubeYF" \
    ... \
    axiom/docker-ncwms
```


### Users

By default, Tomcat will start with [two user accounts](https://github.com/axiom-data-science/docker-ncwms/blob/master/files/tomcat-users.xml). The passwords are equal to the user name.

* `ncwms` - used to admin ncWMS
* `admin` - can be used by everything else (has full privileges)
