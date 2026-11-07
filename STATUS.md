# Status
Local CRM and accounting workspace: runnable. Dashboard now includes live charts, lead-source visual, won-deal bars, simple rule-based insights, supplied logo, and sample CRM data in a fresh browser. Existing browser data is preserved; an empty existing workspace offers a Load sample dashboard data button.
Login page: visual entry point and local demo access. Google OAuth button uses Supabase only when NEXT_PUBLIC_SUPABASE_URL and NEXT_PUBLIC_SUPABASE_ANON_KEY are configured; no OAuth project is configured here, so Google sign-in is not live. This is not secure multi-user auth.
Cloud synchronization, authenticated roles, image OCR, PDF generation, MCP and deployment: pending.
