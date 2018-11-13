FROM node:10.13.0 as build
RUN mkdir /build
COPY . /build/
WORKDIR /build
RUN npm install
RUN npm run build

FROM nginx:1.15.5

COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /build/assets/ /usr/share/nginx/html/
CMD /bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'