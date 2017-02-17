FROM frolvlad/alpine-oraclejdk8:slim

ENV GRADLE_VERSION=3.3 \
    APP_DIR=/app \
    GRADLE_DIR=/usr/share

# Extra files created by gradle
ENV HOME=${APP_DIR}/.home \
    GRADLE_USER_HOME=${APP_DIR}/.home \
    GRADLE_OPTS="\"-Dorg.gradle.daemon=false\""

# Download and extract gradle to opt folder
ENV PATH="$PATH:${GRADLE_DIR}/gradle-${GRADLE_VERSION}/bin"
RUN apk --no-cache add curl libstdc++ \
    && curl -O https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
    && unzip gradle-${GRADLE_VERSION}-bin.zip -d ${GRADLE_DIR} \
    && rm -f gradle-${GRADLE_VERSION}-bin.zip \
    && apk del curl

WORKDIR ${APP_DIR}
CMD ["gradle", "clean", "build"]
