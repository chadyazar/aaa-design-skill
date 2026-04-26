# Brutalist Industrial Aesthetic — Two Modes
> Swiss Industrial Print: light substrate, heavy sans (Neue Haas Grotesk), red-only accent, 90° corners.
> Tactical Telemetry: dark CRT, monospace everything, phosphor glow, scanlines, ASCII framing.
> Extreme type scale contrast: 4rem+ headlines vs 10-14px labels. Reject border-radius entirely.

---

## Core Philosophy

Brutalism rejects decoration. Every visual decision must be load-bearing — structure, function, data. The two modes share a DNA: rigid grids, extreme scale contrast, utilitarian color, 90° corners. They differ in substrate: one is newsprint, one is CRT phosphor.

**Critical rule: Pick ONE mode per project. Never mix them.**

This aesthetic works for: design studio portfolios, experimental media, security/infrastructure tools, data-heavy dashboards, agency showreels, print-to-screen editorial.

---

## Mode 1: Swiss Industrial Print

### Color System

```css
:root {
  /* Paper substrate */
  --bg: #f4f4f0;              /* matte, unbleached documentation paper */
  --surface: #eaeae6;         /* slightly darker for secondary zones */
  --surface-elevated: #ffffff;

  /* Carbon ink */
  --text: #050505;            /* carbon ink — not pure black */
  --text-dim: #555555;
  --text-light: #888888;

  /* Hazard red — the ONLY accent. Used sparingly. */
  --accent: #e61919;
  --accent-alt: #ff2a2a;      /* brighter variant for digital */

  /* Borders — structural, not decorative */
  --border-thin: 1px solid #050505;
  --border-thick: 2px solid #050505;
  --border-accent: 3px solid #e61919; /* red horizontal rules as section dividers */

  /* No shadows — elevation via borders only */
  --shadow-sm: none;
  --shadow-md: none;

  /* 90° corners everywhere */
  --radius: 0px;
}
```

### Typography — Swiss Mode

```css
/* Font imports */
/* Neue Haas Grotesk or fallback: Archivo Black, Monument Extended */
/* @import url('https://fonts.bunny.net/css?family=archivo-black:400&display=swap'); */
/* @import url('https://fonts.bunny.net/css?family=ibm-plex-mono:400,500&display=swap'); */

:root {
  --font-macro: 'Neue Haas Grotesk', 'Archivo Black', 'Arial Black', sans-serif;
  --font-micro: 'IBM Plex Mono', 'JetBrains Mono', monospace;
  --font-body: 'Helvetica Neue', 'Helvetica', Arial, sans-serif;
}

/* Macro typography — structural, massive */
.heading-macro {
  font-family: var(--font-macro);
  font-size: clamp(4rem, 10vw, 15rem);
  font-weight: 900;
  letter-spacing: -0.04em;
  line-height: 0.9;
  text-transform: uppercase;
  color: var(--text);
}

/* Section heading — still large */
.heading-section {
  font-family: var(--font-macro);
  font-size: clamp(2rem, 5vw, 5rem);
  font-weight: 900;
  letter-spacing: -0.03em;
  line-height: 0.95;
  text-transform: uppercase;
  color: var(--text);
}

/* Micro-typography — telemetry, labels, metadata */
.label-micro {
  font-family: var(--font-micro);
  font-size: 10px; /* fixed — deliberate tiny */
  font-weight: 500;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--text-dim);
}

/* Data label */
.data-tag {
  font-family: var(--font-micro);
  font-size: 11px;
  letter-spacing: 0.06em;
  text-transform: uppercase;
}

/* Body */
body {
  font-family: var(--font-body);
  font-size: 0.9375rem;
  line-height: 1.5;
  color: var(--text);
  background: var(--bg);
}
```

### Layout — Swiss Mode

```css
/* Blueprint grid — every element anchored precisely */
.grid-blueprint {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: 1px;
  background: var(--text); /* parent is border color */
}

.grid-blueprint > * {
  background: var(--bg);
}

/* Section divider — thick red horizontal rule */
.section-divider {
  border: none;
  border-top: var(--border-accent);
  margin: 0;
}

/* Compartment — bordered zone */
.compartment {
  border: var(--border-thin);
  padding: 1.5rem;
}

/* Heavy vertical rule */
.vr {
  width: 2px;
  background: var(--text);
  align-self: stretch;
}

/* Navigation */
.nav-swiss {
  display: grid;
  grid-template-columns: 1fr auto;
  border-bottom: var(--border-thick);
  padding: 1rem 2rem;
  align-items: center;
}

.nav-logo-swiss {
  font-family: var(--font-macro);
  font-size: 1.25rem;
  font-weight: 900;
  letter-spacing: -0.02em;
  text-transform: uppercase;
  color: var(--text);
  text-decoration: none;
}
```

