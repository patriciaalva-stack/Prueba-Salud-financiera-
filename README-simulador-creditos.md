# 🚀 Simulador de Créditos - Prototipos Funcionales

Este repositorio contiene **3 prototipos funcionales** de un simulador de créditos diseñado con enfoque **mobile-first** para ofrecer una experiencia de usuario optimizada en dispositivos móviles.

## 📱 Características Principales

- **Diseño Mobile-First**: Optimizado para dispositivos móviles con responsive design
- **Interfaz Moderna**: Gradientes, sombras y animaciones suaves
- **Cálculos en Tiempo Real**: Actualización automática de resultados
- **Múltiples Opciones de Pago**: Diferentes modalidades de financiamiento
- **Agente Virtual**: Chatbot inteligente para simulación conversacional

## 🎯 Prototipos Disponibles

### 1. **Prototipo Básico** (`prototipo-1-basico.html`)
- **Funcionalidad**: Simulador simple de créditos con cálculo de cuotas mensuales
- **Características**:
  - Cálculo de cuota mensual
  - Plazos de 12 a 60 meses
  - Tasa de interés personalizable
  - Resultados en tiempo real
  - Diseño limpio y minimalista

### 2. **Prototipo Avanzado** (`prototipo-2-avanzado.html`)
- **Funcionalidad**: Simulador con múltiples opciones de pago
- **Características**:
  - **3 Métodos de Pago**:
    - 📅 **Cuotas Mensuales**: Pago fijo mensual tradicional
    - 📊 **Pago Diario**: Pago diario fijo hasta completar
    - 💼 **Porcentaje de Ventas**: Pago variable basado en ventas
  - Cálculos avanzados para cada modalidad
  - Estimación de duración del préstamo
  - Información contextual para cada opción

### 3. **Prototipo con Agente Virtual** (`prototipo-3-agente-virtual.html`)
- **Funcionalidad**: Simulador conversacional con chatbot inteligente
- **Características**:
  - 🤖 **Chatbot Interactivo**: Conversación natural en español
  - **Botones de Acción Rápida**: Opciones predefinidas para facilitar uso
  - **Extracción Inteligente**: Detecta automáticamente montos, plazos e intereses
  - **Simulación Conversacional**: Guía paso a paso para obtener datos
  - **Indicador de Escritura**: Simula respuesta humana del bot

## 🛠️ Tecnologías Utilizadas

- **HTML5**: Estructura semántica moderna
- **CSS3**: 
  - Flexbox y Grid para layouts
  - Gradientes y sombras
  - Animaciones CSS (keyframes)
  - Media queries para responsive design
- **JavaScript Vanilla**: 
  - Funciones de cálculo financiero
  - Manipulación del DOM
  - Event listeners
  - Lógica de chatbot

## 📱 Diseño Mobile-First

### Características de Diseño:
- **Breakpoint Principal**: 480px para dispositivos móviles
- **Contenedor Responsivo**: Máximo 450px de ancho
- **Botones Touch-Friendly**: Tamaño mínimo de 44px
- **Tipografía Escalable**: Tamaños adaptables
- **Espaciado Optimizado**: Padding y margins para móviles

### Responsive Features:
- Bordes redondeados adaptativos
- Sombras y efectos visuales
- Animaciones suaves
- Scroll optimizado para touch

## 🧮 Algoritmos de Cálculo

### Fórmula de Amortización (Cuotas Mensuales):
```
Cuota Mensual = P × (r × (1 + r)^n) / ((1 + r)^n - 1)
```
Donde:
- P = Principal (monto del préstamo)
- r = Tasa de interés mensual
- n = Número de meses

### Cálculo de Intereses:
- **Interés Simple**: Para pagos diarios
- **Interés Compuesto**: Para cuotas mensuales
- **Porcentaje de Ventas**: Cálculo variable mensual

## 🚀 Cómo Usar

### Para Desarrolladores:
1. Clona el repositorio
2. Abre cualquier prototipo en tu navegador
3. Los archivos son completamente funcionales sin dependencias externas

### Para Usuarios Finales:
1. **Prototipo Básico**: Ideal para cálculos rápidos y simples
2. **Prototipo Avanzado**: Perfecto para comparar diferentes modalidades
3. **Prototipo Agente Virtual**: Experiencia conversacional y guiada

## 📊 Casos de Uso

### Personas Físicas:
- Préstamos personales
- Financiamiento de vehículos
- Créditos hipotecarios
- Microcréditos

### Empresas:
- Capital de trabajo
- Financiamiento de equipos
- Líneas de crédito
- Factoring

## 🔮 Próximas Funcionalidades

- [ ] Integración con APIs de tasas de interés
- [ ] Historial de simulaciones
- [ ] Exportación de resultados en PDF
- [ ] Múltiples monedas
- [ ] Comparador de ofertas
- [ ] Integración con sistemas de scoring

## 📝 Notas Técnicas

- **Compatibilidad**: Funciona en todos los navegadores modernos
- **Performance**: Cálculos optimizados para dispositivos móviles
- **Accesibilidad**: Contraste adecuado y navegación por teclado
- **SEO**: Meta tags y estructura semántica optimizada

## 🤝 Contribuciones

Este es un proyecto de prototipado. Las contribuciones son bienvenidas para:
- Mejoras en la UI/UX
- Nuevos algoritmos de cálculo
- Optimizaciones de performance
- Nuevas modalidades de pago

## 📄 Licencia

Proyecto educativo y de prototipado. Libre para uso personal y comercial.

---

**Desarrollado con ❤️ para facilitar la simulación de créditos de forma accesible y moderna.**
