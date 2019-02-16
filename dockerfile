FROM golang:1.8-alpine
ADD . /go/src/kubeterra
RUN go install kubeterra

FROM alpine:latest
COPY --from=0 /go/bin/kubeterra .
CMD ["./kubeterra"]