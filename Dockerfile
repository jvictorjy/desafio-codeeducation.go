FROM golang:1.14.2-alpine3.11 as builder

WORKDIR /go/src/app
COPY . .
RUN go build hello.go

FROM hello-world

COPY --from=builder /go/src/app .
CMD ["/hello"]
