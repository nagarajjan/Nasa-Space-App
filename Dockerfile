# Production Dockerfile for AEGIS-NEO Platform
# Ultra-lightweight Alpine Nginx image (<25MB)
FROM nginx:alpine

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy application files
COPY . /usr/share/nginx/html/

# Expose standard HTTP port
EXPOSE 80

# Healthcheck for container orchestration (Kubernetes / AWS ECS / Portainer)
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
