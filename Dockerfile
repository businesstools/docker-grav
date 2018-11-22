FROM businesstools/nginx-php:1.9.3

ENV GRAV_VERSION=1.5.5
ENV PATH="/var/www/html/bin:${PATH}"

WORKDIR /var/www

RUN curl -Ls -o /tmp/grav-admin.zip https://github.com/getgrav/grav/releases/download/${GRAV_VERSION}/grav-admin-v${GRAV_VERSION}.zip && \
    unzip /tmp/grav-admin.zip && \
    rm -rf /tmp/grav-admin.zip html && \
    chown -R www-data:www-data grav-admin && \
    mv grav-admin html && \
    rm -rf html/user

COPY nginx.conf /etc/nginx/conf.d/default.conf
