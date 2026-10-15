# AEGIS-NEO: Autonomous Planetary Defense & Impact Intelligence Suite
### NASA Space Apps Challenge Project | Planetary Defense & Asteroid Hazard Tracker

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![NASA JPL SBDB](https://img.shields.io/badge/NASA%20Data-JPL%20SBDB%20%26%20NeoWs-blue)](https://ssd.jpl.nasa.gov/)
[![WebGL 3D](https://img.shields.io/badge/3D%20Engine-Three.js-cyan)](#)

---

## 🌟 Executive Summary

**AEGIS-NEO** is a real-time, WebGL-powered planetary defense intelligence platform built for the **NASA Space Apps Challenge**. It translates raw telemetry from the **NASA JPL Small-Body Database (SBDB)** and **CNEOS Sentry** into:
1. **Interactive 3D Keplerian Orbital Mechanics**: Real-time celestial propagation solving Kepler's transcendental equations via Newton-Raphson numerical solvers.
2. **Impact Energetics & Damage Physics Engine**: Micro-to-macro impact calculations (Megatons TNT, transient/final crater scaling via Collins et al., 5-psi overpressure shockwave envelopes, thermal radiation ignition radii, and seismic coupling).
3. **DART Kinetic Impactor Deflection Simulator**: Empirical momentum transfer models ($\Delta v$) calibrated by NASA's historic **DART (Double Asteroid Redirection Test)** mission, projecting multi-year secular orbital divergence at Earth intercept.

---

## 🚀 Quick Start: Launching the Prototype

Because **AEGIS-NEO** is engineered with zero server lock-in, you can launch it immediately:

### Option 1: Direct Browser Launch
Simply double-click or open `index.html` in any modern web browser (Chrome, Edge, Firefox, Safari).

### Option 2: Local Python Server (Recommended for Live Demos)
```bash
cd "C:\Users\User\.gemini\antigravity\scratch\aegis-planetary-defense"
python -m http.server 8080
```
Then visit: `http://localhost:8080` in your web browser.

---

## 🛰️ Scientific Methodology & Mathematical Formulations

### 1. Keplerian Orbit Determination
Position vectors $\mathbf{r}(t)$ in heliocentric ecliptic coordinates are computed by solving Kepler's equation:
$$M = E - e \sin E$$
Where $M$ is Mean Anomaly, $E$ is Eccentric Anomaly, and $e$ is Orbital Eccentricity. Coordinates in the orbital plane are rotated via Euler angles:
- $\omega$: Argument of Perihelion
- $\Omega$: Longitude of the Ascending Node
- $i$: Orbital Inclination

### 2. Kinetic Impact Scaling Laws
Crater dimensions are modeled using Holsapple-Schmidt & Collins crater scaling:
$$D_{\text{crater}} \approx 1.161 \left(\frac{\rho_{\text{imp}}}{\rho_{\text{targ}}}\right)^{1/3} d^{0.78} v_{\text{entry}}^{0.44} g^{-0.22} (\sin \theta)^{1/3}$$

### 3. DART-Derived Deflection Physics
Momentum transfer induced by a kinetic spacecraft impactor:
$$\Delta v = \beta \frac{m_{\text{sc}} \cdot v_{\text{rel}}}{M_{\text{asteroid}}}$$
Where $\beta$ is the ejecta momentum enhancement factor ($2.2 \le \beta \le 3.6$ from DART Dimorphos observations).
The resulting secular orbital miss distance at Earth encounter after warning lead time $\Delta t$ is:
$$\Delta r_{\text{miss}} \approx 3 \cdot \Delta v \cdot \Delta t$$

---

## 🏆 NASA Space Apps Pitch Deck Structure

Click the **"Pitch Deck Outline"** button directly inside the app header to view the slide-by-slide script, timing, and judging cheat sheet!

| Slide # | Slide Title | Space Apps Judging Category |
| :--- | :--- | :--- |
| **Slide 1** | **The Threat: The Invisible Kinetic Hazard** | Challenge Relevance & Problem Hook |
| **Slide 2** | **NASA Open Data & Telemetry Ingestion** | NASA Data Use (20%) |
| **Slide 3** | **AEGIS-NEO System Architecture** | Technical Rigor & Scientific Validity (20%) |
| **Slide 4** | **Live Prototype Walkthrough (99942 Apophis)** | Innovation & Prototype Execution (25%) |
| **Slide 5** | **Planetary Defense Sandbox (DART Legacy)** | Creativity & Actionable Impact (20%) |
| **Slide 6** | **Global Policy & Civil Protection Integration** | Practical Real-world Value |
| **Slide 7** | **Roadmap & Open Science Community** | Scalability & Open Source Commitment (15%) |

---

## 📡 NASA APIs & Datasets Integrated
- **NASA JPL Small-Body Database (SBDB) API**: `https://ssd-api.jpl.nasa.gov/sbdb.api`
- **NASA NeoWs (Near Earth Object Web Service)**: `https://api.nasa.gov/neo/rest/v1/feed`
- **NASA CNEOS Sentry Risk Table**: `https://cneos.jpl.nasa.gov/sentry/`
- **NASA DART Mission Telemetry Archives**: Johns Hopkins APL & NASA PDS SBN.

---

## 📄 License
This project is licensed under the MIT License - built for the NASA International Space Apps Challenge.
