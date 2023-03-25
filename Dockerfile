FROM golang:1.20.2 AS build
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOOARCH=amd64 go build -o server

from scratch
WORKDIR /app
COPY --from=build /app/server .
ENTRYPOINT [ "./server" ]