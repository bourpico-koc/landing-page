# Deploy Instructions for Colify VPS

## Local Development

### Build the Docker image locally:
```bash
docker build -t landing-page:latest .
```

### Run locally for testing:
```bash
docker run -d -p 8080:80 --name landing-page landing-page:latest
```

Then access http://localhost:8080

### Stop the container:
```bash
docker stop landing-page
docker rm landing-page
```

---

## Deployment on Colify VPS

### 1. Push to GitHub (if using CI/CD):
```bash
git add .
git commit -m "Add Docker configuration"
git push origin main
```

### 2. SSH into your VPS:
```bash
ssh user@your-vps-ip
```

### 3. Clone the repository:
```bash
cd /opt
git clone https://github.com/bourpico-koc/landing-page.git
cd landing-page
```

### 4. Build the Docker image:
```bash
docker build -t bourpi-landing:latest .
```

### 5. Run the container:
```bash
docker run -d \
  --name bourpi-landing \
  -p 80:80 \
  --restart always \
  bourpi-landing:latest
```

### 6. Verify it's running:
```bash
docker ps
curl http://localhost
```

---

## Using Docker Compose (Recommended)

Create `docker-compose.yml` in your VPS and run:

```bash
docker-compose up -d
```

---

## Environment Variables (if needed)

Create a `.env` file in the root directory:
```
ENVIRONMENT=production
```

---

## Health Check

Access your landing page:
- **Local**: http://localhost:8080
- **VPS**: http://your-vps-ip

---

## Logs

View Docker logs:
```bash
docker logs bourpi-landing -f
```

---

## Update the Application

After pushing new changes:
```bash
cd landing-page
git pull origin main
docker build -t bourpi-landing:latest .
docker stop bourpi-landing
docker rm bourpi-landing
docker run -d --name bourpi-landing -p 80:80 --restart always bourpi-landing:latest
```

---

## Performance Features

✅ **Gzip Compression** - Reduces file sizes by ~70%
✅ **Cache Headers** - 30-day cache for CSS, JS, images
✅ **SPA Routing** - Supports single-page app routing with fallback to index.html
✅ **Security Headers** - X-Frame-Options, X-Content-Type-Options, etc.
✅ **Alpine Linux** - Lightweight Nginx base image (~10MB)

---

## Troubleshooting

### Port already in use:
```bash
docker run -d -p 3000:80 bourpi-landing:latest
```

### Container won't start:
```bash
docker logs bourpi-landing
```

### Update Nginx config without rebuilding:
Copy `nginx.conf` to running container and reload:
```bash
docker cp nginx.conf bourpi-landing:/etc/nginx/conf.d/default.conf
docker exec bourpi-landing nginx -s reload
```
