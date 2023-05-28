# base go image
FROM golang:1.18-alpine as builder

RUN mkdir /app

COPY . /app

WORKDIR /app

RUN go mod download

RUN CGO_ENABLED=0 go build -o godocker main.go

RUN chmod +x /app/godocker

CMD [ "/app/godocker" ]