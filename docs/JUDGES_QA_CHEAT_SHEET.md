# 🎯 Judges' Q&A Defense Strategy: AEGIS-NEO
### Comprehensive Expert Defense Cheat Sheet — NASA Space Apps Hackathon 2026

---

## Section 1: Data & Science

**Q: Is the asteroid data live or pre-loaded?**
> **A:** Live — on page load, AEGIS-NEO queries the **NASA JPL CAD API** (`https://ssd-api.jpl.nasa.gov/cad.api`) and fetches the **60 most significant Potentially Hazardous Asteroids (PHAs)** making close Earth approaches in the next 365 days. When a user selects any live PHA, a second call to the **SBDB API** (`https://ssd-api.jpl.nasa.gov/sbdb.api`) loads its real Keplerian orbital elements in real time. If the network is unavailable, the app gracefully falls back to a curated 6-asteroid database so the simulation never breaks.

---

**Q: How many asteroids are tracked?**
> **A:** AEGIS-NEO displays **60 live PHAs** (close approaches within the next 365 days, fetched from NASA JPL on load) plus **6 curated landmark NEOs** (Apophis, Bennu, Ryugu, etc.) as permanent reference bodies. For context, NASA currently tracks ~35,000 NEOs and ~1.3 million asteroids in the Main Belt total.

---

**Q: Are the orbital mechanics accurate?**
> **A:** Yes, for visualization and educational purposes. We use a **Newton-Raphson Keplerian propagator** fed directly with real JPL orbital elements (semi-major axis, eccentricity, inclination, RAAN, argument of perihelion). This gives accurate position propagation at 60 FPS in the browser. We explicitly note it is not a precision mission-planning tool — it ignores higher-order perturbations like solar radiation pressure and planetary oblateness, which require full N-body integrators like JPL Horizons.

---

**Q: What is the Laplace 1:2:4 resonance shown for Io?**
> **A:** This is a **real mean-motion orbital resonance** between Io, Europa, and Ganymede. For every one orbit Ganymede completes, Europa completes exactly two and Io completes exactly four. This gravitational lock continuously pumps energy into Io's interior via tidal flexing, making Io the most volcanically active body in the Solar System. AEGIS-NEO renders all three moons with correct period ratios so this resonance is visually apparent in real time.

---

**Q: Why is Jupiter scaled at 2.8 AU instead of its real 5.2 AU?**
> **A:** Pure **viewport scaling** — if Jupiter were placed at its true 5.2 AU on the same canvas as Mercury at 0.39 AU, the inner planets would be sub-pixel and the simulation would be unusable. We compress the outer Solar System logarithmically. Critically, all **orbital periods, Keplerian physics, and gravitational parameters remain correctly calculated** using actual values; only the rendered distance is compressed for usability.

---

## Section 2: Technology

**Q: Does it need any installation?**
> **A:** No. AEGIS-NEO is a **pure browser app** — zero install, zero plugins, zero accounts. Open `index.html` directly or serve locally with `python -m http.server 8080` and navigate to `http://localhost:8080`. All dependencies (Three.js r128, Tailwind CSS, Chart.js) are loaded from CDN.

---

**Q: What happens if the internet is down during the demo?**
> **A:** The browser caches CDN assets after first load, so Three.js, Tailwind, and Chart.js will still work. The NASA JPL API calls will fail gracefully — the app automatically falls back to the **curated 6-asteroid offline database**. All orbital mechanics, impact physics calculations, and deflection simulations remain fully functional offline.

---

**Q: Why Three.js instead of Unreal Engine or Unity?**
> **A:** Three.js gives us **zero install, instant cross-platform browser access, open-source licensing, and no runtime fees**. A judge can open AEGIS-NEO on any laptop, tablet, or Chromebook with no downloads, no plugins, and no accounts. Unreal/Unity would require a compiled binary or WebAssembly bundle of hundreds of megabytes, which contradicts the hackathon spirit of accessible, open tools.

---

**Q: Is MATLAB used anywhere in the project?**
> **A:** No. The entire stack is **explicitly open-source and royalty-free**: Three.js (WebGL renderer), vanilla JavaScript (physics engine), Tailwind CSS (styling), and Chart.js (data visualization). There are no commercial or proprietary dependencies of any kind.

---

## Section 3: Planetary Defense Science

**Q: What crater scaling law is used in the impact calculator?**
> **A:** We implement the **Collins & Melosh Pi-group scaling** law (the industry standard in planetary defense research) combined with **Holsapple (1993) gravity-scaled depth formula** for crater morphology. These are the same frameworks used by NASA's Planetary Defense Coordination Office for consequence assessment. The calculator accounts for impactor diameter, density, velocity, impact angle, and target surface gravity.

---

**Q: What is the DART beta (β) factor and what value do you use?**
> **A:** The **momentum enhancement factor β** quantifies how much extra momentum is transferred to the asteroid by the recoil from ejecta expelled during impact — beyond the momentum of the spacecraft alone. A value of β=1.0 means no ejecta benefit; higher values mean the ejecta "rocket effect" amplifies the deflection. NASA's DART mission measured β between **2.2 and 3.6** for Dimorphos. AEGIS-NEO uses **β = 2.4** as the empirically-grounded midpoint default, which users can adjust in the deflection sandbox.

---

