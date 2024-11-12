# FROM node:16-alpine
FROM node:18.20.4-bookworm-slim
ENV NODE_ENV development
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json .
# RUN npm install
RUN yarn install

# add app
COPY . .
COPY .env .
# RUN npm run build
RUN yarn build

EXPOSE 4173
# start app
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0"]