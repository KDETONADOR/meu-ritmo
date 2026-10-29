-- Meu Ritmo: tabela onde cada pessoa guarda os próprios dados.
-- Cole tudo no Supabase em SQL Editor → New query → Run.

create table if not exists public.user_data (
  user_id    uuid not null default auth.uid() references auth.users(id) on delete cascade,
  doc_id     text not null,          -- 'settings' ou 'd-AAAA-MM-DD'
  data       jsonb not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, doc_id)
);

-- Segurança: cada pessoa só enxerga e altera as próprias linhas.
alter table public.user_data enable row level security;

drop policy if exists "ler os proprios dados"     on public.user_data;
drop policy if exists "criar os proprios dados"   on public.user_data;
drop policy if exists "alterar os proprios dados" on public.user_data;
drop policy if exists "apagar os proprios dados"  on public.user_data;

create policy "ler os proprios dados" on public.user_data
  for select to authenticated using ((select auth.uid()) = user_id);
create policy "criar os proprios dados" on public.user_data
  for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "alterar os proprios dados" on public.user_data
  for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "apagar os proprios dados" on public.user_data
  for delete to authenticated using ((select auth.uid()) = user_id);

grant select, insert, update, delete on public.user_data to authenticated;
revoke all on public.user_data from anon;
