# Baseimage for Grav CMS

https://getgrav.org

This image contains `node` and `yarn` as well, so things
like `node-sass` might be easily added and integrated
through a single `package.json`.

## Usage

Copy `user` folder to `/var/www/html/user` and populate
as described in the Grav [documentation](https://learn.getgrav.org/basics/folder-structure#user).

Here's an minimal example `Dockerfile`:

    FROM businesstools/grav:latest
    COPY user/ /var/www/html/user

and `docker-compose.yml` for development, meant to be used with
[nginx-proxy](https://github.com/jwilder/nginx-proxy) and a local
[dnsmasq](https://passingcuriosity.com/2013/dnsmasq-dev-osx/):

    version: '2'
    services:
      web:
        build: .
        volumes:
          - ./user:/var/www/html/user
        environment:
          VIRTUAL_HOST: my-site.dkr
        network_mode: "bridge"


The container can be started by issuing `docker-compose up`,
then accessed at [`http://my-site.dkr/`](http://my-site.dkr/).

Once the container is running, CLI utilities can be called
like:

    docker-compose exec web grav …
    docker-compose exec web gpm …
    docker-compose exec web plugin …
