FROM node:8.9.3
LABEL maintainer="dcunniff@gmail.com"  nodeVersion="8.9.3" version="2.0.0"
LABEL description="Basic Docker image with Node, Python3, AWS CLI, and sceptre"

# apt-get must be updated first
#
# Official AWS documentation recommends using python3 and associated tooling.
# That doesn't work, or at least it does not work as easily as advertised.
# Instead, just go with 'standard' python
RUN apt-get update \
    && apt-get install python3-dev python3-pip -y
RUN pip3 install awscli
RUN pip3 install sceptre

RUN npm i -g yarn@v1.3.2

CMD ["/bin/bash"]
