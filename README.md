# Protótipo Mobile - Mercado Pago Crédito

Este é um protótipo mobile navegável para a experiência de uma vendedora (Maria) buscando soluções de crédito no Mercado Pago.

## Características do Design

- **Tipografia**: Inter (Google Fonts)
- **Paleta de Cores**: Apenas branco (#FFFFFF), preto (#000000), cinza-escuro (#222222), cinza-claro (#E5E5E5)
- **Bordas**: Arredondadas com radius de 16px
- **Navegação**: Superior discreta com logo à esquerda e seção ao centro
- **Interface**: Minimalista e arejada

## Telas Implementadas

### 1. Bem-vinda Maria
- Saudação personalizada
- Cartão com avatar, saldo atual e resumo de vendas recentes

### 2. Seleção de Produtos de Crédito
- Grade de cards para 5 produtos:
  - Empréstimo Pessoal (💰)
  - Antecipação de Recebíveis (📄)
  - Limite Rotativo (🔄)
  - Crédito para Estoque (📦)
  - Cartão Empresarial (💳)

### 3. Simulação Personalizada
- Input rápido de valor com botões (+500, +1000, Tudo)
- Toggle entre juros baixos e parcela menor
- Cards de comparação (Receber Tudo Agora vs Receber Parcial)
- Gráfico simples de projeção de saldo
- Área de resumo com valor líquido, juros, data do saque e valor das parcelas

### 4. Formalização/Confirmação
- Revisão do pedido
- Mensagem de confirmação com aprovação instantânea
- Botões de ação (Voltar ao início, Ver detalhes)

## Navegação

- **Seta superior direita**: Avança para próxima tela
- **Pontos de navegação**: Permite pular diretamente para qualquer tela
- **Cards de produto**: Clicáveis, levam à tela de simulação
- **Interatividade**: Todos os elementos são funcionais

## Como Usar

1. Abra o arquivo `index.html` em um navegador
2. Ou execute um servidor local:
   ```bash
   cd "/Users/spatricia/Prueba 1"
   python3 -m http.server 8000
   ```
3. Acesse `http://localhost:8000` no navegador
4. Navegue pelas telas usando a seta ou os pontos de navegação

## Responsividade

O protótipo está otimizado para dispositivos móveis (375px de largura) mas funciona bem em telas maiores, simulando a experiência mobile.

## Tecnologias

- HTML5
- CSS3 (com variáveis CSS)
- JavaScript (navegabilidade)
- Google Fonts (Inter)
