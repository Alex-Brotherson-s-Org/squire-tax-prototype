# Architectural decisions

One-line entries with the date the decision was made. Newest at the bottom.

- 2026-04-30: Repo layout — single repo with `frontend/` and `backend/` subfolders.
- 2026-04-30: Frontend stack — React + Vite + Tailwind CSS v3, written in TypeScript. Deploy target Vercel.
- 2026-04-30: Backend stack — FastAPI on Python 3.11+. Deploy target Railway.
- 2026-04-30: Database, auth, and file storage — Supabase (Postgres + Auth + Storage).
- 2026-04-30: OCR for prototype — Tesseract via pytesseract; lower quality vs. cloud OCR is acceptable for the prototype.
- 2026-04-30: Source control — GitHub private repo; deploys triggered by push to `main`.
- 2026-04-30: Python environment — standard-library `venv` + `pip` (chosen over `uv` so online tutorials match what we have).
- 2026-04-30: Tailwind version — v3 (chosen over v4 so online tutorials match what we have).
- 2026-05-01: Auth method — email + password only for the prototype. Magic links and OAuth (Google etc.) deferred until product validation.
- 2026-05-01: Multi-tenancy — prototype is single-firm (one Supabase project = one firm). No `firm_id` column; multi-tenancy reconsidered when there's a second customer.
- 2026-05-01: Auth architecture — hybrid pattern. Frontend uses `@supabase/supabase-js` for sign-up / sign-in directly with Supabase. Backend trusts the JWT in the `Authorization` header and verifies it. Backend uses the service-role key for admin DB ops.
- 2026-05-01: Schema management — apply schema by pasting SQL into the Supabase SQL editor. Supabase CLI / migration tooling deferred until schema becomes non-trivial.
