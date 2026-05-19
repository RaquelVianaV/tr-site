# Deploy TR Eventos

## Supabase

1. Crie um projeto no Supabase.
2. Abra o SQL Editor.
3. Execute o arquivo `supabase-workspace-schema.sql`.
4. Em Authentication, crie os usuários da equipe.
   - Para este workspace, crie um usuário com o e-mail definido em `WORKSPACE_EMAIL`.
   - Use a senha `TR2026@*`.
5. Copie:
   - Project URL
   - anon public key

## Vercel

1. Importe o repositório `RaquelVianaV/tr-site`.
2. Use a pasta raiz do projeto.
3. Adicione as variáveis de ambiente:
   - `SUPABASE_URL`
   - `SUPABASE_ANON_KEY`
   - `WORKSPACE_EMAIL`
   - `GOOGLE_CALENDAR_API_KEY`
4. Faça o deploy.

Rotas:

- Site principal: `/`
- Workspace: `/workspace`
- Arquivo direto: `/workspace-tr-eventos.html`

## GitHub

Antes de enviar, sincronize com o remoto porque a branch local está atrás do `origin/main`.

```bash
git fetch origin
git rebase origin/main
git push origin main
```
