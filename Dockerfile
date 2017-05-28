FROM alpine
MAINTAINER Jason Walker<desktophero@gmail.com>

RUN set -x \
  && apk update \
  && apk upgrade \
  && apk add --no-cache openrc curl unzip sudo python \
  && curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" \
  && unzip awscli-bundle.zip \
  && sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

ENTRYPOINT ["/usr/local/bin/aws"]
