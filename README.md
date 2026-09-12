# Streak

A private streak counter that saves your data to your own Supabase project,
so it works from any device/browser once installed and even keeps ticking
offline.

## 1. Set up Supabase (one-time)

1. Open your project at https://supabase.com/dashboard/project/ecewowumfjplvyyjpxaj.
2. Go to **SQL Editor** → paste the contents of `supabase-setup.sql` → **Run**.
   This creates a `streak_kv` table with row-level security, so each device
   can only see its own data.
3. Go to **Authentication → Sign In / Providers → Anonymous Sign-Ins** and
   turn it **on**. The app signs each device in anonymously (no email or
   password) so your data is tied to that browser without you having to
   log in.

The Project URL and publishable key are already filled into `index.html` —
nothing else to configure there.

## 2. Put it on GitHub

```bash
cd streak-app
git init
git add .
git commit -m "Streak app"
git branch -M main
git remote add origin https://github.com/<your-username>/<repo-name>.git
git push -u origin main
```

## 3. Turn on GitHub Pages

1. On GitHub, open the repo → **Settings → Pages**.
2. Under **Build and deployment**, set **Source** to `Deploy from a branch`,
   branch `main`, folder `/ (root)` → **Save**.
3. GitHub gives you a URL like `https://<your-username>.github.io/<repo-name>/`.
   Open it — your streak counter is now live on the web.

## 4. Install it as a desktop app

No Electron or Tauri needed — this is a PWA (installable web app), which is
the simplest path to a real desktop window with its own icon:

- **Chrome / Edge**: open your GitHub Pages URL → click the **install icon**
  in the address bar (or ⋮ menu → **Install Streak…**). It opens in its own
  window and gets a dock/taskbar icon.
- **Safari (macOS)**: File → **Add to Dock**.

Once installed, the app shell (layout, icons, fonts) is cached by the
service worker, so it opens even with no connection — your streak clock
runs on local time either way. Reading/writing your streak data still
needs a connection to Supabase; if you're offline when you open it, it
shows your last-synced numbers and quietly syncs any changes once you're
back online.

## Notes

- Each browser/device you install this in signs in as its own anonymous
  Supabase user, so **it won't automatically sync between your phone and
  desktop** — those are two separate anonymous accounts. If you want one
  streak shared across devices, you'd add real sign-in (e.g. email
  magic-link) instead of anonymous auth — happy to help with that if you
  want it.
- The icons in this folder are simple placeholders generated to match the
  app's color palette — swap `icon-192.png` / `icon-512.png` /
  `icon-512-maskable.png` for your own art any time (keep the filenames or
  update `manifest.json`).
