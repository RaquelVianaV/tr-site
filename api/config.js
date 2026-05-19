export default function handler(request, response) {
  response.setHeader("Content-Type", "application/javascript; charset=utf-8");
  response.setHeader("Cache-Control", "no-store, max-age=0");

  const config = {
    supabaseUrl: process.env.SUPABASE_URL || "",
    supabaseAnonKey: process.env.SUPABASE_ANON_KEY || "",
    workspaceEmail: process.env.WORKSPACE_EMAIL || "",
    googleCalendarApiKey: process.env.GOOGLE_CALENDAR_API_KEY || ""
  };

  response.status(200).send(`window.TR_CONFIG = ${JSON.stringify(config)};`);
}
