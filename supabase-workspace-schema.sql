create table if not exists public.workspace_records (
  id uuid primary key default gen_random_uuid(),
  area text not null,
  title text not null,
  owner text,
  phone text,
  due_date text,
  created_date date,
  status text,
  priority text,
  tag text,
  notes text,
  created_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.workspace_records enable row level security;

create policy "Equipe autenticada pode ler registros"
on public.workspace_records
for select
to authenticated
using (true);

create policy "Equipe autenticada pode criar registros"
on public.workspace_records
for insert
to authenticated
with check (true);

create policy "Equipe autenticada pode editar registros"
on public.workspace_records
for update
to authenticated
using (true)
with check (true);

create policy "Equipe autenticada pode excluir registros"
on public.workspace_records
for delete
to authenticated
using (true);

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists workspace_records_updated_at on public.workspace_records;

create trigger workspace_records_updated_at
before update on public.workspace_records
for each row
execute function public.set_updated_at();
