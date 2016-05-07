FROM mgcrea/node-opencv:2.4
MAINTAINER Olivier Louvignes <olivier@mg-crea.com>

ARG OPENBR_VERSION
ENV OPENBR_VERSION ${OPENBR_VERSION:-1.1.0}

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    unzip \
    cmake \
    qt5-default \
    libqt5svg5-dev \
    qtcreator \
    \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local

RUN git clone https://github.com/biometrics/openbr.git \
  && cd openbr \
  && git checkout v${OPENBR_VERSION} \
  && git submodule init \
  && git submodule update

# RUN curl -SLO "https://github.com/biometrics/openbr/archive/v${OPENBR_VERSION}.zip" \
#   && unzip v${OPENBR_VERSION}.zip \
#   && mv /usr/local/openbr-${OPENBR_VERSION} /usr/local/openbr \
#   && rm v${OPENBR_VERSION}.zip

RUN mkdir /usr/local/openbr/build
WORKDIR /usr/local/openbr/build
RUN cmake -D CMAKE_BUILD_TYPE=RELEASE \
      ..
RUN make -j7
RUN make install
