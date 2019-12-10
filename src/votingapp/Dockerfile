#### BUILDER####
FROM golang AS  builder

RUN go get github.com/gorilla/websocket && \
    go get github.com/labstack/echo

COPY . .

RUN go build -o /build/votingapp && \
    cp -r ui /build

#### RUNTIME ####
FROM alpine:3.10.3

WORKDIR /app
COPY --from=builder /build .
ENTRYPOINT [ "./votingapp" ]