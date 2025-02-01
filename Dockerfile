FROM eclipse-temurin:21-jre-noble

ARG PHOTON_VERSION
ENV PHOTON_VERSION=${PHOTON_VERSION:-0.6.2}
ENV NOMINATIM_HOST=nomimatim

# Install pbzip2 for parallel extraction
RUN apt-get update \
  && apt-get -y install \
  pbzip2 \
  curl \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /photon
RUN mkdir -p /photon/photon_data
ADD https://github.com/komoot/photon/releases/download/${PHOTON_VERSION}/photon-${PHOTON_VERSION}.jar /photon/photon.jar
COPY entrypoint.sh ./entrypoint.sh
RUN chmod +x entrypoint.sh


VOLUME /photon/photon_data
EXPOSE 2322
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=5 CMD curl --fail http://localhost:2322/ || exit 1

ENTRYPOINT ["/photon/entrypoint.sh"]
