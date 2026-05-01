# Squire

A cloud-based tax workpaper bookmarking and organization tool for CPA firms.

CPAs upload tax workpaper PDFs; the server runs OCR and auto-classifies pages
into a tax-form bookmark hierarchy (Federal/Income/W-2, Federal/Deductions/
Schedule A, etc.). Users review and correct the classifications via a drag-
and-drop UI, and corrections become shared training data that improves
classification across the firm. Final output: a downloadable bookmarked PDF
with pages reordered to match the bookmark tree.

## Status

Prototype, Phase 0 — scaffolding only.

## Stack

- Frontend: React + Vite + Tailwind CSS v3 (TypeScript) — deploys to Vercel
- Backend: FastAPI (Python 3.11+) — deploys to Railway
- Database / auth / file storage: Supabase
- OCR (prototype): Tesseract via pytesseract

## Project layout

```
squire/
  backend/    FastAPI service
  frontend/   React + Vite UI
  README.md
  DECISIONS.md   architectural decisions, dated
  LATER.md       parking lot for out-of-scope ideas
```

## Local development

Instructions will be filled in as the backend and frontend come online.
For now this repo only contains the scaffold.
