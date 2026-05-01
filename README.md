# Squire

A cloud-based tax workpaper bookmarking and organization tool for CPA firms.

CPAs upload tax workpaper PDFs; the server runs OCR and auto-classifies pages
into a tax-form bookmark hierarchy (Federal/Income/W-2, Federal/Deductions/
Schedule A, etc.). Users review and correct the classifications via a drag-
and-drop UI, and corrections become shared training data that improves
classification across the firm. Final output: a downloadable bookmarked PDF
with pages reordered to match the bookmark tree.

## Status

Prototype, Phase 0 — local end-to-end "hello world" wired up. No auth, no
database, no upload, no OCR yet.

## Stack

- Frontend: React + Vite + Tailwind CSS v3 (TypeScript) — deploys to Vercel
- Backend: FastAPI (Python 3.11+) — deploys to Railway
- Database / auth / file storage: Supabase (not yet integrated)
- OCR (prototype): Tesseract via pytesseract (not yet integrated)

## Project layout

```
squire/
  backend/        FastAPI service
    .venv/        Python virtual env (gitignored)
    main.py       FastAPI app, exposes /api/health
    requirements.txt
  frontend/       React + Vite UI
    src/App.tsx   Main React component
    ...
  README.md       this file
  DECISIONS.md    architectural decisions, dated
  LATER.md        parking lot for out-of-scope ideas
```

## Prerequisites

- Python 3.11 or newer (we are running on 3.14)
- Node.js 20 or newer (Vite 8 requires it)
- Git

## One-time setup (after cloning a fresh checkout)

Open PowerShell at the repo root.

### Backend

```powershell
cd backend
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install -r requirements.txt
```

### Frontend

```powershell
cd ..\frontend
npm install
```

## Daily run (two terminals — backend and frontend)

You need **both** servers running to see the page wired up. Use two
PowerShell windows.

### Terminal 1 — backend

```powershell
cd C:\Users\alex.brotherson\squire\backend
.\.venv\Scripts\Activate.ps1
uvicorn main:app --reload
```

The prompt should change to `(.venv) PS ...` after activation. Uvicorn
serves on http://localhost:8000.

### Terminal 2 — frontend

```powershell
cd C:\Users\alex.brotherson\squire\frontend
npm run dev
```

Vite serves on http://localhost:5173.

### URLs to hit

| URL | What it is |
|---|---|
| http://localhost:5173 | The React app — should show "Hello from Squire" + backend response |
| http://localhost:8000/api/health | Backend health check, returns `{"status":"ok"}` |
| http://localhost:8000/docs | FastAPI's auto-generated interactive API explorer |

To stop either server: `Ctrl+C` in its terminal.

## Windows note: PowerShell execution policy

If `Activate.ps1` or `npm` errors with "running scripts is disabled on this
system," run this once per user account:

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

It only affects your account and is reversible.
