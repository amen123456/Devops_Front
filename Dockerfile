# stage 1
FROM node:14.17.3 AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build -- --prod

# stage 2
FROM nginx:alpine
COPY nginx.conf  /etc/nginx/conf.d/default.conf
COPY --from=node /app/dist/crudtuto-Front /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]