FROM golang:1.25.3

# не запускается без библиотек
RUN apt-get update && apt-get install -y gcc libc-dev musl-dev

WORKDIR /app

COPY . .

RUN go mod tidy

RUN CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go build -o /main main.go

CMD ["/main"]