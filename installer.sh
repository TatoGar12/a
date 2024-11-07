#!/bin/bash

# Actualizar paquetes del sistema
sudo apt-get update -y

# Instalar dependencias necesarias
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    gnupg \
    lsb-release

# Agregar la clave GPG oficial de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Agregar el repositorio de Docker al sistema
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Actualizar el índice de paquetes e instalar Docker Engine
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Agregar el usuario actual al grupo docker (opcional: para evitar usar sudo con Docker)
sudo usermod -aG docker $USER

# Instalar Docker Compose
DOCKER_COMPOSE_VERSION="2.0.0"
sudo curl -L "https://github.com/docker/compose/releases/download/v$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Aplicar permisos ejecutables a Docker Compose
sudo chmod +x /usr/local/bin/docker-compose

# Verificar la instalación de Docker y Docker Compose
docker --version
docker-compose --version

# Instalar el servidor SSH
sudo apt-get install -y openssh-server

# Habilitar y arrancar el servicio SSH
sudo systemctl enable ssh
sudo systemctl start ssh

# Mostrar el estado del servicio SSH
sudo systemctl status ssh

# Actualizar todo el sistema
sudo apt-get upgrade -y