### Components — Swiss Mode

```css
/* Card — no elevation, pure borders */
.card-swiss {
  border: var(--border-thin);
  padding: 1.5rem;
  background: var(--surface-elevated);
}

/* Card with red accent top */
.card-swiss-accent {
  border: var(--border-thin);
  border-top: var(--border-accent);
  padding: 1.5rem;
  background: var(--surface-elevated);
}

/* Button — stark, no-nonsense */
.btn-swiss {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.75rem 1.5rem;
  background: var(--text);
  color: var(--bg);
  font-family: var(--font-micro);
  font-size: 0.75rem;
  font-weight: 500;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  border: none;
  border-radius: 0; /* NO radius — ever */
  cursor: pointer;
  transition: background 0.1s ease;
}

.btn-swiss:hover {
  background: var(--accent);
}

.btn-swiss:active {
  opacity: 0.85;
}

/* Ghost button */
.btn-swiss-ghost {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.75rem 1.5rem;
  background: transparent;
  color: var(--text);
  font-family: var(--font-micro);
  font-size: 0.75rem;
  font-weight: 500;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  border: var(--border-thin);
  border-radius: 0;
  cursor: pointer;
  transition: all 0.1s ease;
}

.btn-swiss-ghost:hover {
  background: var(--text);
  color: var(--bg);
}

/* Table — data presentation, Swiss style */
.table-swiss {
  width: 100%;
  border-collapse: collapse;
  font-family: var(--font-micro);
  font-size: 0.75rem;
}

.table-swiss th {
  font-weight: 500;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  text-align: left;
  padding: 0.75rem 1rem;
  border-bottom: var(--border-thick);
  color: var(--text);
}

.table-swiss td {
  padding: 0.75rem 1rem;
  border-bottom: var(--border-thin);
  color: var(--text-dim);
}

/* Status indicator — red dot */
.status-active::before {
  content: '';
  display: inline-block;
  width: 6px;
  height: 6px;
  background: var(--accent);
  margin-right: 6px;
  vertical-align: middle;
}

/* ASCII framing for labels */
.ascii-label::before { content: '[ '; }
.ascii-label::after  { content: ' ]'; }

.ascii-label-angle::before { content: '< '; }
.ascii-label-angle::after  { content: ' >'; }
```

---

## Mode 2: Tactical Telemetry

### Color System

```css
/* Apply to :root for full-page dark mode */
:root {
  --bg: #0a0a0a;             /* deactivated CRT — avoid pure #000000 */
  --surface: #111111;
  --surface-elevated: #1a1a1a;

  /* White phosphor */
  --text: #eaeaea;
  --text-dim: #666666;
  --text-light: #444444;

  /* Hazard red — same as Swiss mode, same rules */
  --accent-red: #e61919;

  /* Terminal green — for ONE specific UI element only */
  --accent-green: #00ff41;   /* phosphor green */
  --accent-green-dim: rgba(0, 255, 65, 0.08);

  /* Optional: amber variant */
  /* --accent: #ffb800; */

  /* Borders */
  --border-thin: 1px solid rgba(234, 234, 234, 0.15);
  --border-medium: 1px solid rgba(234, 234, 234, 0.3);

  /* No border-radius anywhere */
  --radius: 0px;
}
```

### CRT Effects

