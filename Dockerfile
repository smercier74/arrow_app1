FROM mhart/alpine-node:5.12.0

# This is the script to start app
COPY start_app /usr/local/bin/
RUN chmod 755 /usr/local/bin/start_app

RUN mkdir -p /opt/app
WORKDIR /opt/app

COPY package.json /opt/app
COPY app.js /opt/app
COPY README.md /opt/app

RUN npm install

ENTRYPOINT ["/usr/local/bin/start_app"]