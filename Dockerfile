FROM caddy:2.8.4-builder-alpine AS builder

ENV DOCKER_HOST=unix:///run/user/1000/podman/podman.sock

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-ratelimit 

FROM caddy:latest-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]
