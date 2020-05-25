FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

#docker build .
# ...
# Successfully built 8e3219e9526e
# docker run -p 8082:80 8e3219e9526e
# http://localhost:8082/ that's it