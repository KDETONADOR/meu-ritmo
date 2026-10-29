# Meu Ritmo: ligar a sincronização com login Google

São três partes. Siga na ordem, porque cada uma usa um dado da anterior.
Tudo é gratuito. Faça no PC, com duas abas abertas: Supabase e Google Cloud.

Endereço do app: `https://kdetonador.github.io/meu-ritmo/`

---

## Parte 1: criar o banco no Supabase

1. Acesse **supabase.com** → **Start your project** → entre com sua conta do GitHub.
2. Clique em **New project**:
   - **Name:** `meu-ritmo`
   - **Database Password:** clique em *Generate* e guarde a senha (você quase não vai usar).
   - **Region:** a mais perto de você (ex.: *East US*).
   - Plano **Free**. Clique em **Create new project** e espere uns 2 minutos.
3. No menu da esquerda, abra **SQL Editor** → **New query**.
   Abra o arquivo `supabase-setup.sql` (no Bloco de Notas), copie tudo, cole e clique em **Run**.
   Deve aparecer *"Success. No rows returned"*.
4. Vá em **Authentication** → **Sign In / Providers** → **Google**.
   Copie o **Callback URL (for OAuth)**. Ele termina em `/auth/v1/callback`.
   **Deixe essa aba aberta.**

## Parte 2: criar o login no Google Cloud

1. Acesse **console.cloud.google.com** com sua conta Google.
2. No topo, clique no seletor de projetos → **New project** → nome `Meu Ritmo` → **Create**.
   Confira se o projeto novo ficou selecionado.
3. Na busca do topo, digite **Google Auth Platform** e abra. Clique em **Get started**:
   - **App name:** `Meu Ritmo`, **User support email:** seu e-mail.
   - **Audience:** **External**.
   - **Contact information:** seu e-mail. Aceite os termos e clique em **Create**.
4. Vá em **Clients** → **Create client**:
   - **Application type:** **Web application**, **Name:** `Meu Ritmo`
   - **Authorized JavaScript origins** → *Add URI*: `https://kdetonador.github.io`
   - **Authorized redirect URIs** → *Add URI*: cole o **Callback URL** do Supabase (Parte 1, passo 4).
   - **Create**. Copie o **Client ID** e o **Client secret**.
5. Vá em **Audience** → **Publish app** → confirme.
   Sem isso, só e-mails cadastrados como "test users" conseguem entrar.
   O app só pede nome, e-mail e foto, então o Google não exige verificação.

## Parte 3: ligar tudo

**No Supabase:**

1. Na aba do **Google** (Authentication → Sign In / Providers): ative **Enable Sign in with Google**,
   cole o **Client ID** e o **Client secret** e clique em **Save**.
2. **Authentication → URL Configuration**:
   - **Site URL:** `https://kdetonador.github.io/meu-ritmo/`
   - **Redirect URLs** → *Add URL*: `https://kdetonador.github.io/meu-ritmo/` → **Save**.
3. Pegue as duas informações do app (o botão **Connect**, no topo do projeto, mostra as duas):
   - **Project URL**, algo como `https://abcdxyz.supabase.co`
   - **Publishable key**, que começa com `sb_publishable_` (se só aparecer a *anon public*, use essa).

**No GitHub (repositório `meu-ritmo`):**

4. Clique em **Add file → Upload files** e envie os arquivos novos desta pasta,
   substituindo os antigos: `index.html`, `sw.js`, `config.js`, `supabase-setup.sql`,
   `SINCRONIZAR.md` e `LEIA-ME.md`. Clique em **Commit changes**.
5. Abra o `config.js` no GitHub, clique no lápis (✏️) e preencha entre as aspas:
   ```js
   supabaseUrl: "https://abcdxyz.supabase.co",
   supabaseKey: "sb_publishable_..."
   ```
   Clique em **Commit changes**.
   Esses dois valores podem ficar públicos. Quem protege os dados são as regras do passo 3 da Parte 1.
6. Espere a publicação ficar verde em **Actions** (cerca de 1 minuto).

## Testar

1. Abra o app, feche e abra de novo (para pegar a versão nova).
2. **Menu → Entrar com Google**.
3. Embaixo do título deve aparecer **"Sincronizado com seu-email"**.
4. Abra no celular, entre com a mesma conta, e seus registros aparecem lá.

## Bom saber

- **O que acontece no primeiro login:** os registros que já estavam no aparelho sobem para a conta,
  e os de exemplo são descartados.
- **Sem internet:** o app continua funcionando e sincroniza quando a conexão volta.
- **Quem não quiser entrar** usa normalmente, com os dados só no aparelho.
- **Ao sair da conta:** os dados somem do aparelho, mas continuam na nuvem.
- **Plano gratuito:** o Supabase pausa o projeto se ninguém usar o app por 7 dias seguidos.
  Para reativar, é só entrar no painel do Supabase e clicar em *Restore*. Nada é apagado.
- **iPhone com o app instalado:** se o login abrir no Safari e não voltar para o app,
  entre pelo Safari e depois abra o app de novo.
