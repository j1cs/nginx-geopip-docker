FROM nginx:mainline-alpine
RUN apk add --no-cache \
    nginx-mod-http-geoip \
    geoip \
    curl && \
    mkdir -p /usr/share/GeoIP && \
    cd /usr/share/GeoIP/ && \
    curl -O -J https://sources.archlinux.org/other/packages/geoip-database/20240309/GeoIPCity.dat.gz && \
    curl -O -J https://sources.archlinux.org/other/packages/geoip-database/20240309/GeoIP.dat.gz && \
    gzip -d *

CMD ["nginx", "-g", "daemon off;"]
