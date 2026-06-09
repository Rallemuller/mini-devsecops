# FEJL: En gammel version af node, som er fyldt med kendte sårbarheder
FROM node:20-alpine

WORKDIR /app
COPY . .
RUN npm install express
EXPOSE 3000
CMD ["node", "app.js"]