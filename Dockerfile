FROM caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddyserver/transform-encoder \
    --with github.com/mholt/caddy-ratelimit

FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
