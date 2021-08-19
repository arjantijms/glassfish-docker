FROM eclipse-temurin:11
ENV GLASSFISH_VERSION=6.2.0
RUN apt-get update && \
    apt-get install -y curl unzip && \
    cd /usr/local && \
    curl -L -o glassfish.zip https://repo1.maven.org/maven2/org/glassfish/main/distributions/glassfish/${GLASSFISH_VERSION}/glassfish-${GLASSFISH_VERSION}.zip && \
    unzip glassfish.zip && \
    rm glassfish.zip && \
    rm -rf /var/lib/apt/lists/*
EXPOSE 8181
EXPOSE 8080
EXPOSE 4848
EXPOSE 3700
WORKDIR /mnt
CMD ["/usr/local/glassfish6/glassfish/bin/asadmin", "start-domain", "-v"]
