#### BUILDER####
FROM golang AS  builder

RUN go get github.com/gorilla/websocket && \
    go get github.com/labstack/echo

COPY . .

RUN go build -o /build/votingapp && \
    cp -r ui /build

#### RUNTIME ####
FROM ubuntu:18.04

#RUN apt-get update && apt-get install golang -y && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY --from=builder /build .
ENTRYPOINT [ "./votingapp" ]