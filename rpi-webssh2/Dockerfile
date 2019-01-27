FROM arm32v6/node:alpine

RUN apk --update --upgrade add git

RUN git clone https://github.com/billchurch/WebSSH2.git

WORKDIR /WebSSH2/app

RUN npm install --production

EXPOSE 2222/tcp

#COPY . .

CMD ["npm", "start"]
