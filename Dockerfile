FROM dockerfile/nodejs

# bug fix (https://github.com/joyent/node/issues/3911)
RUN ln -s /usr/local/bin/node /usr/bin/node
RUN npm i coffee-script bower gulp -g

# for cdn
RUN apt-get update -y
RUN apt-get install -y zip
 
WORKDIR /app

ADD package.json /app/package.json
RUN npm i

ADD bower.json /app/bower.json
RUN bower i --allow-root

