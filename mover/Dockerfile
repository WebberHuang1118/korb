# FROM alpine:3

# RUN apk add --no-cache rsync bash tar lsblk device-mapper && rm -rf /var/cache/apk/*

# COPY ./entrypoint.sh /bin/entrypoint

# ENTRYPOINT [ "/bin/entrypoint" ]

# Use a multi-stage build to keep the final image clean and small
# Start with a Go-capable image for building
FROM golang:1.18-alpine as builder

# Install Git, necessary for fetching the repository
RUN apk add --no-cache git

# Set the working directory for the build
WORKDIR /build

# Clone the diskrsync repository from GitHub
RUN git clone https://github.com/dop251/diskrsync.git

# Change to the diskrsync directory
WORKDIR /build/diskrsync/diskrsync

# Build the diskrsync binary statically linked
RUN CGO_ENABLED=0 go build -o /diskrsync

# Now, build the actual Docker image with only the necessary components
FROM alpine:3

# Install runtime dependencies for your application
RUN apk add --no-cache rsync bash tar lsblk device-mapper && rm -rf /var/cache/apk/*

# Copy the diskrsync binary from the builder image
COPY --from=builder /diskrsync /bin/diskrsync

COPY ./entrypoint.sh /bin/entrypoint

ENTRYPOINT [ "/bin/entrypoint" ]