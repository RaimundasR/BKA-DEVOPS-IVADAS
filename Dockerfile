# Build stage
FROM node:lts-alpine AS build-stage
WORKDIR /app

# Copy package.json first for better build caching
COPY package.json  ./
RUN npm install

# Now copy the rest of the application files
COPY . .


# Production stage
FROM nginx:stable-alpine AS production-stage

# Copy built Vue.js app to Nginx directory
COPY --from=build-stage /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
