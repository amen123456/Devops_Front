# stage 1
FROM node:14 AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/crudtuto-Front /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]