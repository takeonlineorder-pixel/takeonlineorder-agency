-- Run this in Supabase: Project -> SQL Editor -> New Query -> paste this -> Run

create table if not exists bookings (
  id uuid primary key default gen_random_uuid(),
  created_at timestamp with time zone default now(),
  name text,
  restaurant text,
  email text,
  phone text,
  preferred_date date,
  preferred_time text,
  notes text
);

-- Allow the public website to insert new bookings (but not read/edit/delete them)
alter table bookings enable row level security;

create policy "Allow public booking inserts"
  on bookings
  for insert
  to anon
  with check (true);
