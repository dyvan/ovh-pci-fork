# Stage 1: Create a minimal image
FROM alpine:latest as builder

# Copy the binary from your local directory to the container
COPY app /app/app

# Set the binary as the default command to execute
CMD ["/app/app"]