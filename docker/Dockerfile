# Build Stage
FROM caddy:builder AS builder

# Enable the OVH DNS provider module
RUN xcaddy build --with github.com/caddy-dns/ovh

# Final Stage
FROM caddy:latest

# Copy the binary from the builder stage
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

