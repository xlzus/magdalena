# Stage 1: Build the MkDocs static site
FROM python:3.12-slim AS builder

WORKDIR /docs

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
RUN mkdocs build --strict

# Stage 2: Serve with nginx
FROM nginx:1.27-alpine

# Remove default nginx static content
RUN rm -rf /usr/share/nginx/html/*

# Copy the built site from the builder stage
COPY --from=builder /docs/site /usr/share/nginx/html

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
