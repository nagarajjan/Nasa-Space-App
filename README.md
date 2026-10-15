# AEGIS-NEO: Autonomous Planetary Defense & Impact Intelligence Suite
### NASA Space Apps Challenge 2026 | Planetary Defense & Asteroid Hazard Tracker

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![NASA JPL SBDB](https://img.shields.io/badge/NASA%20Live%20Data-JPL%20CAD%20%26%20SBDB-blue)](https://ssd.jpl.nasa.gov/)
[![WebGL 3D](https://img.shields.io/badge/3D%20Engine-Three.js%20r128-cyan)](#)
[![Live Demo](https://img.shields.io/badge/Live%20Demo-GitHub%20Pages-green)](https://nagarajjan.github.io/Nasa-Space-App/)

---

## 🌟 What is AEGIS-NEO?

**AEGIS-NEO** is a **real-time, zero-install, browser-native** planetary defense intelligence platform built for the NASA Space Apps Challenge 2026. It connects **live NASA JPL data** to a **WebGL 3D Solar System** with a built-in **Impact Physics Calculator** and **DART Deflection Sandbox**.

> **🚀 Try it live:** [https://nagarajjan.github.io/Nasa-Space-App/](https://nagarajjan.github.io/Nasa-Space-App/)

---

## ⚡ Quick Start

### Option 1 — Python HTTP Server (Recommended)
```powershell
cd "C:\Users\User\.gemini\antigravity\scratch\aegis-planetary-defense"
python -m http.server 8080
# Open: http://localhost:8080
```

### Option 2 — One-Click PowerShell
```powershell
.\run_demo.ps1   # Starts server AND opens browser automatically
```

### Option 3 — Docker
```bash
docker-compose up
# Open: http://localhost:80
```

### Option 4 — Direct File
Open `index.html` directly in Chrome/Edge/Firefox.  
*(Note: NASA live API may be CORS-blocked in `file://` mode — use Option 1 for full features)*

📖 **Full setup guide:** [docs/GETTING_STARTED.md](docs/GETTING_STARTED.md)

---

## 🛰️ Live NASA API Integration

On page load, AEGIS-NEO **automatically connects to NASA JPL**:

| API | Endpoint | Data Fetched |
|---|---|---|
| **JPL CAD** | `https://ssd-api.jpl.nasa.gov/cad.api` | Up to 60 real PHAs approaching Earth in next 365 days |
| **JPL SBDB** | `https://ssd-api.jpl.nasa.gov/sbdb.api` | Full Keplerian orbital elements for any selected asteroid |

- 🟡 **Amber badge** → Connecting to NASA JPL...
- 🟢 **Green LIVE badge** → Real PHA data loaded successfully
- 🔴 **Red badge** → NASA API offline, using curated fallback database

---

## 🪐 Celestial Bodies Simulated

| Body | Type | Moons Included |
|---|---|---|
| ☀️ Sun | Star | — |
| ☿ Mercury | Rocky Planet | — |
| ♀ Venus | Rocky Planet | — |
| 🌍 Earth | Rocky Planet | 🌙 Luna |
| 🔴 Mars | Rocky Planet | 🪨 Phobos (inner), 🪨 Deimos (outer) |
| ⬛ Main Asteroid Belt | 900-particle cloud | 2.1–2.6 AU |
| ♃ Jupiter | Gas Giant | 🌋 Io, 🧊 Europa, 🌑 Ganymede, 🌑 Callisto |
| ☄️ Tracked NEO | User-selected | Dimorphos (if Didymos selected) |

**Total: 15 celestial objects** — all with 3D floating labels and animated orbits.

---

## 🔭 Key Features

### 🪐 Planet / Moon System Focus Toggle
One-click camera teleport to any planet or moon:
- Click **Mars** → Phobos + Deimos sub-buttons appear
- Click **Jupiter** → Io, Europa, Ganymede, Callisto sub-buttons appear
- Active button highlights to show current view

### ☄️ Live NEO Catalog (NASA JPL Feed)
- **60 real Potentially Hazardous Asteroids** from NASA's current database
- Each entry shows: Name | Close-approach date | Distance (AU) | Velocity (km/s) | Diameter
- Selecting any PHA fetches its **real orbital elements** from NASA SBDB and rebuilds the orbit in 3D

### 💥 Multi-World Impact Physics Calculator
Target body selector with correct physics for each world:

| Target | Gravity | Atmosphere | Special |
|---|---|---|---|
| Earth | 9.81 m/s² | 1.0 atm | Full blast + thermal |
| Moon (Luna) | 1.62 m/s² | Vacuum | No airblast |
| Mars | 3.72 m/s² | 0.006 atm | Thin atmosphere |
| Phobos | 0.0057 m/s² | Vacuum | Micro-gravity |
| Jupiter | 24.79 m/s² | 100 atm | Shoemaker-Levy 9 mode |
| Europa | 1.31 m/s² | Vacuum | Ice shell |
| Ganymede | 1.43 m/s² | Vacuum | Largest moon |

### 🛸 DART Deflection Sandbox
Simulate kinetic impactor missions using real DART empirical data:
- β factor: 2.2–3.6 (Dimorphos-derived)
- Spacecraft mass, velocity, lead time adjustable
- Color-coded outcome: ✅ Successful / ⚠️ Marginal / ❌ Insufficient

---

## 📊 Scientific Methodology

### Keplerian Orbit Propagation
Position vectors computed by solving Kepler's equation:
$$M = E - e \sin E$$

Newton-Raphson iteration (12 steps, convergence threshold $10^{-6}$ rad) with full 3D Euler rotation via $\omega$ (arg. perihelion), $\Omega$ (ascending node), $i$ (inclination).

### Crater Scaling Law (Collins & Melosh)
$$D_{\text{crater}} \approx 1.161 \left(\frac{\rho_{\text{imp}}}{\rho_{\text{tgt}}}\right)^{1/3} d^{0.78} v^{0.44} g^{-0.22} (\sin\theta)^{1/3}$$

### DART Kinetic Deflection
$$\Delta v = \beta \frac{m_{\text{sc}} \cdot v_{\text{rel}}}{M_{\text{asteroid}}}, \quad \Delta r_{\text{miss}} \approx 3 \cdot \Delta v \cdot \Delta t$$

---

## 🏆 Pitch Deck Structure

| Slide | Title | Judging Criterion |
|---|---|---|
| 1 | The Planetary Defense Gap | Relevance (20%) |
| 2 | NASA Data Integration — Standing on Giants | NASA Data Use (20%) |
| 3 | AEGIS-NEO Architecture | Technical Validity (20%) |
| 4 | Live Prototype Walkthrough | Innovation & Demo (25%) |
| 5 | DART Deflection Sandbox | Creativity (20%) |
| 6 | Multi-World Impact Physics | Scientific Depth |
| 7 | Vision & Democratizing Planetary Defense | Scalability (15%) |

---

## 📚 Documentation Suite

| Document | Purpose | Link |
|---|---|---|
| 🚀 **Getting Started** | Step-by-step setup + full feature walkthrough | [docs/GETTING_STARTED.md](docs/GETTING_STARTED.md) |
| 🎤 **Pitch Deck & Speaker Scripts** | 7-slide verbatim presentation with speaker notes | [docs/PITCH_DECK.md](docs/PITCH_DECK.md) |
| 🔬 **Scientific Methodology** | Keplerian solvers, crater scaling, DART physics | [docs/SCIENTIFIC_METHODOLOGY.md](docs/SCIENTIFIC_METHODOLOGY.md) |
| 📡 **NASA Data Integration** | Live API specs, endpoints, data flow, fallback | [docs/NASA_DATA_INTEGRATION.md](docs/NASA_DATA_INTEGRATION.md) |
| ❓ **Judges Q&A Cheat Sheet** | 30 expert answers to tough judge questions | [docs/JUDGES_QA_CHEAT_SHEET.md](docs/JUDGES_QA_CHEAT_SHEET.md) |
| 📋 **Solution Dossier** | Executive summary and systems architecture | [docs/SOLUTION_DOSSIER.md](docs/SOLUTION_DOSSIER.md) |
| 📅 **Execution Playbook** | 90-sec demo script, deployment, submission | [docs/PLAYBOOK.md](docs/PLAYBOOK.md) |

---

## 🌐 Deployment

| Platform | Status | Link |
|---|---|---|
| GitHub Pages | Auto-deploy via `.github/workflows/deploy.yml` | https://nagarajjan.github.io/Nasa-Space-App/ |
| Vercel | One-click (vercel.json included) | Import GitHub repo at vercel.com |
| Netlify | One-click (netlify.toml included) | Import GitHub repo at netlify.com |
| Docker | `docker-compose up` | Port 80 |
| Python local | `python -m http.server 8080` | http://localhost:8080 |

---

## 📡 NASA APIs & Data Sources

- **NASA JPL Close-Approach Data (CAD):** `https://ssd-api.jpl.nasa.gov/cad.api` — *LIVE, no key required*
- **NASA JPL Small-Body Database (SBDB):** `https://ssd-api.jpl.nasa.gov/sbdb.api` — *LIVE, no key required*
- **NASA CNEOS Sentry Risk Table:** `https://cneos.jpl.nasa.gov/sentry/` — *Referenced*
- **DART Mission Telemetry:** Johns Hopkins APL & NASA PDS SBN — *β factor 2.2–3.6 from Dimorphos*

---

## 🛠️ Technology Stack

| Layer | Technology |
|---|---|
| 3D Rendering | Three.js r128 (WebGL) |
| UI Framework | Tailwind CSS (CDN) |
| Charts | Chart.js |
| Icons | Font Awesome 6 |
| Fonts | Chakra Petch, JetBrains Mono, Inter |
| Physics | Vanilla JavaScript |
| Server | Python http.server / Nginx (Docker) |
| CI/CD | GitHub Actions |

**Zero npm · Zero build step · Zero server dependency**

---

## 📄 License
MIT License — Built for the NASA International Space Apps Challenge 2026  
**Team:** AEGIS-NEO | Repository: [nagarajjan/Nasa-Space-App](https://github.com/nagarajjan/Nasa-Space-App)
