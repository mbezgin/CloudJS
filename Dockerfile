FROM node:14-alpine AS builder

WORKDIR /usr/src/app
COPY . .
RUN npm install

FROM alpine
WORKDIR /app
COPY --from=builder /usr/src/app /app/
RUN apk add --update nodejs npm

ARG BASE_IMAGES_REGISTRY="AKIAYNYXFM5ERFW7PJDA.dkr.ecr.us-east-1.amazonaws.com"
ARG BASE_IMAGES_REPOSITORY="base-images"
ARG BASE_NODE_IMAGE_TAG="14-alpine"

EXPOSE 8080
CMD ["node", "./src/main.js"]