# Bolão Sevimol - Lotofácil

Site estático (HTML puro) que salva os jogos no Supabase. Hospeda de graça na Vercel.

## 1. Criar o projeto no Supabase

1. Acesse https://supabase.com, crie uma conta grátis e clique em **New project**.
2. Depois que o projeto for criado, vá em **SQL Editor** > **New query**.
3. Cole o conteúdo do arquivo `schema.sql` (está nesta pasta) e clique em **Run**.
   Isso cria a tabela `jogos` e as permissões necessárias.
4. Vá em **Project Settings > API**. Você vai precisar de dois valores:
   - **Project URL** (algo como `https://xxxxx.supabase.co`)
   - **anon public key** (uma chave longa)

## 2. Configurar o site

Abra o arquivo `index.html` e edite estas duas linhas, perto do topo do `<script>`:

```js
const SUPABASE_URL = "COLOQUE_AQUI_SUA_SUPABASE_URL";
const SUPABASE_ANON_KEY = "COLOQUE_AQUI_SUA_SUPABASE_ANON_KEY";
```

Cole a Project URL e a anon key que você pegou no passo anterior.

Se quiser poder remover jogos pelo site, troque também:

```js
const ADMIN_PASSWORD = "troque-esta-senha";
```

Depois, para acessar o modo de remoção, abra o site assim:
`https://seusite.vercel.app/?admin=troque-esta-senha`

> A chave "anon" do Supabase é feita para ficar visível no navegador — não é segredo.
> Quem protege os dados são as políticas (RLS) do arquivo `schema.sql`.

## 3. Publicar de graça na Vercel

1. Crie uma conta em https://vercel.com (pode entrar com GitHub).
2. Suba esta pasta (`index.html`, `schema.sql`, `README.md`) para um repositório no
   GitHub — ou, mais rápido: instale a CLI da Vercel e rode, dentro desta pasta:
   ```
   npm i -g vercel
   vercel
   ```
   Siga as perguntas (aceite os padrões). Ao final ele te dá o link do site.
3. Se preferir pelo site: em vercel.com clique em **Add New > Project**, importe o
   repositório do GitHub com esta pasta, e clique em **Deploy**. Não precisa
   configurar nada — é um site estático simples (framework "Other").

## 4. Transformar em planilha depois

Duas formas, sem precisar programar nada:

- **Pelo próprio site**: clique no botão "⬇️ Baixar planilha (Excel)" — ele baixa um
  arquivo `.xlsx` já pronto, com uma coluna por número do jogo, para abrir direto no
  Excel ou subir no Google Planilhas.
- **Pelo Supabase**: no painel, vá em **Table Editor > jogos**, clique nos três
  pontinhos e em **Export data** para baixar tudo em CSV direto do banco.

## Limites do plano grátis

- Supabase free: até 500 MB de banco — muito mais do que um bolão precisa.
- Vercel free (Hobby): hospedagem de sites estáticos como este, de graça.
