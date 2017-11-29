FROM businesstools/nginx-php:1.7.1
MAINTAINER Daniel Haus <daniel.haus@businesstools.de>

ENV GRAV_VERSION=1.3.8
ENV PATH="/var/www/html/bin:${PATH}"

WORKDIR /var/www/html

RUN cd /var/www && \
    curl -Ls -o /tmp/grav-admin.zip https://github.com/getgrav/grav/releases/download/${GRAV_VERSION}/grav-admin-v${GRAV_VERSION}.zip && \
    unzip /tmp/grav-admin.zip && \
    rm -rf /tmp/grav-admin.zip html && \
    chown -R www-data:www-data grav-admin && \
    mv grav-admin html && \
    rm -rf html/user

COPY nginx.conf /etc/nginx/sites-available/default
