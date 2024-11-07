#!/bin/bash

# Actualizar paquetes del sistema
sudo apt-get update -y

# Instalar Docker Compose
DOCKER_COMPOSE_VERSION="2.0.0"
sudo curl -L "https://github.com/docker/compose/releases/download/v$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Aplicar permisos ejecutables a Docker Compose
sudo chmod +x /usr/local/bin/docker-compose

# Verificar la instalación de Docker Compose
docker-compose --version

