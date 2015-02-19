FROM node
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN npm i
ENV PATH $PATH:/app/node_modules/.bin

CMD ["npm","start"]