FROM caddy:2.8.4-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-ratelimit \ 
    --with github.com/lucaslorentz/caddy-docker-proxy/v2

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
