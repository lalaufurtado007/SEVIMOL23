-- Rode este script no SQL Editor do seu projeto Supabase
-- (Supabase Dashboard > SQL Editor > New query > colar e "Run")

create extension if not exists "pgcrypto";

create table if not exists jogos (
  id uuid primary key default gen_random_uuid(),
  nome text not null,
  numeros integer[] not null,
  criado_em timestamptz not null default now()
);

alter table jogos enable row level security;

-- Qualquer pessoa (mesmo sem login) pode enviar jogos
create policy "inserir jogos"
on jogos for insert
to anon
with check (true);

-- Qualquer pessoa pode ler os jogos (para a lista e o CSV funcionarem)
create policy "ler jogos"
on jogos for select
to anon
using (true);

-- Permite remover jogos (usado apenas no modo admin do site, com senha na URL)
create policy "remover jogos"
on jogos for delete
to anon
using (true);
