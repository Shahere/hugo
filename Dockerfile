# Stage 1: Build stage
FROM klakegg/hugo:latest as builder

# Create a temporary directory and copy the Hugo binary
WORKDIR /build
COPY --from=builder /usr/bin/hugo /build/

# Stage 2: Final stage
FROM klakegg/hugo:latest

# Copy the Hugo binary from the build stage to the final image
COPY --from=builder /build/hugo /usr/bin/hugo

# Set the working directory
WORKDIR /site

# Copy the Hugo site to the container
COPY . /site

# Expose port 80
EXPOSE 80

# Run Hugo server with specified parameters
CMD ["hugo", "server", "--bind", "0.0.0.0", "--port", "80", "--baseURL", "http://149.202.41.170"]

