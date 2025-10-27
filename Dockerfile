FROM nginx:alpine

# Remove default config
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom config
COPY default.conf /etc/nginx/conf.d/

# Copy static files
COPY . /usr/share/nginx/html

EXPOSE 8000
CMD ["nginx", "-g", "daemon off;"]
