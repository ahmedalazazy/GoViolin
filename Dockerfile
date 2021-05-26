FROM golang:1.16.4-alpine
WORKDIR /app
COPY . .
RUN export CGO_ENABLED=0 && go mod init geolster && go build -o main .
EXPOSE 8080
CMD ["./main"]
