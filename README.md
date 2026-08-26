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

### 2. Create the leads and bookings tables
1. In Supabase, go to **SQL Editor** → **New Query**
2. Paste the contents of `supabase-setup.sql` and click **Run** (creates the `leads` table)
3. New Query again → paste the contents of `bookings-setup.sql` → click **Run** (creates the `bookings` table)

### 3. Connect the site to Supabase
1. In Supabase, go to **Settings → API**
2. Copy the **Project URL** and **anon public** key
3. Open `config.js` and paste them into `SUPABASE_URL` and `SUPABASE_ANON_KEY`
4. Save, commit, and push — Vercel redeploys automatically

### 4. View submitted leads and bookings
Supabase → **Table Editor** → `leads` or `bookings` table. Every submission shows up here.

### 5. Get an email every time someone books (recommended)
By default, Supabase just stores the booking — it doesn't email you. The easiest way to get notified:

**Option A: Zapier or Make (no-code, ~10 min setup)**
1. Create a free Zapier or Make account
2. Trigger: "New row in Supabase table" → select `bookings`
3. Action: "Send email" → send to your inbox with the booking details
4. Turn it on — every new booking now emails you automatically

**Option B: Supabase Database Webhook + Resend (more technical)**
1. Sign up for a free Resend.com account, get an API key
2. In Supabase → Database → Webhooks → create a webhook on `bookings` INSERT
3. Point it to a Supabase Edge Function that calls Resend's API to send the email
4. Ask your developer (or come back here) if you want this built out

Option A is the fastest way to get this working today with no code.

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
