# 🔬 Scientific Methodology & Mathematical Formulations: AEGIS-NEO
### Mathematical Modeling of Keplerian Orbits, Impact Energetics, and Kinetic Deflection

---

## 1. Keplerian Celestial Mechanics & Propagation

### A. Kepler's Equation and Newton-Raphson Numerical Solution
An asteroid's orbital state at any epoch $t$ is parameterized by its six classical Keplerian orbital elements:
- $a$: Semi-major axis ($\text{AU}$)
- $e$: Orbital eccentricity ($0 \le e < 1$ for bound orbits)
- $i$: Orbital inclination ($\text{deg}$)
- $\Omega$: Longitude of the ascending node ($\text{deg}$)
- $\omega$: Argument of perihelion ($\text{deg}$)
- $M_0$: Mean anomaly at initial epoch $t_0$ ($\text{rad}$)

The mean anomaly $M(t)$ advances linearly with time:
$$M(t) = M_0 + n(t - t_0) = M_0 + \sqrt{\frac{\mu}{a^3}}(t - t_0)$$
Where $\mu = G M_{\odot} \approx 1.3271244 \times 10^{20}\text{ m}^3/\text{s}^2$ is the heliocentric gravitational parameter.

The transcendental **Kepler's Equation** relates Mean Anomaly $M$ to Eccentric Anomaly $E$:
$$f(E) = E - e \sin E - M = 0$$

