FROM erseco/alpine-php-webserver:1.13.0 as dev

USER root
#COPY --chown=nobody data/ /

RUN apk add --no-cache dcron libcap php8-sodium php8-exif && \
    chown nobody:nobody /usr/sbin/crond && \
    chown nobody:nobody /var/www/html && \
    setcap cap_setgid=ep /usr/sbin/crond

USER nobody

FROM dev as prod

COPY data/data /var/www/moodledata
COPY data/src2 /var/www/html
