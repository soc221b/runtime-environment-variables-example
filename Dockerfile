FROM node:18 as build
WORKDIR /app
COPY package.json .
COPY package-lock.json .
RUN npm ci
COPY webpack.config.js .
COPY src ./src
RUN npx cross-env NODE_ENV=production webpack

FROM nginx:1.22.0-alpine
WORKDIR /app
COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh .
COPY --from=build /app/dist ./dist
ENTRYPOINT [ "sh", "/app/entrypoint.sh" ]
