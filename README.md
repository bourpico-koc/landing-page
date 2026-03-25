# Bourpi Landing Page

Landing page estática para Bourpi - Plataforma de gestión profesional de planes de entrenamiento.

## 📁 Estructura

```
landing_page/
├── index.html                          # Página principal
├── logo_azul.png                       # Logo de Bourpi
├── mujer-fitness-usando-el-telefono-movil.jpg  # Imagen hero
├── Dockerfile                          # Configuración Docker
├── nginx.conf                          # Configuración Nginx
├── docker-compose.yml                  # Orquestación Docker
├── .dockerignore                       # Archivos a ignorar en Docker
├── .gitignore                          # Archivos a ignorar en Git
└── DEPLOY.md                          # Guía de deployment
```

## 🚀 Quick Start

### Local Development

```bash
# Build imagen
docker build -t bourpi-landing:latest .

# Ejecutar
docker run -d -p 8080:80 bourpi-landing:latest

# Acceder
http://localhost:8080
```

### Usando Docker Compose

```bash
docker-compose up -d
```

## 📋 Características de Nginx

- ✅ Compresión Gzip (reducción ~70%)
- ✅ Cache para assets estáticos (30 días)
- ✅ Headers de seguridad
- ✅ Soporte para SPA routing
- ✅ Logs de acceso y errores
- ✅ Rechazo de archivos ocultos

## 🌐 Deployment en Colify VPS

Ver [DEPLOY.md](DEPLOY.md) para instrucciones completas.

```bash
# SSH a VPS
ssh user@vps-ip

# Clonar repo
git clone https://github.com/bourpico-koc/landing-page.git
cd landing-page

# Build y run
docker build -t bourpi-landing:latest .
docker run -d --name bourpi-landing -p 80:80 --restart always bourpi-landing:latest
```

## 📞 Contacto

© 2025 Bourpi. Todos los derechos reservados.
