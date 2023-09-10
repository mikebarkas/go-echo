# syntax=docker/dockerfile:1

FROM golang:1.21-alpine
LABEL authors="Mike Barkas"

# Set the working directory for copying files.
WORKDIR /app

# Move files into the working directory.
# Download the libraries needed.
COPY go.mod go.sum ./
RUN go mod download
COPY *.go ./

# Build for the Linux os and name output file.
RUN CGO_ENABLED=0 GOOS=linux go build -o /go-echo

# Define the port and command the executable file.
EXPOSE 8080
CMD ["/go-echo"]
