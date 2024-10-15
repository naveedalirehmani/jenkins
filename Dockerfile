# Use the official Nginx image from Docker Hub
FROM nginx:alpine

# Copy the HTML file to the Nginx directory
COPY ./index.html /usr/share/nginx/html/index.html

# Expose port 80 to the outside world
EXPOSE 80
