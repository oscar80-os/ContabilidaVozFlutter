#!/bin/bash

# Instalar dependencias
sudo apt-get update
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa

# Descargar Flutter SDK (canal estable)
git clone https://github.com/flutter/flutter.git -b stable /usr/local/flutter

# Agregar Flutter al PATH
echo 'export PATH="$PATH:/usr/local/flutter/bin"' >> ~/.bashrc
source ~/.bashrc

# Verificar instalación
flutter doctor
