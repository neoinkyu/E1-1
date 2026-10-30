FROM nginx:alpine

LABEL org.opencontainers.image.title="codyssey-e1-1-web"

COPY site/ /usr/share/nginx/html/

EXPOSE 80
