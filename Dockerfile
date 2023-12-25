FROM node:14.21-alpine as builder
ENV NODE_ENV=production
WORKDIR /app
COPY build/* .
RUN npm ci
RUN apk add --no-cache bash && \
    wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && \
    chmod +x /bin/wait-for-it.sh
EXPOSE 3001
CMD [ "node", "index.js" ]