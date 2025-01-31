FROM ubuntu:22.04

RUN sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list && \
    apt-get update && apt-get upgrade -y && \
    apt-get install apt-rdepends dpkg-dev -y

WORKDIR /projects

COPY script.sh /projects

CMD ["/bin/bash"]
