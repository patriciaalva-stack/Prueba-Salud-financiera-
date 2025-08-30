#!/bin/bash

echo "📝 CREANDO GIST PÚBLICO DEL PROTOTIPO"
echo "======================================"
echo ""

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Verificar si los archivos existen
if [ ! -f "github-index.html" ]; then
    print_error "Archivo github-index.html no encontrado"
    exit 1
fi

if [ ! -f "README-github.md" ]; then
    print_error "Archivo README-github.md no encontrado"
    exit 1
fi

print_status "Leyendo archivos del prototipo..."

# Leer el contenido de los archivos
HTML_CONTENT=$(cat github-index.html)
README_CONTENT=$(cat README-github.md)

# Crear el JSON para el Gist
GIST_DATA=$(cat <<EOF
{
  "description": "Protótipo Mobile - Experiência Maria no Mercado Pago Crédito",
  "public": true,
  "files": {
    "mercado-pago-prototype.html": {
      "content": $(jq -Rs . <<< "$HTML_CONTENT")
    },
    "README.md": {
      "content": $(jq -Rs . <<< "$README_CONTENT")
    }
  }
}
EOF
)

print_status "Creando Gist público en GitHub..."

# Verificar si jq está instalado
if ! command -v jq &> /dev/null; then
    print_warning "jq no está instalado. Instalándolo..."
    # Intentar instalar jq
    if command -v brew &> /dev/null; then
        brew install jq
    else
        print_error "Por favor instala jq manualmente: brew install jq"
        echo ""
        echo "O crea el Gist manualmente en: https://gist.github.com/"
        echo "1. Copia el contenido de github-index.html"
        echo "2. Pégalo en un nuevo Gist público"
        echo "3. Agrega README-github.md como segundo archivo"
        exit 1
    fi
fi

# Crear el Gist usando la API de GitHub
RESPONSE=$(curl -s -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -d "$GIST_DATA" \
  https://api.github.com/gists)

# Verificar si se creó correctamente
if echo "$RESPONSE" | grep -q '"html_url"'; then
    GIST_URL=$(echo "$RESPONSE" | jq -r '.html_url')
    RAW_URL=$(echo "$RESPONSE" | jq -r '.files["mercado-pago-prototype.html"].raw_url')

    print_success "¡Gist creado exitosamente!"
    echo ""
    echo "🌐 URLS DE ACCESO:"
    echo "=================="
    echo "Gist Principal: $GIST_URL"
    echo "Demo Online: https://htmlpreview.github.io/?$RAW_URL"
    echo ""
    print_success "¡Comparte estas URLs con tu equipo!"
    echo ""
    echo "💡 Para incrustar en otros sitios:"
    echo "<iframe src=\"https://htmlpreview.github.io/?$RAW_URL\" width=\"375\" height=\"667\" frameborder=\"0\"></iframe>"

else
    print_error "Error al crear el Gist"
    echo ""
    print_warning "Crea el Gist manualmente:"
    echo "1. Ve a: https://gist.github.com/"
    echo "2. Crea un nuevo Gist público"
    echo "3. Copia el contenido de github-index.html"
    echo "4. Nómbralo: mercado-pago-prototype.html"
    echo "5. Agrega README-github.md como segundo archivo"
    echo ""
    echo "Después podrás usar:"
    echo "https://htmlpreview.github.io/?[URL-DEL-GIST-RAW]"
fi

echo ""
print_success "¡Proceso completado!"
