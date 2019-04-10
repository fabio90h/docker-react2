#BASE
FROM node:alpine as builder

#WORKDIR
WORKDIR /app

#COPY DEP
COPY ./package.json ./

#INSTALL DEP
RUN npm install

#COPY DIR
COPY ./ ./

#RUN BUILD
RUN npm run build

#BASE
FROM nginx

#COPY
COPY --from=builder /app/build /usr/share/nginx/html



