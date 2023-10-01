FROM node:18-alpine

USER node

WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./

RUN npm ci

COPY --chown=node:node . .

ENV NODE_ENV production
RUN npm run build

CMD [ "node", "dist/main.js" ]
