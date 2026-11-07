# Sudarshan Business OS

Run the local CRM:

```powershell
cd apps/crm-web
pnpm install
pnpm dev
```

Open http://localhost:3000. Fresh browser storage loads clearly marked sample data so the dashboard charts and insights can be explored. Existing data is preserved. Open http://localhost:3000/login for the login page and demo entry.

Google sign-in requires a configured Supabase project and Google OAuth provider. Set `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY` in the app environment, then configure the authorized redirect URL in Supabase/Google. The current local app is not a secure multi-user system; the OAuth button alone does not enforce access to local browser records.

CRM and Accounting data are saved in browser localStorage. Use a trusted device. Clearing browser storage removes records. `supabase/` migrations are future cloud groundwork and are not used by the local data layer.
