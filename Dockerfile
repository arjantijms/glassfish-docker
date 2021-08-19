FROM eclipse-temurin:11
ENV GLASSFISH_VERSION=6.2.0
RUN apt-get update && \
    apt-get install -y curl unzip && \
    cd /usr/local && \
    curl -L -o glassfish.zip https://download.eclipse.org/ee4j/glassfish/glassfish-${GLASSFISH_VERSION}.zip && \
    unzip glassfish.zip && \
    rm glassfish.zip && \
    rm -rf /var/lib/apt/lists/*
EXPOSE 8080
EXPOSE 4848
WORKDIR /mnt
CMD ["/usr/local/glassfish6/glassfish/bin/asadmin", "start-domain", "-v"]
