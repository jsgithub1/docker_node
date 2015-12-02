FROM node:0.10.40
MAINTAINER James Stuckey <james@krumplr.com>

COPY . /app
WORKDIR /app

RUN npm install

EXPOSE 3000

CMD ["bin/www"]
