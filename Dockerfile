FROM node:0.10.40
MAINTAINER James Stuckey <james@krumplr.com>

# Install dependencies in separate layer so they can be cached independent of our source code
COPY package.json /app/package.json
WORKDIR /app
RUN npm install && npm cache clean

COPY . /app

EXPOSE 3000

CMD ["npm", "start"]
