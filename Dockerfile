# Use the official Nginx image as base
FROM nginx:alpine

# Remove default Nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy project files to Nginx html directory
COPY index.html /usr/share/nginx/html/
COPY logo_azul.png /usr/share/nginx/html/
COPY mujer-fitness-usando-el-telefono-movil.jpg /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
