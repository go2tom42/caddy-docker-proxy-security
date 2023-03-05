ARG CADDY_VERSION=2.6.4
FROM caddy:${CADDY_VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-security \
    --with github.com/lucaslorentz/caddy-docker-proxy/plugin/v2 \

FROM caddy:${CADDY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]
