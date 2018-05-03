# Docker Debian Oracle JRE 10
Docker Debian Slim image with cleaned Oracle JRE 10 Update 1 (237MB for stretch)

You must accept the [Oracle Binary Code License Agreement for Java SE](http://www.oracle.com/technetwork/java/javase/terms/license/index.html) to use this image.

## Image
Image contains cleaned [Oracle JRE 10.0.1](http://www.oracle.com/technetwork/java/javase/downloads/jre10-downloads-4417026.html) version without *desktop, sources* and other unnecessary stuff except JVM. 
So image have all *JVM* parts to run *Java applications* in Docker containers.

Image contains only Java Runtime Environment, so you must have compiled Java application.

There are such tags:

#### *latest*
* Uses base image [Debian Sid Slim](https://hub.docker.com/_/debian/) *(63.3MB)*
* Image size with JRE *(252MB)*

#### *stretch*
* Uses base image [Debian Stretch Slim](https://hub.docker.com/_/debian/) *(55.3MB)*
* Image size with JRE *(237MB)*

## Usage
Image have docker *USER* named **app** so you can use it for your application.

Just add code below in your *Dockerfile* to use start your application as a user *app*
```
USER app
```

Check [example](https://github.com/GoodforGod/https://github.com/GoodforGod/docker-debian-jre10-oracle/tree/master/example) folder for *Dockerfile* example of image usage.
