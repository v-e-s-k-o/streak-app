-- Run this once in your Supabase project's SQL Editor.
-- It creates a simple key/value table for the streak app, scoped to
-- each anonymous device/browser via Supabase Auth's anonymous sign-in.

create table if not exists public.streak_kv (
  user_id uuid not null references auth.users(id) on delete cascade,
  key text not null,
  value text not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, key)
);

alter table public.streak_kv enable row level security;

create policy "Users can read their own streak data"
on public.streak_kv
for select
using (auth.uid() = user_id);

create policy "Users can write their own streak data"
on public.streak_kv
for insert
with check (auth.uid() = user_id);

create policy "Users can update their own streak data"
on public.streak_kv
for update
using (auth.uid() = user_id)
with check (auth.uid() = user_id);
