# Take Online Order — Agency Site

Static one-page site with a Supabase-connected lead capture form.

## Files
- `index.html` — the whole site
- `config.js` — put your Supabase URL + anon key here (currently empty)
- `supabase-setup.sql` — run once in Supabase to create the `leads` table

## Setup

### 1. Create a Supabase project
1. Go to supabase.com → New Project
2. Wait for it to finish provisioning (~2 min)

### 2. Create the leads table
1. In Supabase, go to **SQL Editor** → **New Query**
2. Paste the contents of `supabase-setup.sql` and click **Run**

### 3. Connect the site to Supabase
1. In Supabase, go to **Settings → API**
2. Copy the **Project URL** and **anon public** key
3. Open `config.js` and paste them into `SUPABASE_URL` and `SUPABASE_ANON_KEY`
4. Save, commit, and push — Vercel redeploys automatically

### 4. View submitted leads
Supabase → **Table Editor** → `leads` table. Every form submission shows up here.

## Local development
Just open `index.html` in a browser, or run a local server:
```
npx serve .
```

## Deploying changes
```
git add .
git commit -m "your message"
git push
```
Vercel auto-redeploys on every push to `main`.
