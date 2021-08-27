FROM golang:1.16-alpine as builder

WORKDIR /go/src/app
COPY . .
RUN go build -o hello.go

FROM hello-world

COPY --from=builder /go/src/app .
CMD ["/hello"]
