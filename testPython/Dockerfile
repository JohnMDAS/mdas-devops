FROM alpine:3.10.3

RUN apk add --update \
    py-pip \
    python2 \
    curl \
    jq \
    && rm -rf /var/cache/apk/*

COPY tests.py .
RUN chmod +x tests.py
RUN pip install requests

ENTRYPOINT ["./tests.py" ]