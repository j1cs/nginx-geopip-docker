FROM nginx:mainline-alpine
COPY fetch_latest_geoip.sh /usr/local/bin/fetch_latest_geoip.sh
RUN chmod +x /usr/local/bin/fetch_latest_geoip.sh
RUN apk add --no-cache \
    nginx-mod-http-geoip \
    geoip \
    curl && \
    /usr/local/bin/fetch_latest_geoip.sh

CMD ["nginx", "-g", "daemon off;"]
