### STAGE: 1
# Getting alpine image from docker hub
FROM alpine:3.15 as build

# Installing node and npm as a dependencies
RUN apk update && \
    apk add nodejs && \
    apk add npm

# Creating build directory
RUN mkdir -p /usr/build
WORKDIR /usr/build

# Copying package and package.lock
COPY package*.json ./

# Installing dependencies
RUN npm install

# Copying our app to workdir folder
COPY . .

# Building the application
RUN npm run build

### STAGE: 2
# Getting nginx image from docker hub
FROM nginx:stable-alpine

# Copying bundled app to nginx html folder
COPY --from=build /usr/build/build /usr/share/nginx/html

# Exposing ports and running nginx
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]