```css
/* Scanlines overlay — apply to a fixed pseudo-element, never on scrolling content */
body::after {
  content: '';
  position: fixed;
  inset: 0;
  z-index: 999;
  pointer-events: none;
  background: repeating-linear-gradient(
    0deg,
    transparent,
    transparent 2px,
    rgba(0, 0, 0, 0.15) 2px,
    rgba(0, 0, 0, 0.15) 4px
  );
}

/* Halftone dot background — for hero or full-bleed sections */
.bg-halftone {
  background-image: radial-gradient(
    circle,
    rgba(234, 234, 234, 0.06) 1px,
    transparent 1px
  );
  background-size: 6px 6px;
}

/* Mechanical noise — global grain */
body::before {
  content: '';
  position: fixed;
  inset: 0;
  z-index: 1000;
  pointer-events: none;
  opacity: 0.015;
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)'/%3E%3C/svg%3E");
}

/* Phosphor text glow — use ONLY on accent/status elements */
.phosphor-glow {
  text-shadow: 0 0 10px rgba(0, 255, 65, 0.4);
  color: var(--accent-green);
}

.phosphor-glow-subtle {
  text-shadow: 0 0 6px rgba(0, 255, 65, 0.25);
  color: var(--accent-green);
}
```

### Typography — Telemetry Mode

```css
:root {
  --font-all: 'JetBrains Mono', 'IBM Plex Mono', 'Courier Prime', monospace;
}

/* Everything is monospace in Telemetry mode */
body {
  font-family: var(--font-all);
  font-size: 0.875rem;
  line-height: 1.5;
  color: var(--text);
  background: var(--bg);
  font-variant-numeric: tabular-nums;
  -webkit-font-smoothing: subpixel-antialiased;
}

/* Macro heading — still fluid but via clamp */
.heading-terminal {
  font-family: var(--font-all);
  font-size: clamp(2rem, 6vw, 8rem);
  font-weight: 700;
  letter-spacing: -0.02em;
  line-height: 0.95;
  text-transform: uppercase;
  color: var(--text);
}

/* Data readout — micro labels */
.readout {
  font-family: var(--font-all);
  font-size: 11px;
  letter-spacing: 0.06em;
  text-transform: uppercase;
  color: var(--text-dim);
}

/* ASCII framing */
.ascii-frame { color: var(--text-dim); }
.ascii-bracket::before { content: '[ '; color: var(--text-dim); }
.ascii-bracket::after  { content: ' ]'; color: var(--text-dim); }
.ascii-angle::before   { content: '< '; color: var(--text-dim); }
.ascii-angle::after    { content: ' >'; color: var(--text-dim); }
.ascii-slash::before   { content: '/// '; color: var(--text-dim); }

/* Decorative strings — REV identifiers, unit IDs */
.rev-tag {
  font-family: var(--font-all);
  font-size: 10px;
  letter-spacing: 0.12em;
  color: var(--text-dim);
  opacity: 0.5;
}
```

### Components — Telemetry Mode

