FROM node:10.13.0 as build
RUN mkdir /build
COPY . /build/
WORKDIR /build
RUN npm install
RUN npm run build

FROM nginx:1.15.3-alpine
COPY --from=build /build/assets/ /usr/share/nginx/html/
EXPOSE 80