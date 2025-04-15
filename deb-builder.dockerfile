ARG BASE=ubuntu:24.04

FROM $BASE

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -y \
    devscripts \
    equivs

WORKDIR /tmp
COPY debian/control .
RUN mk-build-deps --install --tool='apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends --yes' control
