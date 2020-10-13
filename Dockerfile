# First Phase
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY ./ ./
RUN yarn build

# Second Phase
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
