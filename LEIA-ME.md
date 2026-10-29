# Meu Ritmo — como colocar o app no ar (de graça)

O app é um site que pode ser instalado (PWA). Qualquer pessoa abre o link, toca em
**Menu → Instalar app**, e ele ganha um ícone na tela inicial do celular ou no menu
Iniciar do Windows. Ele funciona sem internet depois de aberto uma vez.

Os dados de cada pessoa ficam só no aparelho dela. Não há servidor, login nem custo.
Para levar os dados a outro aparelho, use **Personalizar → Exportar backup** e depois
**Importar backup** no outro aparelho.

## Arquivos

| Arquivo | Para que serve |
|---|---|
| `index.html` | O app inteiro |
| `manifest.webmanifest` | Nome, ícone e cores do app instalado |
| `sw.js` | Faz o app abrir sem internet |
| `icons/` | Ícones do app |

## Opção A: GitHub Pages (recomendado)

1. Crie uma conta gratuita em github.com.
2. Clique em **New repository**, dê o nome `meu-ritmo`, deixe **Public** e crie.
3. Na página do repositório, clique em **Add file → Upload files** e arraste **todos os
   arquivos desta pasta** (incluindo a pasta `icons`). Clique em **Commit changes**.
4. Vá em **Settings → Pages**. Em *Source* escolha **Deploy from a branch**, branch
   **main**, pasta **/ (root)**, e salve.
5. Em um ou dois minutos o app estará em `https://SEU-USUARIO.github.io/meu-ritmo/`.
   Esse é o link para mandar às pessoas.

## Opção B: Netlify Drop

1. Acesse app.netlify.com/drop.
2. Arraste esta pasta inteira para a página.
3. Crie uma conta gratuita quando ele pedir, para o site não expirar.
4. O Netlify mostra o link do app (dá para trocar o nome em *Site settings*).

## Como instalar (para quem vai usar)

- **Android / Chrome / Edge no PC:** abra o link → **Menu → Instalar app**
  (ou o ícone de instalar na barra de endereço).
- **iPhone / iPad:** abra o link no **Safari** → botão **Compartilhar** →
  **Adicionar à Tela de Início**.

## Publicando uma atualização

1. Substitua os arquivos alterados no GitHub (ou arraste a pasta de novo no Netlify).
2. Em `sw.js`, aumente a versão: `meu-ritmo-v1` → `meu-ritmo-v2`.
   Assim os aparelhos que já instalaram baixam a versão nova.

Os dados das pessoas não são apagados ao atualizar.

## Próximo passo (quando quiser)

Para sincronizar entre aparelhos e ter login, dá para ligar o app a um serviço como
Supabase ou Firebase, que têm plano gratuito.