**Q: Can it simulate impacts on planets and moons other than Earth?**
> **A:** Yes — the **Impact Physics tab** includes a **Target Body dropdown** with 7 options: **Earth, Moon (Luna), Mars, Phobos, Jupiter (gas giant), Europa, and Ganymede**. Each body uses its correct surface gravity, bulk density, and atmospheric parameters. Simulating an impact on Phobos vs. Europa vs. Earth produces dramatically different crater scaling, ejecta velocity, and energy dissipation results.

---

**Q: What is the Torino Scale?**
> **A:** The Torino Scale is an integer **0–10 impact risk communication scale** used by astronomers and media to convey both collision probability and kinetic energy to the public. 0 = no hazard (virtually all known NEOs), 10 = certain catastrophic collision with global consequences. Apophis briefly peaked at **Torino 4** in 2004 (the highest ever for any known asteroid) before improved astrometry reduced it to 0. AEGIS-NEO displays Torino ratings for curated objects.

---

## Section 4: Solar System Bodies

**Q: Which planets are simulated?**
> **A:** **Mercury, Venus, Earth, Mars, and Jupiter**, all with real Keplerian orbital elements and correct sidereal periods. Saturn, Uranus, and Neptune are planned for the next development phase. The Main Asteroid Belt is represented by **900 particles** distributed across the 2.1–2.6 AU zone, giving an accurate sense of belt density and structure.

---

**Q: Which moons are shown and labelled?**
> **A:** **7 moons total**, all rendered with 3D floating labels:
> - **Earth system**: Luna
> - **Mars system**: Phobos, Deimos
> - **Jupiter system**: Io, Europa, Ganymede, Callisto
>
> All moons use correct orbital radii (scaled) and real sidereal periods, so the Io/Europa/Ganymede Laplace resonance is visually observable.

---

**Q: Why is only Earth's Moon focused on initially?**
> **A:** The **Earth-Moon system is where ~99% of PHA impact risk is concentrated**. The initial focus keeps the UI intuitive for non-specialists. The **Planet/Moon System Focus Toggle** lets users switch to Mars, Jupiter, or any individual moon sub-view with one click, providing gravitational context for multi-body scenarios.

---

**Q: Can meteoroids/asteroids impact other planets and moons in the simulation?**
> **A:** Yes — the **Impact Physics tab** has a full **Target Body selector**. Users can select Phobos, Europa, Ganymede, or any supported body and run the full impact consequence model with surface-gravity-correct physics. This was intentionally designed to show that planetary defense is a Solar System-wide concern, not just an Earth problem.

---

## Section 5: NASA Challenge Alignment

**Q: How does AEGIS-NEO directly address the Planetary Defense challenge?**
> **A:** It addresses the challenge at every layer: **detection** (live 60-PHA feed from NASA JPL), **characterization** (SBDB orbital elements + physical parameters on demand), **consequence assessment** (peer-reviewed crater scaling for 7 target bodies), and **deflection planning** (DART-calibrated kinetic impactor sandbox). It is not just a visualization — it is an end-to-end decision-support pipeline from raw NASA data to actionable deflection ΔV calculations.

---

**Q: Who are the target users?**
> **A:** AEGIS-NEO is designed for a **layered audience**:
> 1. **Science communicators & educators** — engaging, accurate 3D Solar System for classroom or public outreach
> 2. **Students & citizen scientists** — real NASA data, no install barrier
> 3. **Policy makers & emergency planners** (FEMA, UN-SPIDER) — translates abstract Torino scores into physical hazard radii (blast zone, thermal radius, seismic coupling)
> 4. **Early-career researchers** — open-source codebase to fork and extend with higher-fidelity integrators

---

**Q: What makes AEGIS-NEO unique versus NASA's existing "Eyes on Asteroids"?**
> **A:** NASA's Eyes on Asteroids is an outstanding **observational** visualization. AEGIS-NEO is an **interactive decision-support platform**. The key differentiators:
> - Live data + 3D orbital visualization + impact physics + deflection sandbox — **all in one browser app**
> - **No install** — runs on any device with a browser
> - **Actionable outputs**: blast radius, thermal zone, seismic score, required ΔV for deflection
> - **Open source** (MIT License) — forkable and extensible by the research community

---

## Section 6: Deployment & Access

**Q: Where is the project deployed?**
> **A:**
> - **GitHub Repository**: https://github.com/nagarajjan/Nasa-Space-App
> - **GitHub Pages (live demo)**: https://nagarajjan.github.io/Nasa-Space-App/

---

**Q: How do judges run it locally?**
> **A:** Two options:
> ```bash
> # Option 1: Python local server (recommended)
> cd aegis-planetary-defense
> python -m http.server 8080
> # Open: http://localhost:8080
> ```
> ```powershell
> # Option 2: PowerShell one-click launcher
> .\run_demo.ps1
> ```
> Or simply double-click `index.html` to open in browser (note: some API calls require a server origin for CORS).

---

**Q: Is the project open source?**
> **A:** Yes — **MIT License**. The full source code is publicly available on GitHub. All NASA data APIs used are public and require no API keys (CAD API and SBDB API are unauthenticated). The project is designed to be forked, extended, and built upon by the planetary defense research community.

---

*AEGIS-NEO — Real NASA Data · Real Physics · Zero Install · Open Source*  
*NASA Space Apps Hackathon 2026*
