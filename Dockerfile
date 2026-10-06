# syntax=docker/dockerfile:1
FROM ghcr.io/roffe/gocurl:latest AS gocurl
FROM klakegg/hugo:0.167.0-extended AS hugo

WORKDIR /src
COPY . /src/
RUN git submodule update --init --recursive && hugo --minify --destination /out

FROM nginx:1.27-alpine
COPY --from=hugo /out /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s CMD wget -q -O /dev/null http://127.0.0.1/ || exit 1