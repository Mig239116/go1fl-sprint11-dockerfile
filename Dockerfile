FROM golang:1.22.0

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download 

COPY *.go ./

COPY tracker.db ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /app/my_app

CMD ["/app/my_app"]