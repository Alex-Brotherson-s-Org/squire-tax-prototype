import { useEffect, useState } from 'react'

export default function Home() {
  const [health, setHealth] = useState<string>('loading…')

  useEffect(() => {
    fetch('http://localhost:8000/api/health')
      .then((r) => r.json())
      .then((data) => setHealth(JSON.stringify(data)))
      .catch((err) => setHealth(`error: ${err.message}`))
  }, [])

  return (
    <div className="min-h-screen flex flex-col items-center justify-center gap-4 bg-slate-50">
      <h1 className="text-4xl font-bold text-slate-800">Hello from Squire</h1>
      <p className="text-lg font-mono text-slate-600">Backend says: {health}</p>
    </div>
  )
}
