# Security checklist
- [x] Organization creation runs through a security-definer RPC tied to auth.uid().
- [x] Direct organization and membership writes revoked from authenticated clients.
- [x] Lead access scoped through organization membership in RLS.
- [ ] Verify RLS with two organizations and users against a real database.
- [ ] Add explicit role distinctions for lead mutations and audit logs.
- [ ] Add rate limits and CSRF review.
- [ ] Confirm secrets remain server-side in deployment.
