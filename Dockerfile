FROM node:8.9.3
LABEL maintainer="dcunniff@gmail.com"  nodeVersion="8.9.3" version="1.0.0"

# apt-get must be updated first
#
# Official AWS documentation recommends using python3 and associated tooling.
# That doesn't work, or at least it does not work as easily as advertised.
# Instead, just go with 'standard' python
RUN apt-get update \
    && apt-get install python-dev python-pip -y \
    && easy_install --upgrade six \
    && pip install awscli

RUN npm i -g yarn@v1.3.2

CMD ["/bin/bash"]
