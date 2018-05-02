FROM debian:sid-slim

###### DISCLAIMER ######
#
# You must accept the Oracle Binary Code License Agreement for Java SE to use this image.
#
# Link to License: http://www.oracle.com/technetwork/java/javase/terms/license/index.html
#
###### DISCLAIMER ######

# Set java enviroment
ENV LANG=C.UTF-8 \ 
	JAVA_MAJOR_VERSION=10 \
	JAVA_MINOR_VERSION=0 \
	JAVA_UPDATE=1 \
	JAVA_BUILD=10 \
	JAVA_PATH=fb4372174a714e6b8c52526dc134031e \
	JAVA_TYPE=jre

ENV JAVA_FULL_VERSION="${JAVA_MAJOR_VERSION}.${JAVA_MINOR_VERSION}.${JAVA_UPDATE}"

ENV JAVA_HOME="/opt/java/${JAVA_TYPE}-${JAVA_FULL_VERSION}" \
	JAVA_TAR="${JAVA_TYPE}-${JAVA_FULL_VERSION}_linux-x64_bin.tar.gz"

# Download oracle jre -> extract it -> add app user & group -> cleanup
# You can use USER 'app' for you app
RUN cd /tmp \
	&& apt-get update \
	&& apt-get install -y wget \
	&& mkdir -p $JAVA_HOME \
	&& wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
	--progress=dot:mega --tries=10 "http://download.oracle.com/otn-pub/java/jdk/${JAVA_FULL_VERSION}+${JAVA_BUILD}/${JAVA_PATH}/${JAVA_TAR}" \
	&& tar -xzf $JAVA_TAR -C /opt/java \
	&& ln -s $JAVA_HOME $JAVA_HOME/bin/* /usr/bin/ \
	&& rm -rf $JAVA_HOME/*src.zip \
	$JAVA_HOME/lib/*javafx* \
	$JAVA_HOME/lib/plugin.jar \
	$JAVA_HOME/lib/ext/jfxrt.jar \
	$JAVA_HOME/lib/javaws.jar \
	$JAVA_HOME/lib/desktop \
	$JAVA_HOME/lib/fonts \
	$JAVA_HOME/lib/deploy* \
	$JAVA_HOME/lib/*javafx* \
	$JAVA_HOME/lib/*jfx* \
	$JAVA_HOME/lib/amd64/libdecora_sse.so \
	$JAVA_HOME/lib/amd64/libprism_*.so \
	$JAVA_HOME/lib/amd64/libfxplugins.so \
	$JAVA_HOME/lib/amd64/libglass.so \
	$JAVA_HOME/lib/amd64/libgstreamer-lite.so \
	$JAVA_HOME/lib/amd64/libjavafx*.so \
	$JAVA_HOME/lib/amd64/libjfx*.so \
	$JAVA_HOME/lib/ext/nashorn.jar \
	$JAVA_HOME/lib/jfr.jar \
	$JAVA_HOME/lib/jfr \
	$JAVA_HOME/lib/oblique-fonts \
	$JAVA_HOME/plugin \
	$JAVA_HOME/bin/jjs \
    && apt-get remove wget \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/* \
	&& useradd -ms /bin/bash app

# Add java to path
ENV PATH $PATH:$JAVA_HOME/bin