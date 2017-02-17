FROM frolvlad/alpine-oraclejdk8:slim

ENV GRADLE_VERSION=3.3 \
    APP_DIR=/app

# Extra files created by gradle
ENV HOME=${APP_DIR}/.home \
    GRADLE_USER_HOME=${APP_DIR}/.home \
    GRADLE_OPTS="\"-Dorg.gradle.daemon=false\""

# Download and extract gradle to opt folder
ENV PATH="$PATH:/opt/gradle-${GRADLE_VERSION}/bin"
RUN apk --no-cache add curl libstdc++ \
    && mkdir /opt \
    && curl -O https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
    && unzip gradle-${GRADLE_VERSION}-bin.zip -d /opt \
    && rm -f gradle-${GRADLE_VERSION}-bin.zip \
    && apk del curl

WORKDIR ${APP_DIR}
CMD ["gradle", "clean", "build"]
