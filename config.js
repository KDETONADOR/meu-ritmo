// Configuração da sincronização com a nuvem (Supabase).
// Cole aqui os dois valores do seu projeto Supabase:
//   Project Settings → Data API  → "Project URL"
//   Project Settings → API Keys  → chave "publishable" (ou a "anon public")
// Essas duas informações podem ficar públicas: quem protege os dados são as
// regras de segurança criadas pelo arquivo supabase-setup.sql.
// Se ficarem vazias, o app funciona só no aparelho, sem login.
window.MEU_RITMO_CONFIG = {
  supabaseUrl: "",
  supabaseKey: ""
};
