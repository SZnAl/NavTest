FROM nginx:1.20.2
RUN sed -i 's#/var/log/nginx/.*.log#/dev/stdout#g' /etc/nginx/nginx.conf
RUN sed -i 's/#gzip/gzip/' /etc/nginx/nginx.conf
RUN sed -i '8s#root   /usr/share/nginx/html#root   /dist#' /etc/nginx/conf.d/default.conf
RUN sed -i 's#index  index.html index.htm;#&\n        try_files $uri $uri/ /index.html;#' /etc/nginx/conf.d/default.conf
COPY --chown=nginx:nginx index.html /dist/
COPY --chown=nginx:nginx css/ /dist/css/
COPY --chown=nginx:nginx i18n/ /dist/i18n/
COPY --chown=nginx:nginx images/ /dist/images/
COPY --chown=nginx:nginx js/ /dist/js/
COPY --chown=nginx:nginx lib/ /dist/lib/