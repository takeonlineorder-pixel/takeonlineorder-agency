-- Run this in Supabase: Project -> SQL Editor -> New Query -> paste this -> Run

create table if not exists leads (
  id uuid primary key default gen_random_uuid(),
  created_at timestamp with time zone default now(),
  name text,
  restaurant text,
  email text,
  phone text,
  message text
);

-- Allow the public website to insert new leads (but not read/edit/delete them)
alter table leads enable row level security;

create policy "Allow public inserts"
  on leads
  for insert
  to anon
  with check (true);
