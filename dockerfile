FROM golang:1.21.6 as builder

WORKDIR /app

COPY go.mod go.sum ./
COPY ./starter/main.go .

RUN go mod download

COPY . .
RUN go build -o /app/bin .

FROM ubuntu:latest

COPY --from=builder /app/bin /app/bin

ENTRYPOINT [ "/app/bin" ]
