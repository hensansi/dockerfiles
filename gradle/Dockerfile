FROM openjdk:8-jdk

ENV GRADLE_VERSION=3.3 \
    GRADLE_HOME=/opt/gradle

ENV PATH=$PATH:$GRADLE_HOME/bin

# Download and extract gradle to opt folder
RUN curl -O https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
    && unzip gradle-${GRADLE_VERSION}-bin.zip -d /opt \
    && ln -s /opt/gradle-${GRADLE_VERSION} /opt/gradle \
    && rm -f gradle-${GRADLE_VERSION}-bin.zip
