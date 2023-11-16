# node block

FROM node:alpine3.18 as nodework
WORKDIR /hello-devops
COPY package.json .
COPY . .
RUN npm install
RUN npm run build


# nginx block

FROM nginx:1.25.2-alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=nodework /hello-devops/build .
ENTRYPOINT [ "nginx","-g","daemon off;" ]




