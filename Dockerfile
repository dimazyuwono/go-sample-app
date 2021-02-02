FROM golang:alpine AS build
WORKDIR /tmp/workdir
COPY *.go .
RUN go build -o ./out/go-sample-app .

FROM alpine:3.7
COPY --from=build /tmp/workdir/out/go-sample-app /app/go-sample-app
EXPOSE 8080
CMD ["/app/go-sample-app"]
