# Use the official node image as the base image
FROM node:20-alpine as build-stage
# Set the working directory
WORKDIR /app
# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./
# Install dependencies
RUN npm install --legacy-peer-deps
# Copy the rest of the application code to the working directory
COPY . .
# Build the Vue.js application for production
RUN npm run build
# Use the official nginx image as the base image for serving the application
FROM nginx:stable-alpine as production-stage
# Copy the built files from the build-stage to the nginx html directory
COPY --from=build-stage /app/dist /usr/share/nginx/html
# Copy custom nginx configuration files
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 3000
#CMD ["nginx", "-g", "deamon off;"]