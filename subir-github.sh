#!/bin/bash

echo "🚀 SUBIDA AUTOMATIZADA DEL PROTOTIPO A GITHUB"
echo "=============================================="
echo ""

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Función para imprimir con color
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

# Verificar si git está instalado
if ! command -v git &> /dev/null; then
    print_error "Git no está instalado. Instálalo primero."
    exit 1
fi

# Verificar si estamos en el directorio correcto
if [ ! -f "github-index.html" ]; then
    print_error "Archivo github-index.html no encontrado. Ejecuta este script desde el directorio del proyecto."
    exit 1
fi

print_status "Verificando configuración de Git..."

# Configurar Git si no está configurado
if [ -z "$(git config --global user.name)" ]; then
    read -p "Ingresa tu nombre para Git: " git_name
    git config --global user.name "$git_name"
fi

if [ -z "$(git config --global user.email)" ]; then
    read -p "Ingresa tu email para Git: " git_email
    git config --global user.email "$git_email"
fi

print_success "Git configurado correctamente"

# Crear nuevo repositorio Git
print_status "Inicializando repositorio Git..."
rm -rf .git
git init
git add github-index.html README-github.md
git commit -m "Add Mercado Pago credit prototype - Maria's experience

- 4 interactive screens (Welcome, Product Selection, Simulation, Confirmation)
- Minimalist design with Inter typography
- Black, white, and gray color palette
- Rounded borders (16px radius)
- Mobile-first responsive design
- Full navigation between screens"

print_success "Commit creado exitosamente"

# Preguntar por el nombre del repositorio
echo ""
read -p "Ingresa el nombre para tu repositorio GitHub (ej: mercado-pago-prototype): " repo_name

if [ -z "$repo_name" ]; then
    repo_name="mercado-pago-prototype"
fi

print_status "Creando repositorio '$repo_name' en GitHub..."

# Crear repositorio en GitHub (requiere autenticación)
echo ""
echo "IMPORTANTE: Necesitas tener GitHub CLI instalado o crear el repositorio manualmente."
echo ""
echo "OPCION 1 - GitHub CLI (recomendado):"
echo "1. Instala GitHub CLI: brew install gh"
echo "2. Ejecuta: gh auth login"
echo "3. Luego ejecuta: gh repo create $repo_name --public --source=. --push"
echo ""
echo "OPCION 2 - Manual:"
echo "1. Ve a https://github.com/new"
echo "2. Crea un repositorio público llamado '$repo_name'"
echo "3. Copia la URL del repositorio"
echo ""

read -p "¿Ya tienes GitHub CLI instalado y configurado? (y/n): " has_gh_cli

if [ "$has_gh_cli" = "y" ] || [ "$has_gh_cli" = "Y" ]; then
    if command -v gh &> /dev/null; then
        print_status "Subiendo a GitHub con GitHub CLI..."
        gh repo create "$repo_name" --public --source=. --push

        if [ $? -eq 0 ]; then
            # Obtener el nombre de usuario de GitHub
            github_user=$(gh auth status 2>/dev/null | grep "Logged in to github.com as" | awk '{print $6}')
            if [ -n "$github_user" ]; then
                print_success "¡Repositorio creado exitosamente!"
                echo ""
                echo "🌐 URLS DE ACCESO:"
                echo "========================================"
                echo "Repositorio: https://github.com/$github_user/$repo_name"
                echo "Demo Online: https://$github_user.github.io/$repo_name/github-index.html"
                echo "HTML Preview: https://htmlpreview.github.io/?https://github.com/$github_user/$repo_name/blob/main/github-index.html"
                echo ""
                print_success "¡Comparte estas URLs con tu equipo!"
            fi
        else
            print_error "Error al crear repositorio con GitHub CLI"
            print_warning "Crea el repositorio manualmente en GitHub y sube los archivos"
        fi
    else
        print_error "GitHub CLI no está instalado"
        print_warning "Instala GitHub CLI con: brew install gh"
    fi
else
    print_warning "Creación manual requerida"
    echo ""
    echo "INSTRUCCIONES PARA SUBIR MANUALMENTE:"
    echo "======================================"
    echo "1. Ve a: https://github.com/new"
    echo "2. Nombre: $repo_name"
    echo "3. Público: ✓"
    echo "4. NO marques 'Add README' ni '.gitignore'"
    echo "5. Crea el repositorio"
    echo ""
    echo "6. Copia estas instrucciones:"
    echo "   cd /Users/spatricia/Prueba\\ 1"
    echo "   git remote add origin https://github.com/TU-USUARIO/$repo_name.git"
    echo "   git push -u origin main"
    echo ""
    echo "7. Después de subir, activa GitHub Pages:"
    echo "   - Settings → Pages"
    echo "   - Source: Deploy from a branch"
    echo "   - Branch: main → Save"
    echo ""
    echo "8. URLs finales:"
    echo "   - Repositorio: https://github.com/TU-USUARIO/$repo_name"
    echo "   - Demo: https://TU-USUARIO.github.io/$repo_name/github-index.html"
    echo "   - Preview: https://htmlpreview.github.io/?https://github.com/TU-USUARIO/$repo_name/blob/main/github-index.html"
fi

echo ""
print_success "¡Script completado!"
echo "El prototipo está listo para ser compartido con tu equipo."
