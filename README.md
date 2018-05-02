# Docker Debian Oracle JRE 10
Docker Debian Slim image with cleaned Oracle JRE 10 Update 1 (size 253MB)

You must accept the [Oracle Binary Code License Agreement for Java SE](http://www.oracle.com/technetwork/java/javase/terms/license/index.html) to use this image.

## Image
Image uses [Debian Slim](https://hub.docker.com/_/debian/) as base image.

And contains cleaned [Oracle JRE 10.0.1](http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html) version without *desktop, sources* and other unnecessary stuff except JVM. So image have all *JVM* parts to run *Java applications* in Docker containers.

Image contains only Java Runtime Environment, so you must have compiled Java application.

## Usage
Image have docker *USER* named **app** so you can use it for your application.

Just add code below in your *Dockerfile* to use start your application as a user *app*
```
USER app
```

Check [example](https://github.com/GoodforGod/docker-alpine-jre8-oracle/tree/master/example) folder for *Dockerfile* example of image usage.

