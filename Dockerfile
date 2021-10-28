FROM nginx:latest
RUN mkdir /usr/share/nginx/html/myfiles
COPY index.html /usr/share/nginx/html/myfiles/
COPY default.conf /etc/nginx/conf.d/

