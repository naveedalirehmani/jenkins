# Use official Node.js LTS base image
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy source code and build
COPY . .
RUN npm run build

# Use a minimal Node.js image for running the built app
FROM node:18-alpine
WORKDIR /app
COPY --from=0 /app/dist ./dist
COPY --from=0 /app/package*.json ./
RUN npm install --only=production

# Expose port and start app
EXPOSE 3000
CMD ["node", "dist/index.js"]