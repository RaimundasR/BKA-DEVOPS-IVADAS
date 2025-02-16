# Build stage
FROM node:lts-alpine AS build-stage
WORKDIR /app

# Copy package.json first to cache dependencies
COPY package.json package-lock.json ./
RUN npm install

# Now copy the rest of the app, including index.html
COPY . .

# Build the Vue.js app
RUN npm run build

# Production stage
FROM nginx:stable-alpine AS production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
