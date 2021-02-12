FROM golang:1.15.6-alpine3.13 as build

# Copy artifacts into build directory
RUN mkdir /build
WORKDIR /build
COPY . .

# Build the executable
RUN go build portfolio.go

RUN mkdir /app
FROM build
COPY --from=build /build/ /app

RUN chmod -R 777 /app

# CMD ["./portfolio"]

# Document that the service listens on port 8081.
EXPOSE 8081