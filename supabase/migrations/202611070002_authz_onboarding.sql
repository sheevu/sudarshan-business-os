-- Apply after 202611070001_foundation.sql.
revoke all on public.organizations, public.organization_members, public.leads from anon, authenticated;
grant select on public.organizations, public.organization_members to authenticated;
grant select, insert, update on public.leads to authenticated;
drop policy leads_insert on public.leads;
drop policy leads_update on public.leads;
create policy leads_insert on public.leads for insert to authenticated with check (exists (select 1 from public.organization_members m where m.organization_id=leads.organization_id and m.user_id=(select auth.uid()) and m.role in ('owner','admin','manager','staff')));
create policy leads_update on public.leads for update to authenticated using (exists (select 1 from public.organization_members m where m.organization_id=leads.organization_id and m.user_id=(select auth.uid()) and m.role in ('owner','admin','manager','staff'))) with check (exists (select 1 from public.organization_members m where m.organization_id=leads.organization_id and m.user_id=(select auth.uid()) and m.role in ('owner','admin','manager','staff')));
create or replace function public.create_organization(p_name text) returns uuid language plpgsql security definer set search_path = '' as $$
declare v_id uuid; v_user uuid := auth.uid();
begin
  if v_user is null then raise exception 'Authentication required'; end if;
  if length(trim(coalesce(p_name,''))) < 2 or length(p_name) > 120 then raise exception 'Invalid organization name'; end if;
  insert into public.organizations(name) values (trim(p_name)) returning id into v_id;
  insert into public.organization_members(organization_id,user_id,role) values (v_id,v_user,'owner');
  return v_id;
end $$;
revoke all on function public.create_organization(text) from public, anon;
grant execute on function public.create_organization(text) to authenticated;
