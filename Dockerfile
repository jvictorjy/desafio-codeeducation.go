FROM golang:1.17.0-alpine3.14 as builder

WORKDIR /go/src/app
COPY . .
RUN go build hello.go

FROM hello-world

COPY --from=builder /go/src/app .
CMD ["/hello"]
