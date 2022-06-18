FROM node:18-slim

USER root

RUN npm install --location=global @angular/cli@14.0.0

USER node

WORKDIR /home/node/app/angular

#CMD ["tail", "-f", "/dev/null"]
CMD ["sh", "-c", "npm install && npm start"]
