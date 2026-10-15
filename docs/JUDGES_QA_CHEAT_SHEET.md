# 🎯 Judges' Q&A Defense Strategy: AEGIS-NEO
### Expert Defense Cheat Sheet for NASA Space Apps Hackathon Presentation

---

### Q1: *"How does asteroid composition affect your deflection simulation?"*
> **Answer**:  
> *"Asteroid composition determines two crucial physical variables in AEGIS-NEO: **bulk density** (which dictates total mass) and the **ejecta momentum enhancement factor $\beta$**.  
> In our prototype, users can select between cometary ice ($1.2\text{ g/cm}^3$), carbonaceous rubble piles ($2.0\text{ g/cm}^3$), stony chondrites ($2.6\text{ g/cm}^3$), and nickel-iron metallic bodies ($5.3\text{ g/cm}^3$).  
> For porous rubble piles like Bennu or Dimorphos, the cratering process ejects massive debris in the retrograde direction, boosting $\beta$ to between $2.4$ and $3.6$. For monolithic metallic asteroids, little ejecta is liberated, so $\beta \approx 1.2$. Our sandbox allows judges to test both regimes in real time."*

---

### Q2: *"Why did you use Keplerian propagation instead of N-body numerical integration?"*
> **Answer**:  
> *"That was an intentional architectural choice balancing speed and scientific utility.  
> Solving Kepler's equation via Newton-Raphson runs natively inside the client browser at 60 FPS without requiring heavy cloud compute servers. It provides instantaneous feedback on orbital mechanics, inclination angles, and secular drift.  
> For multi-decade gravitational perturbations involving planetary flybys, our modular architecture is designed to ingest high-order integrator state vectors directly from NASA's Horizons REST API."*

---

### Q3: *"How does this help emergency managers on the ground?"*
> **Answer**:  
> *"Existing hazard metrics like Torino and Palermo assign a single integer or logarithmic risk score that emergency managers and civil defense coordinators (e.g., FEMA or UN-SPIDER) cannot translate into evacuation plans.  
> AEGIS-NEO translates that abstract score into concrete physical hazard boundaries:
> 1. The **5-psi overpressure shockwave radius** defines where residential masonry collapses and immediate evacuation is mandatory.
> 2. The **thermal radiation radius** indicates where spontaneous fires will ignite, informing fire department resources.
> 3. The **seismic coupling score** alerts regional infrastructure managers to potential dam breaches and bridge failures."*

---

### Q4: *"What is the significance of the 2029 Apophis encounter in your demo?"*
> **Answer**:  
> *"99942 Apophis is humanity's greatest planetary defense learning opportunity. On April 13, 2029, it will pass within 31,000 km of Earth's surface—closer than our geostationary satellites and ten times closer than the Moon.  
> While optical and radar astrometry have ruled out an impact in 2029, Earth's tidal gravitational forces will reshape its spin state and orbit. AEGIS-NEO uses Apophis as our primary benchmark to demonstrate what would happen if a 370-meter asteroid were on a collision course, and how a DART-style mission executed 5 years prior can safely avert catastrophe."*

---

### Q5: *"What makes AEGIS-NEO unique compared to NASA's existing 'Eyes on Asteroids'?"*
> **Answer**:  
> *"NASA's Eyes on Asteroids is an outstanding public visualization tool, but it is purely observational—it does not allow users to simulate hypothetical impacts, model physical damage parameters, or test deflection missions.  
> AEGIS-NEO is an **actionable intelligence and decision-support platform**: it combines orbital visualization with peer-reviewed damage physics and interactive DART-derived kinetic deflection planning in a single open-source suite."*