AEGIS-NEO solves this iteratively using the **Newton-Raphson scheme**:
$$E_{k+1} = E_k - \frac{f(E_k)}{f'(E_k)} = E_k - \frac{E_k - e \sin E_k - M}{1 - e \cos E_k}$$
Starting with initial seed $E_0 = M + e \sin M$, convergence is achieved when $|E_{k+1} - E_k| < 10^{-6}\text{ rad}$, which occurs in $3 - 5$ iterations.

### B. Orbital Plane Coordinates to Heliocentric Ecliptic System
In the asteroid's orbital plane, Cartesian coordinates $(x_{\text{orb}}, y_{\text{orb}}, 0)$ are:
$$x_{\text{orb}} = a (\cos E - e)$$
$$y_{\text{orb}} = a \sqrt{1 - e^2} \sin E$$

These coordinates are transformed to 3D Heliocentric Ecliptic Cartesian coordinates $(x, y, z)$ via the rotation sequence:
$$\begin{bmatrix} x \\ y \\ z \end{bmatrix} = \mathbf{R}_z(-\Omega) \, \mathbf{R}_x(-i) \, \mathbf{R}_z(-\omega) \begin{bmatrix} x_{\text{orb}} \\ y_{\text{orb}} \\ 0 \end{bmatrix}$$
Expanding the matrix components:
$$\begin{aligned}
x &= x_{\text{orb}}(\cos\omega \cos\Omega - \sin\omega \cos i \sin\Omega) - y_{\text{orb}}(\sin\omega \cos\Omega + \cos\omega \cos i \sin\Omega) \\
y &= x_{\text{orb}}(\cos\omega \sin\Omega + \sin\omega \cos i \cos\Omega) + y_{\text{orb}}(\cos\omega \cos i \cos\Omega - \sin\omega \sin\Omega) \\
z &= x_{\text{orb}}(\sin\omega \sin i) + y_{\text{orb}}(\cos\omega \sin i)
\end{aligned}$$

---

## 2. Impact Consequence & Damage Scaling Laws

### A. Total Kinetic Energy Conversion
Assuming an equivalent spherical diameter $d$ and bulk density $\rho_{\text{imp}}$:
$$M_{\text{ast}} = \frac{4}{3} \pi \left(\frac{d}{2}\right)^3 \rho_{\text{imp}}$$
The kinetic energy at atmospheric entry velocity $v_{\text{entry}}$ is:
$$E_{\text{kinetic}} = \frac{1}{2} M_{\text{ast}} v_{\text{entry}}^2 \quad [\text{Joules}]$$

Converted to Megatons of TNT ($1\text{ Mt TNT} \equiv 4.184 \times 10^{15}\text{ Joules}$):
$$Y_{\text{Mt}} = \frac{E_{\text{kinetic}}}{4.184 \times 10^{15}}$$

### B. Final Crater Diameter (Collins, Melosh & Marcus Scaling)
For terrestrial target rock density $\rho_{\text{target}} \approx 2500\text{ kg/m}^3$ and surface gravity $g = 9.81\text{ m/s}^2$:
$$D_{\text{crater}} \approx 1.161 \left(\frac{\rho_{\text{imp}}}{\rho_{\text{target}}}\right)^{1/3} d^{0.78} v_{\text{entry}}^{0.44} g^{-0.22} (\sin \theta)^{1/3} \quad [\text{meters}]$$
Where $\theta$ is the trajectory impact angle relative to the horizon ($\theta = 45^\circ$ represents the median statistical distribution).

### C. Atmospheric Overpressure (5-psi Structural Collapse Radius)
The peak blast overpressure $\Delta P$ propagates radially outward according to point-source blast wave scaling:
$$R_{\text{blast}} \approx 2.2 \cdot \left(Y_{\text{Mt}}\right)^{0.33} \quad [\text{km}]$$
At this radius, overpressure reaches $5\text{ psi}$ ($34.5\text{ kPa}$), which causes structural collapse of reinforced concrete and masonry buildings, resulting in widespread fatalities in populated urban centers.

### D. Thermal Radiation (3rd-Degree Burn Boundary)
The radiant thermal exposure $Q$ sufficient to ignite standard wood and cause full-thickness (3rd-degree) burns across exposed skin is modeled by:
$$R_{\text{thermal}} \approx 1.8 \cdot \left(Y_{\text{Mt}}\right)^{0.41} \quad [\text{km}]$$

### E. Seismic Coupling Magnitude ($M_w$)
A fraction $\eta_{\text{seismic}} \approx 10^{-4}$ of kinetic energy couples directly into seismic waves. The equivalent moment magnitude $M_w$ is given by:
$$M_w = 0.67 \log_{10}(E_{\text{seismic}}) - 5.87$$

---

## 3. Planetary Defense: NASA DART Momentum Transfer Kinematics

NASA's **Double Asteroid Redirection Test (DART)** demonstrated that hypervelocity kinetic impact generates backwards-ejected crater debris, enhancing the net momentum transfer beyond a simple inelastic collision:

$$\mathbf{p}_{\text{final}} = m_{\text{sc}} \mathbf{v}_{\text{rel}} + \mathbf{p}_{\text{ejecta}} = \beta \cdot m_{\text{sc}} \mathbf{v}_{\text{rel}}$$
Where $\beta$ is the **momentum enhancement factor**:
- $\beta = 1.0$: Pure inelastic collision (no ejecta boost).
- $\beta \approx 2.2 - 3.6$: Empirical range measured by NASA's DART mission at Dimorphos (high-porosity carbonaceous rubble pile).
- $\beta \approx 1.2 - 1.5$: Metallic/dense monolithic iron bodies.

The velocity change $\Delta v$ imparted to the asteroid is:
$$\Delta v = \beta \frac{m_{\text{sc}} \cdot v_{\text{rel}}}{M_{\text{asteroid}}} \quad [\text{m/s}]$$

### Secular Orbital Divergence at Earth Encounter
When applied along the orbital velocity vector at warning lead time $\Delta t_{\text{lead}}$, the change in semi-major axis alters the orbital period:
$$\Delta P = 3 \pi \sqrt{\frac{a}{\mu}} \Delta a = \frac{3 P}{v_{\text{orb}}} \Delta v$$

Over lead time $\Delta t_{\text{lead}}$, the accumulated along-track displacement $\Delta r_{\text{miss}}$ compounds into:
$$\Delta r_{\text{miss}} \approx 3 \cdot \Delta v \cdot \Delta t_{\text{lead}}$$

If $\Delta r_{\text{miss}} > 2 \cdot R_{\oplus}$ ($R_{\oplus} = 6,371\text{ km}$), the impact corridor is completely cleared, and Earth is safe.
