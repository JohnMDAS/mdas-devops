FROM alpine:3.10.3

RUN apk add --update \
    curl \
    jq \
    && rm -rf /var/cache/apk/*

COPY test.sh .
RUN chmod +x test.sh

ENTRYPOINT [ "./test.sh" ]