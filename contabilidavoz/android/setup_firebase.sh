#!/bin/bash

echo "🚀 Configurando Firebase en Android..."

# Archivos
PROJECT_FILE="build.gradle.kts"
APP_FILE="app/build.gradle.kts"

# 1. Agregar google-services en nivel de proyecto
if grep -q 'com.google.gms.google-services' $PROJECT_FILE; then
  echo "✅ Plugin Google Services ya existe en $PROJECT_FILE"
  else
    sed -i '/^plugins {/a\    id("com.google.gms.google-services") version "4.4.3" apply false' $PROJECT_FILE
      echo "✅ Plugin Google Services agregado en $PROJECT_FILE"
      fi

      # 2. Agregar plugin en nivel de app
      if grep -q 'com.google.gms.google-services' $APP_FILE; then
        echo "✅ Plugin Google Services ya existe en $APP_FILE"
        else
          sed -i '/^plugins {/a\    id("com.google.gms.google-services")' $APP_FILE
            echo "✅ Plugin Google Services agregado en $APP_FILE"
            fi

            # 3. Agregar dependencias Firebase
            if grep -q 'firebase-bom' $APP_FILE; then
              echo "✅ Dependencias Firebase ya existen en $APP_FILE"
              else
        sed -i '/^dependencias {/a\ implementación(plataforma("com.google.firebase:firebase-bom:34.1.0"))\n implementación("com.google.firebase:firebase-auth")\n implementación("com.google.firebase:firebase-firestore")' $APP_FILE         sed -i '/^dependencies {/a\    implementation(platform("com.google.firebase:firebase-bom:34.1.0"))\n    implementation("com.google.firebase:firebase-auth")\n    implementation("com.google.firebase:firebase-firestore")' $APP_FILE
                  echo "✅ Dependencias Firebase agregadas en $APP_FILE"
                  fi

                  # 4. Copiar google-services.json si está en la raíz Flutter
                  if [ -f "../google-services.json" ]; then
                    cp ../google-services.json app/
                      echo "✅ google-services.json copiado a /app/"
                      else
                        echo "⚠️ No se encontró google-services.json en la raíz del proyecto Flutter."
                        fi

                        echo "🎉 Configuración Firebase completada."
