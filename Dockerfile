FROM sonarsource/sonar-scanner-cli:latest

# ENV SONAR_SCANNER_VERSION 4.8.0.2856

RUN apk update && apk upgrade \
    && mkdir /code \
    && ln -s /usr/bin/sonar-scanner-runner.sh /usr/bin/sonar-scanner-run \
    && rm -rf /var/cache/apk/*

WORKDIR /code

LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="Sonar Scanner" \
    org.label-schema.description="SonarQube Scanner for code analysis" \
    org.label-schema.url="https://fboaventura.dev" \
    org.label-schema.vcs-url=$VCS_URL \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.version="1.0.0" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.author="Frederico Freire Boaventura" \
    org.label-schema.docker.dockerfile="/Dockerfile" \
    org.label-schema.license="LGPLv3"
