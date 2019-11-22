FROM python:3.7-alpine3.10

ENV SONAR_SCANNER_VERSION 4.2.0.1873

COPY sonar-scanner-runner.sh /usr/bin/

RUN apk add --no-cache wget openjdk11-jre ca-certificates java-cacerts \
    && wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip \
    && unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION} \
    && ln -s /sonar-scanner-${SONAR_SCANNER_VERSION}/bin/sonar-scanner /usr/bin/sonar-scanner \
    && apk del wget \
    && mkdir /code \
    && ln -s /usr/bin/sonar-scanner-runner.sh /usr/bin/sonar-scanner-run \
    && rm -rf /var/cache/apk/*

WORKDIR /code

VOLUME /code

CMD [ "/usr/bin/sonar-scanner-runner.sh" ]

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="Sonar Scanner" \
      org.label-schema.description="SonarQube Scanner for code analysis" \
      org.label-schema.url="https://frederico.cf" \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.version="1.0.0" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.author="Frederico Freire Boaventura" \
      org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.license="LGPLv3"
