FROM debian:jessie

MAINTAINER Ozzy Johnson <ozzy.johnson@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Update and install minimal.
RUN \
  apt-get update \
            --quiet && \
  apt-get install \ 
            --yes \
            --no-install-recommends \
            --no-install-suggests \
          build-essential \
          r-base \
          wget && \
# Clean up packages.
  apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Get R benchmark.
RUN wget \
      http://r.research.att.com/benchmarks/R-benchmark-25.R \
      -P /data

# Data volume.
ONBUILD ["/data"]

# Get ready to run.
WORKDIR /data

# Default command.
ENTRYPOINT ["bash", "R"]
