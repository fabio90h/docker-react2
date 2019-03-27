#BASE
FROM node:alpine as builder

#WORKDIR
WORKDIR '/usr/app'

#COPY PACKAGE
COPY ./package.json ./

#INSTALL DEP
RUN npm install

#COPY DIR TO CONTAINER
COPY ./ ./

#RUN BUILD
RUN npm run build

#BASE
FROM nginx

#COPY BUILD TO CONTAINER
COPY --from=builder /usr/app/build /usr/share/nginx/html



