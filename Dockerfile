
FROM node:14 AS builder
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
# RUN npm run build

FROM node:14
WORKDIR /app
COPY --from=builder /app .
CMD ["node", "index.js"]