```css
/* Card — bordered zone, no elevation */
.card-terminal {
  border: var(--border-thin);
  padding: 1rem 1.25rem;
  background: var(--surface);
  position: relative;
}

/* Card with corner-bracket decoration */
.card-terminal::before {
  content: '';
  position: absolute;
  top: -1px;
  left: -1px;
  width: 12px;
  height: 12px;
  border-top: 1px solid var(--accent-green);
  border-left: 1px solid var(--accent-green);
}

/* Status badge — green dot + label */
.status-online {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  font-family: var(--font-all);
  font-size: 11px;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--accent-green);
}

.status-online::before {
  content: '';
  display: block;
  width: 6px;
  height: 6px;
  background: var(--accent-green);
  border-radius: 50%;
  box-shadow: 0 0 6px rgba(0, 255, 65, 0.5);
  animation: pulse-dot 2s infinite;
}

.status-offline {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  font-family: var(--font-all);
  font-size: 11px;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--text-dim);
}

.status-offline::before {
  content: '';
  display: block;
  width: 6px;
  height: 6px;
  background: var(--text-dim);
  border-radius: 50%;
}

@keyframes pulse-dot {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.4; }
}

/* Button — monospace, no radius */
.btn-terminal {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.625rem 1.25rem;
  background: transparent;
  color: var(--text);
  font-family: var(--font-all);
  font-size: 0.75rem;
  font-weight: 500;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  border: var(--border-medium);
  border-radius: 0;
  cursor: pointer;
  transition: all 0.1s ease;
}

.btn-terminal:hover {
  background: rgba(234, 234, 234, 0.06);
  border-color: rgba(234, 234, 234, 0.5);
  color: var(--text);
}

/* Accent button */
.btn-terminal-accent {
  background: var(--accent-green);
  color: var(--bg);
  border-color: var(--accent-green);
  text-shadow: none;
}

.btn-terminal-accent:hover {
  background: rgba(0, 255, 65, 0.85);
  box-shadow: 0 0 16px rgba(0, 255, 65, 0.2);
}

/* Log entry row */
.log-entry {
  display: grid;
  grid-template-columns: auto 1fr auto;
  gap: 1rem;
  padding: 0.5rem 0;
  border-bottom: 1px solid rgba(234, 234, 234, 0.06);
  font-family: var(--font-all);
  font-size: 0.75rem;
  align-items: center;
}

.log-timestamp {
  color: var(--text-dim);
  font-size: 11px;
  white-space: nowrap;
  letter-spacing: 0.04em;
}

.log-message {
  color: var(--text);
}

.log-level-ok   { color: var(--accent-green); }
.log-level-warn { color: #ffb800; }
.log-level-err  { color: var(--accent-red); }

/* Metric card */
.metric-card {
  border: var(--border-thin);
  padding: 1rem;
  background: var(--surface);
}

.metric-value {
  font-family: var(--font-all);
  font-size: clamp(1.75rem, 3vw, 2.5rem);
  font-weight: 700;
  color: var(--text);
  letter-spacing: -0.02em;
  font-variant-numeric: tabular-nums;
  line-height: 1;
}

.metric-label {
  font-family: var(--font-all);
  font-size: 10px;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: var(--text-dim);
  margin-top: 0.5rem;
}

.metric-delta-up   { color: var(--accent-green); font-size: 11px; }
.metric-delta-down { color: var(--accent-red); font-size: 11px; }

/* Cursor blink */
.cursor-blink::after {
  content: '_';
  animation: blink 1s step-end infinite;
}

@keyframes blink {
  0%, 100% { opacity: 1; }
  50% { opacity: 0; }
}
```

---

## Shared Rules (Both Modes)

```css
/* CRITICAL: Zero border-radius. Everywhere. No exceptions. */
* {
  border-radius: 0 !important; /* use sparingly as a reset; prefer explicit 0 on components */
}

/* Grid determinism — elements anchor to grid, not float */
.grid-deterministic {
  display: grid;
  gap: 1px;
}

/* Extreme type contrast — the defining pattern */
.type-contrast-demo {
  /* Headline: massive */
  /* h1 */ font-size: clamp(4rem, 10vw, 15rem); font-weight: 900;
  /* Labels: tiny */ font-size: 10px; font-weight: 500; letter-spacing: 0.1em;
  /* The gap between these two is the whole aesthetic */
}
```

### Motion — Both Modes

No spring physics, no gentle fades. Motion is either none or abrupt.

```css
/* Swiss: minimal transitions */
.btn-swiss,
.btn-swiss-ghost {
  transition: background 0.1s ease, color 0.1s ease;
}

/* Telemetry: same — fast, mechanical */
.btn-terminal {
  transition: background 0.1s ease, border-color 0.1s ease;
}

/* Scroll entry — NO translateY bounce. Just opacity. */
.reveal-brutal {
  opacity: 0;
  transition: opacity 0.3s ease;
}

.reveal-brutal.visible {
  opacity: 1;
}

@media (prefers-reduced-motion: reduce) {
  .reveal-brutal { opacity: 1 !important; transition: none !important; }
}
```

---

## Banned Patterns

| Pattern | Mode | Why banned |
|---------|------|------------|
| Any `border-radius` > 0 | Both | Core rule — mechanical rigidity |
| Gradients (decorative) | Both | Gradients are "soft" — antithetical to industrial feel |
| Soft drop shadows | Both | Elevation via borders, not shadows |
| Thin-stroke sans-serif | Swiss | Headlines must be monolithic, heavy |
| Serif fonts (unprocessed) | Both | Only allowed with halftone degradation in Swiss mode |
| Purple/blue/teal accents | Swiss | Red is the ONLY accent color |
| More than one accent color | Both | One accent. Used sparingly. |
| Rounded pill buttons | Both | Buttons are rectangles. Always. |
| Glassmorphism / blur | Both | Never — physically incompatible |
| Spring/bounce animation | Both | Motion is mechanical, not elastic |
| Centered hero text | Swiss | Left-aligned. Print-derived. |
| Emoji | Both | Replaced with ASCII symbols or none |
