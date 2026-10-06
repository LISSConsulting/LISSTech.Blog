# syntax=docker/dockerfile:1
ARG HUGO_VERSION=0.165.0

FROM hugomods/hugo:debian-reg-go-non-root-${HUGO_VERSION} AS hugo

WORKDIR /src
COPY . /src/
RUN hugo --minify --destination /out --themesDir themes --theme PaperMod

FROM nginx:1.27-alpine
COPY --from=hugo /out /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s CMD wget -q -O /dev/null http://127.0.0.1/ || exit 1