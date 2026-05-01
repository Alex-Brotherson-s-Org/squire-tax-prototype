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
