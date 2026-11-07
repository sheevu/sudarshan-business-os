# Engineering guidance
- Treat the attached brief as requirements; report implementation and test status truthfully.
- Enforce authorization in both RLS and server services.
- Use trusted organization_members, never editable user metadata, for roles.
- Keep LLM_API_ENABLED=false by default. No LLM for CRUD.
- Never send live messages or charge customers during tests.
