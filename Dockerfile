# Build stage
FROM node:lts-alpine AS build-stage
WORKDIR /app

# Copy package.json and package-lock.json explicitly
COPY package.json ./

# Verify if package.json is actually copied
RUN ls -l /app

# Install dependencies
RUN npm install

# Now copy the rest of the application
COPY . .

# Build the Vue.js app
RUN npm run build

# Production stage
FROM nginx:stable-alpine AS production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

