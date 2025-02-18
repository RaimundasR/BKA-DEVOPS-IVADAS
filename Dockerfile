# Build stage
FROM node:lts-alpine AS build-stage
WORKDIR /app

# Copy package.json first for better build caching
COPY package.json ./
RUN npm install

# Now copy the rest of the application files
COPY . .

# Debugging: Check if files exist before build
RUN ls -al /app  # ✅ Check if all files are copied
RUN npm run build && ls -al /app/dist && cat /app/dist/index.html | head -n 10  # ✅ Ensure build output exists

# Production stage
FROM nginx:stable-alpine AS production-stage

# Copy built Vue.js app to Nginx directory
COPY --from=build-stage /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
