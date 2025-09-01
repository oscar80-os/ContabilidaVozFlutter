#!/bin/bash

echo "🚀 Iniciando instalación del SDK de Android..."

# Instalar dependencias
sudo apt update
sudo apt install -y openjdk-11-jdk unzip wget

# Descargar SDK de línea de comandos
cd ~
wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip -O cmdline-tools.zip
unzip -o cmdline-tools.zip -d android-sdk

# Crear estructura correcta
rm -rf android-sdk/cmdline-tools/latest
mkdir -p android-sdk/cmdline-tools/latest
mv android-sdk/cmdline-tools/bin android-sdk/cmdline-tools/latest/
mv android-sdk/cmdline-tools/lib android-sdk/cmdline-tools/latest/

# Configurar variables de entorno
echo 'export ANDROID_SDK_ROOT=$HOME/android-sdk' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools' >> ~/.bashrc
source ~/.bashrc

# Instalar plataformas y herramientas de Android
sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.2"

echo "✅ SDK de Android instalado y configurado"

# Volver al proyecto Flutter
cd /workspaces/ContabilidaVozFlutter/contabilidavoz

# Limpiar y obtener dependencias
flutter clean
flutter pub get

# Compilar APK release
echo "📦 Compilando APK release..."
flutter build apk --release

# Copiar APK a la raíz del proyecto
cp build/app/outputs/flutter-apk/app-release.apk ./app-release.apk

echo "🎉 APK listo en: $(pwd)/app-release.apk"
