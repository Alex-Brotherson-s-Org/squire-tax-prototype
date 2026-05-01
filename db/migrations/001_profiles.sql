-- =============================================================
-- 001_profiles.sql  --  Squire schema, migration #1
-- =============================================================
-- Applied: 2026-05-01 (manually, via Supabase SQL editor)
--
-- Creates a public.profiles table linked 1:1 with Supabase's
-- managed auth.users table, with row-level security and an
-- auto-create trigger so every signup gets a profile row.
-- =============================================================

-- The profile table itself.
create table public.profiles (
  id           uuid        primary key references auth.users(id) on delete cascade,
  display_name text,
  created_at   timestamptz not null default now(),
  updated_at   timestamptz not null default now()
);

-- Lock down the table; we add explicit policies for who can do what.
alter table public.profiles enable row level security;

-- A user can read their own profile.
create policy "profiles_select_own"
  on public.profiles
  for select
  using (auth.uid() = id);

-- A user can update their own profile.
create policy "profiles_update_own"
  on public.profiles
  for update
  using (auth.uid() = id);

-- ---------------------------------------------------------------
-- Auto-create a profile row whenever a new auth.users row appears.
-- 'security definer' is required because the inserting "user" here
-- is Supabase's auth machinery, which has no direct insert rights
-- on public.profiles. The function runs with the owner's rights.
-- ---------------------------------------------------------------
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.profiles (id) values (new.id);
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- ---------------------------------------------------------------
-- Keep updated_at fresh on every row update.
-- ---------------------------------------------------------------
create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create trigger profiles_set_updated_at
  before update on public.profiles
  for each row execute procedure public.set_updated_at();
