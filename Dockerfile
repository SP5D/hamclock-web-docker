FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install -y \
    curl unzip \
    make g++ xorg-dev libx11-dev

RUN resolution_variants=("800x480" "1600x960" "2400x1440" "3200x1920") && \
    tempdir=$(mktemp -d) && \
    cd ${tempdir} && \
    curl -O https://www.clearskyinstitute.com/ham/HamClock/ESPHamClock.zip && \
    unzip ESPHamClock.zip && \
    cd ESPHamClock && \
    for resolution in ${resolution_variants[*]}; \
    do \
        make -j $(nproc --all) hamclock-web-${resolution} && \
        make install && \
        mv /usr/local/bin/hamclock /usr/local/bin/hamclock-${resolution}; \
    done; \
    cd && \
    rm -r ${tempdir}


# docker-compose will overwrite it anyway, so let's choose failsafe variant
CMD [ "hamclock-800x480"]
