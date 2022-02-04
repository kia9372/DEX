FROM node:latest
WORKDIR /
COPY package.json .
RUN npm cache clean --force 
RUN npm install
COPY . .
EXPOSE 1348
CMD ["npm","start"]