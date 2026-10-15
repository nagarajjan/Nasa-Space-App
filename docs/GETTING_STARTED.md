# 🛡️ AEGIS-NEO — Getting Started Guide

> **NASA Space Apps Hackathon 2026** | Automated Early-Warning & Guidance Intelligence System for Near-Earth Objects

[![Live Demo](https://img.shields.io/badge/🚀_Live_Demo-GitHub_Pages-blue?style=for-the-badge)](https://nagarajjan.github.io/Nasa-Space-App/)
[![GitHub](https://img.shields.io/badge/📦_Source-GitHub-black?style=for-the-badge)](https://github.com/nagarajjan/Nasa-Space-App)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](../LICENSE)

---

## ⚡ Quick Start (TL;DR for Judges)

> [!IMPORTANT]
> **Just want to see it NOW?** Do one of these:
>
> **Option 1 — Live Demo (no setup):**
> 👉 Open [https://nagarajjan.github.io/Nasa-Space-App/](https://nagarajjan.github.io/Nasa-Space-App/) in Chrome/Edge/Firefox
>
> **Option 2 — PowerShell one-click (Windows):**
> ```powershell
> # Double-click run_demo.ps1 OR paste in PowerShell:
> .\run_demo.ps1
> ```
>
> **Option 3 — Python (any OS):**
> ```bash
> python -m http.server 8080
> # Then open http://localhost:8080
> ```

No `npm install`. No build step. No environment variables. **Just open and go.** 🎯

---

## 📋 Table of Contents

1. [Prerequisites](#-prerequisites)
2. [Method A — Python HTTP Server](#-method-a--python-http-server)
3. [Method B — PowerShell One-Click](#-method-b--powershell-one-click)
4. [Method C — Docker Container](#-method-c--docker-container)
5. [Method D — Direct File Open](#-method-d--direct-file-open)
6. [Full Feature Walkthrough](#-full-feature-walkthrough)
7. [Celestial Bodies Reference Table](#-celestial-bodies-reference-table)
8. [NASA API Data Sources](#-nasa-api-data-sources)
9. [Cloud Deployment](#-cloud-deployment)
10. [Troubleshooting](#-troubleshooting)
11. [Project Structure](#-project-structure)

---

## 🔧 Prerequisites

| Requirement | Details |
|---|---|
| **Python 3.x** | For Method A. Check with `python --version`. Download at [python.org](https://www.python.org/downloads/) |
| **Docker Desktop** | For Method C. Download at [docker.com](https://www.docker.com/products/docker-desktop/) |
| **Modern Browser** | Chrome 110+, Edge 110+, Firefox 110+, Safari 16+. WebGL must be enabled |
| **Internet Connection** | Required for live NASA JPL API data and CDN assets (Three.js, Tailwind, Chart.js) |

> [!NOTE]
> You only need **one** of Python or Docker. The live demo at GitHub Pages requires nothing at all.
> All heavy lifting (Three.js WebGL, Tailwind CSS, Chart.js) is loaded via CDN — there are **no local dependencies to install**.

---

## 🐍 Method A — Python HTTP Server

The simplest local option. Works on Windows, macOS, and Linux.

### Windows (PowerShell)

```powershell
# 1. Navigate to the project root
cd C:\Users\User\.gemini\antigravity\scratch\aegis-planetary-defense

# 2. Start the server on port 8080
python -m http.server 8080

# 3. Open your browser to:
#    http://localhost:8080
```

### macOS / Linux (Terminal)

```bash
# 1. Navigate to the project root
cd /path/to/aegis-planetary-defense

# 2. Start the server
python3 -m http.server 8080

# 3. Open your browser to:
#    http://localhost:8080
```

> [!TIP]
> **Alternative ports:** If 8080 is busy, try `python -m http.server 3000` or any free port above 1024.

### Expected Output

```
Serving HTTP on :: port 8080 (http://[::]:8080/) ...
127.0.0.1 - - [15/Oct/2026 15:43:00] "GET / HTTP/1.1" 200 -
127.0.0.1 - - [15/Oct/2026 15:43:00] "GET /index.html HTTP/1.1" 200 -
```

Press `Ctrl+C` to stop the server when done.

---

## ⚡ Method B — PowerShell One-Click

For Windows users who want zero friction — the script starts the server **and** opens the browser automatically.

```powershell
# Option 1: Double-click run_demo.ps1 in File Explorer
# Option 2: Right-click run_demo.ps1 → "Run with PowerShell"
# Option 3: From a PowerShell prompt:

.\run_demo.ps1
```

> [!NOTE]
> If you see a script execution policy error, run this first (once, as Administrator):
> ```powershell
> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
> ```

The script will:
1. ✅ Check for Python installation
2. ✅ Navigate to the project root automatically
3. ✅ Start `python -m http.server 8080`
4. ✅ Wait 2 seconds for the server to initialize
5. ✅ Open `http://localhost:8080` in your default browser

---

## 🐳 Method C — Docker Container

Ideal for a fully isolated, reproducible environment.

### Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running

### Steps

```bash
# 1. Navigate to the project root
cd C:\Users\User\.gemini\antigravity\scratch\aegis-planetary-defense

# 2. Build and start the container
docker-compose up

# 3. Open your browser to:
#    http://localhost:80
```

### Stop the Container

```bash
# Stop and remove containers
docker-compose down

# Stop without removing
Ctrl+C
```

> [!TIP]
> Run in detached mode so the terminal is free:
> ```bash
> docker-compose up -d
> docker-compose down  # to stop later
> ```

### Docker Details

| Setting | Value |
|---|---|
| **Image** | `nginx:alpine` (lightweight static file server) |
| **Port** | `localhost:80` → container port `80` |
| **Volume** | Project root mounted as `/usr/share/nginx/html` |

---

## 📂 Method D — Direct File Open

Open `index.html` directly in your browser without any server.

```
File Explorer → aegis-planetary-defense → double-click index.html
```

Or drag and drop `index.html` into a browser window.

> [!WARNING]
> **CORS Limitations in `file://` mode:**
> - 🔴 **NASA JPL Live API calls will be blocked** — the asteroid badge will stay amber and the live dropdown will not populate
> - 🔴 Some WebGL features may be restricted in certain browser security configurations
> - ✅ **All static features work fine**: 3D orbital simulator, physics sliders, impact calculator, DART sandbox, pitch deck modal, curated asteroid data
>
> For the full experience including live NASA data, use Methods A, B, C, or the live demo.

---

## 🎮 Full Feature Walkthrough

Once the app is open in your browser, here is everything you can explore:

---

### 🌍 Planet & Moon System Focus Toggle (Left Sidebar)

The left panel contains the **Solar System Navigation** controls. Click any body to fly the 3D camera to it.

| Button | Sub-buttons |
|---|---|
| ☀️ **Sun** | — |
| 🪨 **Mercury** | — |
| 🌸 **Venus** | — |
| 🌎 **Earth + Luna** | 🌍 Earth · 🌕 Luna |
| 🔴 **Mars** | 🔴 Mars · 🌑 Phobos · 🌑 Deimos |
| 🟠 **Jupiter** | 🟠 Jupiter · 🌋 Io · 🌊 Europa · 🔵 Ganymede · ⚪ Callisto |
| ☄️ **NEO / Asteroid** | Focuses on the tracked near-Earth object |

> [!TIP]
> After clicking a planet, use the **Orbital & Physical Mechanics** sliders to modify a hypothetical asteroid in that region and immediately see the 3D orbit update.

---

### 🛰️ Live NASA JPL API Section

Located in the **top information bar**:

| Indicator | Meaning |
|---|---|
| 🟡 **Amber badge** | Fetching data from NASA JPL API... |
| 🟢 **Green badge + "LIVE"** | Successfully loaded real Potentially Hazardous Asteroids |

Once loaded, a **green dropdown** populates with **60 real PHAs** from the JPL Close-Approach Data API. Select any to see its orbital parameters.

---

### 🌌 3D Orbital Simulator Canvas (Center Stage)

The heart of AEGIS-NEO — a real-time WebGL solar system powered by **Three.js**.

#### Mouse / Touch Controls

| Action | Control |
|---|---|
| **Rotate** | Left-click + drag |
| **Pan** | Right-click + drag |
| **Zoom** | Scroll wheel / pinch |
| **Reset view** | Double-click empty space |

#### Playback Controls (Bottom Bar)

| Control | Description |
|---|---|
| ⏸ / ▶ **Play / Pause** | Start or freeze the orbital simulation |
| **1×** | Real-time speed |
| **5×** | 5× accelerated |
| **20×** | 20× time-lapse — watch full orbits in seconds |

#### Visual Elements

- 🌕 All **8 planets** with accurate relative sizes and orbital radii
- 🌑 All **major moons** orbiting their parent planets with labels
- ☄️ **Main Asteroid Belt** rendered as a ring of particles between Mars and Jupiter
- 🎯 **Tracked NEO** highlighted with a distinct color and label
- 🌟 Starfield background with 2,000 procedurally placed stars

---

### ☄️ Curated Landmark Asteroids Dropdown

A hand-picked selection of the most historically and scientifically significant near-Earth objects:

| Asteroid | Significance |
|---|---|
| **Apophis** | Will pass within 31,000 km of Earth in 2029 |
| **Bennu** | Target of NASA OSIRIS-REx sample return mission |
| **Didymos / Dimorphos** | Target of NASA DART mission — first planetary defense test |
| **Ryugu** | Target of JAXA Hayabusa2 sample return mission |
| **2024 YR4** | Recent impact probability scare, media coverage 2024 |
| **Chelyabinsk** | 2013 Russian superbolide, ~1,500 injured |

Selecting any landmark asteroid auto-populates all sliders with that body's real physical and orbital parameters.

---

### 🔭 Orbital & Physical Mechanics Sliders

Fine-tune asteroid properties and watch the 3D orbit update **in real time**:

| Slider | Unit | Description |
|---|---|---|
| **Diameter** | km | Physical size of the impactor |
| **Semi-Major Axis** | AU | Average orbital distance from the Sun |
| **Eccentricity** | 0.0–0.99 | Orbit shape: 0 = circle, near 1 = highly elliptical |
| **Inclination** | degrees | Tilt of the orbit relative to the ecliptic plane |
| **Density** | g/cm³ | Composition proxy: ~1.3 = cometary, ~3.5 = rocky, ~7.9 = metallic |

---

### 💥 Impact Physics Calculator

Select a **target body** and click **Calculate Impact** to instantly compute:

| Output | Description |
|---|---|
| 🕳️ **Crater Diameter** | Estimated crater size using Pi-group scaling laws |
| 🔥 **Fireball Radius** | Thermal radiation danger zone |
| 🌊 **Seismic Magnitude** | Equivalent Richter scale earthquake |
| ☢️ **Thermal Radiation** | Energy flux at surface (kJ/m²) |

**Target Bodies:** Earth · Moon · Mars · Venus · Mercury · Jupiter

Results update dynamically as you move the sliders — no need to click recalculate.

---

### 🚀 DART Deflection Sandbox

Simulate the **kinetic impactor** planetary defense technique (as used on Dimorphos in 2022):

| Slider | Description |
|---|---|
| **Spacecraft Mass** | kg — heavier spacecraft = more momentum transfer |
| **Impact Velocity** | km/s — relative speed at intercept |
| **Beta Factor (β)** | Momentum enhancement from ejecta (1.0 = no enhancement, up to 5.0) |
| **Lead Time** | Years before closest approach — earlier = smaller Δv needed |

The sandbox outputs:
- **Δv imparted** (mm/s) — velocity change on the asteroid
- **Orbit shift** (km at closest approach) — resulting miss distance change
- **Mission feasibility** rating — Green / Yellow / Red

---

### 📊 7-Slide Pitch Deck Modal

Click the **🎯 Mission Briefing** button in the top navigation bar to open a full-screen presentation modal with 7 slides:

| Slide | Title |
|---|---|
| 1 | The Threat — Why Planetary Defense Matters |
| 2 | AEGIS-NEO System Architecture |
| 3 | Live Data Pipeline (NASA JPL APIs) |
| 4 | Impact Physics Engine |
| 5 | DART Deflection Modeling |
| 6 | Real-World Applications |
| 7 | Call to Action & Team Credits |

Navigate with **← →** arrow buttons or keyboard arrow keys. Press **Esc** to close.

---

### 📄 Mission Briefing Export

Click the **⬇️ Export Report** button (header, next to Mission Briefing) to download a `.txt` summary report containing:

- Current asteroid orbital parameters
- Impact physics calculation results
- DART deflection simulation results
- Timestamp and session metadata

---

## 🌍 Celestial Bodies Reference Table

All 15 bodies rendered in the AEGIS-NEO 3D simulator:

| # | Body | Type | Parent | Notable Feature |
|---|---|---|---|---|
| 1 | ☀️ Sun | Star | — | Central gravitational anchor |
| 2 | 🪨 Mercury | Planet | Sun | Smallest planet, no moons |
| 3 | 🌸 Venus | Planet | Sun | Retrograde rotation, dense atmosphere |
| 4 | 🌎 Earth | Planet | Sun | Home world, liquid water |
| 5 | 🌕 Luna | Moon | Earth | Only natural Earth satellite |
| 6 | 🔴 Mars | Planet | Sun | Two small moons, potential human destination |
| 7 | 🌑 Phobos | Moon | Mars | Closest moon to any planet (~6,000 km) |
| 8 | 🌑 Deimos | Moon | Mars | Smallest known moon in solar system |
| 9 | 🟠 Jupiter | Planet | Sun | Largest planet, strong radiation belts |
| 10 | 🌋 Io | Moon | Jupiter | Most volcanically active body in solar system |
| 11 | 🌊 Europa | Moon | Jupiter | Subsurface liquid ocean — potential life |
| 12 | 🔵 Ganymede | Moon | Jupiter | Largest moon in solar system |
| 13 | ⚪ Callisto | Moon | Jupiter | Most heavily cratered body in solar system |
| 14 | 💫 Main Asteroid Belt | Belt | Sun | ~1.1–3.3 AU, millions of bodies |
| 15 | ☄️ Tracked NEO | Asteroid | Sun | User-selected / live NASA PHA data |

---

## 🛰️ NASA API Data Sources

AEGIS-NEO connects to two official NASA JPL APIs in real time:

### 1. JPL Close-Approach Data (CAD) API

```
https://ssd-api.jpl.nasa.gov/cad.api
```

**Used for:** Fetching the list of 60 Potentially Hazardous Asteroids with upcoming close approaches.

**Example query:**

```
https://ssd-api.jpl.nasa.gov/cad.api?dist-max=0.05&date-min=2026-01-01&date-max=2027-01-01&pha=true&sort=dist&limit=60
```

**Key parameters:**

| Parameter | Description |
|---|---|
| `dist-max` | Maximum close-approach distance in AU |
| `date-min` / `date-max` | Date range for close approaches |
| `pha=true` | Only Potentially Hazardous Asteroids |
| `sort=dist` | Sort by closest approach distance |
| `limit=60` | Return top 60 results |

---

### 2. JPL Small-Body Database (SBDB) API

```
https://ssd-api.jpl.nasa.gov/sbdb.api
```

**Used for:** Fetching detailed orbital and physical parameters for a specific selected asteroid.

**Example query:**

```
https://ssd-api.jpl.nasa.gov/sbdb.api?sstr=apophis&phys-par=true
```

**Key parameters:**

| Parameter | Description |
|---|---|
| `sstr` | Small-body search string (name, designation, or SPK-ID) |
| `phys-par=true` | Include physical parameters (diameter, albedo, density) |
| `full-prec=true` | Full precision orbital elements |

> [!NOTE]
> These APIs are **free and public** — no API key required. Rate limits apply: avoid rapid repeated requests.
> NASA API status: [https://api.nasa.gov/](https://api.nasa.gov/)

---

## ☁️ Cloud Deployment

Because AEGIS-NEO is a **single `index.html` file** with CDN dependencies, it deploys to any static host in seconds:

### GitHub Pages (Current Live Demo)

```bash
# Push to main branch — GitHub Actions or Pages auto-deploys
git push origin main
# Live at: https://nagarajjan.github.io/Nasa-Space-App/
```

### Vercel

```bash
# Install Vercel CLI
npm install -g vercel

# Deploy from project root
vercel

# Follow prompts — deployed in ~30 seconds
# Live at: https://your-project.vercel.app
```

### Netlify

```bash
# Option 1: Drag and drop
# Go to https://app.netlify.com/drop
# Drag the entire project folder onto the page

# Option 2: CLI
npm install -g netlify-cli
netlify deploy --prod --dir=.
```

### Any Static Host

Upload `index.html` (and `run_demo.ps1`, `docker-compose.yml` are optional) to:
- AWS S3 + CloudFront
- Azure Static Web Apps
- Google Cloud Storage
- Cloudflare Pages

> [!TIP]
> No build configuration is needed. Just serve `index.html` at the root path.

---

## 🔧 Troubleshooting

### 🔴 NASA API Data Not Loading (Amber Badge Stays)

**Symptom:** The NASA badge stays amber; the PHA dropdown is empty.

**Causes & Fixes:**

| Cause | Fix |
|---|---|
| Running in `file://` mode | Use Method A, B, or C (HTTP server) |
| NASA JPL API is temporarily offline | Check [NASA API Status](https://api.nasa.gov/) and retry later |
| Browser blocked the request | Open browser DevTools (F12) → Console tab → check for CORS errors |
| Corporate firewall | Try from a different network or use the [live demo](https://nagarajjan.github.io/Nasa-Space-App/) |

```javascript
// In browser DevTools console, check for:
// Access to fetch at 'https://ssd-api.jpl.nasa.gov/...' has been blocked by CORS policy
```

---

### 🔴 Port 8080 Already in Use

**Symptom:** `OSError: [Errno 48] Address already in use`

```powershell
# Windows — Find and kill the process using port 8080
netstat -ano | findstr :8080
taskkill /PID <PID_NUMBER> /F

# Then restart
python -m http.server 8080

# Or use a different port
python -m http.server 3000
# Then open http://localhost:3000
```

```bash
# macOS / Linux
lsof -ti:8080 | xargs kill -9
python3 -m http.server 8080
```

---

### 🔴 WebGL Not Working / Black Canvas

**Symptom:** The 3D solar system canvas is black or shows a WebGL error.

**Fixes:**

1. **Enable hardware acceleration in your browser:**
   - Chrome: `chrome://flags/#enable-gpu-rasterization` → Enable
   - Edge: `edge://flags/#enable-gpu-rasterization` → Enable

2. **Update your browser** to Chrome 110+ / Edge 110+ / Firefox 110+

3. **Update GPU drivers** (especially on Windows)

4. **Try a different browser** — Chrome tends to have the best WebGL support

```
chrome://gpu  ← Check WebGL status in Chrome
```

---

### 🔴 PowerShell Script Blocked

**Symptom:** `run_demo.ps1 cannot be loaded because running scripts is disabled`

```powershell
# Run this ONCE as Administrator to allow local scripts
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Then retry
.\run_demo.ps1
```

---

### 🔴 Docker Container Won't Start

**Symptom:** `docker-compose up` fails or port 80 is in use.

```bash
# Check if port 80 is in use
netstat -ano | findstr :80

# Use a different port — edit docker-compose.yml:
# ports:
#   - "8081:80"
# Then open http://localhost:8081

# Reset Docker if needed
docker-compose down --remove-orphans
docker system prune
docker-compose up --build
```

---

### 🔴 Browser Compatibility

| Browser | Support | Notes |
|---|---|---|
| Chrome 110+ | ✅ Full | Recommended |
| Edge 110+ | ✅ Full | Chromium-based, excellent |
| Firefox 110+ | ✅ Full | Great WebGL support |
| Safari 16+ | ✅ Good | Minor visual differences possible |
| Chrome < 110 | ⚠️ Partial | Update recommended |
| IE / Legacy Edge | ❌ Not supported | WebGL 2.0 required |
| Mobile Chrome | ✅ Good | Touch controls supported |
| Mobile Safari | ⚠️ Partial | Performance may vary |

---

## 📁 Project Structure

```
aegis-planetary-defense/
│
├── 📄 index.html              # ← MAIN APP — entire platform in one file
│                              #   Includes: Three.js WebGL, Tailwind CSS, Chart.js
│                              #   NASA API calls, orbital mechanics, impact physics
│
├── ⚡ run_demo.ps1            # Windows PowerShell one-click launcher
│                              #   Starts Python server + opens browser automatically
│
├── 🐳 docker-compose.yml      # Docker deployment (nginx:alpine static server)
│
├── 📚 docs/
│   └── GETTING_STARTED.md    # ← This file
│
└── 📜 README.md               # Project overview, badges, team info
```

> [!NOTE]
> The entire application logic — 3D rendering, physics calculations, NASA API integration, UI components, and the pitch deck — lives in **`index.html`**. This is by design for hackathon portability: one file, zero setup, runs anywhere.

---

## 🏆 About This Project

**AEGIS-NEO** (Automated Early-Warning & Guidance Intelligence System for Near-Earth Objects) was built for the **NASA Space Apps Hackathon 2026** to make planetary defense data accessible, interactive, and visually compelling for scientists, policymakers, and the public.

### Tech Stack

| Technology | Role | Source |
|---|---|---|
| [Three.js](https://threejs.org/) r160 | 3D WebGL orbital renderer | CDN |
| [Tailwind CSS](https://tailwindcss.com/) v3 | Responsive UI styling | CDN |
| [Chart.js](https://www.chartjs.org/) v4 | Impact physics charts | CDN |
| NASA JPL CAD API | Live close-approach data | REST |
| NASA JPL SBDB API | Asteroid physical parameters | REST |

### Team

Built with 💙 for planetary defense awareness.

🔗 **GitHub:** [https://github.com/nagarajjan/Nasa-Space-App](https://github.com/nagarajjan/Nasa-Space-App)
🌐 **Live Demo:** [https://nagarajjan.github.io/Nasa-Space-App/](https://nagarajjan.github.io/Nasa-Space-App/)

---

*Last updated: October 2026 · NASA Space Apps Hackathon 2026*
