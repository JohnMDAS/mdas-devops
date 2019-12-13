#### BUILDER####
FROM golang AS  builder

RUN go get github.com/gorilla/websocket && \
    go get github.com/labstack/echo && \
    go get github.com/go-redis/redis

COPY . .

RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 \
    go build -o /build/votingapp && \
    cp -r ui /build

#### RUNTIME ####
FROM alpine:3.10.3

RUN apk add --update \
    bash \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /app
WORKDIR /app

COPY --from=builder /build /app
RUN chmod +x ./votingapp
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

ENTRYPOINT ["./votingapp"]