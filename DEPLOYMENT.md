# Deployment

Production site: https://sudarshan-business-os.netlify.app
Netlify project: https://app.netlify.com/projects/sudarshan-business-os
Verified production deploy: 6aef03752253aeec5fb66204
Source repository: https://github.com/sheevu/sudarshan-business-os

This is a CLI-linked Netlify site, not a Git-connected continuous deployment. The project builds as a static Next.js export from `apps/crm-web/out` using `netlify.toml`. To redeploy after a source change:

```powershell
cd apps/crm-web
pnpm install --frozen-lockfile
pnpm lint
pnpm build
cd ../..
npx netlify-cli deploy --prod --no-build --dir apps/crm-web/out
```

Production has no Supabase credentials. Google sign-in displays a configuration message; local demo access is available. Browser localStorage holds CRM and accounting records, so there is no shared server database, backup, or secure multi-user authorization yet.
