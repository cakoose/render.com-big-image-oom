# syntax=docker/dockerfile:1

FROM node:14

WORKDIR /app

COPY package.json yarn.lock .
RUN yarn install --frozen-lockfile

COPY . .
RUN yarn run build

EXPOSE 3000
ENV PORT 3000
ENV NODE_ENV production
CMD ["./node_modules/.bin/next", "start"]
