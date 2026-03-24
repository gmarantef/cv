#!/usr/bin/env bash
# render.sh — Genera los PDFs del CV sustituyendo los placeholders de contacto
# Requiere: pandoc, yq (https://github.com/mikefarah/yq)

set -euo pipefail

CONTACT_FILE="contact.yml"

# Verificar que existe el fichero de contacto
if [ ! -f "$CONTACT_FILE" ]; then
  echo "Error: no se encuentra $CONTACT_FILE"
  exit 1
fi

# Leer valores del fichero de contacto
PHONE=$(yq -r '.phone' "$CONTACT_FILE")
EMAIL=$(yq -r '.email' "$CONTACT_FILE")

# Función que sustituye placeholders y genera PDF
render() {
  local input="$1"
  local output="$2"
  local lang="$3"

  echo "Generando $output..."

  # Sustituir placeholders en un fichero temporal
  local tmp=$(mktemp /tmp/cv_XXXXXX.md)
  sed "s|{{phone}}|$PHONE|g; s|{{email}}|$EMAIL|g" "$input" > "$tmp"

  # Generar PDF con Pandoc
  pandoc "$tmp" \
    -o "$output" \
    --pdf-engine=wkhtmltopdf \
    -V margin-top=20mm \
    -V margin-bottom=20mm \
    -V margin-left=20mm \
    -V margin-right=20mm \
    -V fontsize=11pt

  rm "$tmp"
  echo "  → $output generado correctamente"
}

# Generar ambas versiones
render "cv-es.md" "cv-es.pdf" "es"
render "cv-en.md" "cv-en.pdf" "en"

echo ""
echo "CVs generados: cv-es.pdf · cv-en.pdf"
