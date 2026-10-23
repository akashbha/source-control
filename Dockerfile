# Build stage
FROM node:18 AS build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

COPY index.js ./

# Runtime stage
FROM node:18-slim

WORKDIR /app

COPY --from=build /app /app

EXPOSE 3000

CMD ["node", "index.js"]

