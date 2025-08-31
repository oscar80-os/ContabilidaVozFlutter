#!/bin/bash
echo "🚀 Compilando APK en modo release..."
flutter build apk --release

echo "📦 Copiando APK a la raíz del proyecto..."
cp build/app/outputs/flutter-apk/app-release.apk ./app-release.apk

echo "✅ APK listo: ./app-release.apk"
echo "Ahora lo puedes descargar desde el explorador de archivos de Codespaces (clic derecho ➝ Download)"
