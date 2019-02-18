FROM node:8.9.3
LABEL maintainer="dcunniff@gmail.com"  nodeVersion="8.9.3" version="2.0.0.3"
LABEL description="Basic Docker image with Node, Python3, AWS CLI, and sceptre"

# apt-get must be updated first
#
# Official AWS documentation recommends using python3 and associated tooling.
# That doesn't work, or at least it does not work as easily as advertised.
# Instead, just go with 'standard' python
RUN apt-get update \
    && apt-get install python3-dev python3-pip -y
RUN pip3 install awscli

# sceptre for managing aws cloud formation templates
RUN pip3 install sceptre
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
 
RUN npm i -g yarn@v1.3.2

# need jq for yq
ENV JQ_VERSION='1.5'
RUN wget --no-check-certificate https://raw.githubusercontent.com/stedolan/jq/master/sig/jq-release.key -O /tmp/jq-release.key && \
    wget --no-check-certificate https://raw.githubusercontent.com/stedolan/jq/master/sig/v${JQ_VERSION}/jq-linux64.asc -O /tmp/jq-linux64.asc && \
    wget --no-check-certificate https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux64 -O /tmp/jq-linux64 && \
    gpg --import /tmp/jq-release.key && \
    gpg --verify /tmp/jq-linux64.asc /tmp/jq-linux64 && \
    cp /tmp/jq-linux64 /usr/bin/jq && \
    chmod +x /usr/bin/jq && \
    rm -f /tmp/jq-release.key && \
    rm -f /tmp/jq-linux64.asc && \
    rm -f /tmp/jq-linux64

# need yq so that we can parse the parameters from the sceptre configs
RUN pip3 install yq
CMD ["/bin/bash"]
