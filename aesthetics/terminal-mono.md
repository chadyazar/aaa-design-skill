# Terminal Mono Aesthetic
> Everything monospace. Green/cyan accents on near-black (#0a0a0a).
> Dot grid background, 8px radius (friendly, not brutalist), tabular numbers.
> Code-native feel for developer tools, dashboards, command centers.

---

## Core Philosophy

Terminal Mono is code-native UI. Not brutalist (no 90° corners, no CRT scanlines) — more like a well-designed IDE or modern terminal emulator. Dense information, monospace everything, near-black backgrounds, and a single cyan or green accent that punches through the dark.

The key differentiator from Tactical Telemetry: **8px radius and no scanlines**. It's friendlier — a modern developer dashboard, not classified military hardware.

This aesthetic works for: developer dashboards, API clients, monitoring tools, command centers, SaaS admin panels, log viewers, data terminals, coding-related marketing sites.

---

## Color System

```css
:root {
  /* Dark canvas — near-black, not pure black */
  --bg: #0a0a0a;
  --surface: #141414;
  --surface-elevated: #1e1e1e;
  --surface-hover: rgba(255, 255, 255, 0.03);

  /* Borders — low-opacity white */
  --border: rgba(255, 255, 255, 0.08);
  --border-strong: rgba(255, 255, 255, 0.15);
  --border-accent: rgba(34, 211, 238, 0.25);

  /* Text */
  --text: #e0e0e0;
  --text-secondary: #888888;
  --text-dim: #555555;
  --text-on-accent: #000000;

  /* Accent — choose ONE */
  /* Cyan (default):  */ --accent: #22d3ee;
  /* Green (classic): */ /* --accent: #34d399; */
  /* Amber (warm):    */ /* --accent: #f59e0b; */
  --accent-dim: rgba(34, 211, 238, 0.08);
  --accent-border: rgba(34, 211, 238, 0.2);

  /* Semantic colors */
  --color-success: #34d399; /* emerald */
  --color-warning: #f59e0b; /* amber */
  --color-error:   #f87171; /* red */
  --color-info:    #60a5fa; /* blue */

  /* Shadows — border-only, no diffused shadows */
  --shadow-sm: none;
  --shadow-md: 0 0 0 1px var(--border);

  /* Geometry — 8px for softness, not 0 (brutalist) */
  --radius: 8px;
  --radius-sm: 4px;
  --radius-lg: 12px;
}

/* Light mode — rare but defined for completeness */
@media (prefers-color-scheme: light) {
  :root {
    --bg: #f5f5f5;
    --surface: #ebebeb;
    --surface-elevated: #ffffff;
    --border: rgba(0, 0, 0, 0.1);
    --border-strong: rgba(0, 0, 0, 0.2);
    --text: #1a1a1a;
    --text-secondary: #555555;
    --text-dim: #888888;
    --accent: #0891b2;
    --accent-dim: rgba(8, 145, 178, 0.1);
    --accent-border: rgba(8, 145, 178, 0.25);
  }
}
```

---

## Dot Grid Background

```css
/* Apply to body or hero sections */
.bg-dot-grid {
  background-color: var(--bg);
  background-image: radial-gradient(
    circle,
    rgba(255, 255, 255, 0.04) 1px,
    transparent 1px
  );
  background-size: 20px 20px;
}

/* Subtle — use on main body */
body {
  background-color: var(--bg);
  background-image: radial-gradient(
    circle,
    rgba(255, 255, 255, 0.03) 1px,
    transparent 1px
  );
  background-size: 20px 20px;
  background-attachment: fixed;
}

/* Denser grid for hero or accent sections */
.bg-dot-dense {
  background-image: radial-gradient(
    circle,
    rgba(34, 211, 238, 0.05) 1px,
    transparent 1px
  );
  background-size: 14px 14px;
}
```

---

## Typography

```css
/* Font imports */
/* @import url('https://fonts.bunny.net/css?family=jetbrains-mono:400,500,600,700&display=swap'); */

:root {
  --font-all: 'JetBrains Mono', 'SF Mono', 'Fira Code', 'Cascadia Code', monospace;
}

/* Global — everything is monospace */
body {
  font-family: var(--font-all);
  font-size: 14px;
  line-height: 1.6;
  color: var(--text);
  background: var(--bg);
  -webkit-font-smoothing: antialiased;
  font-variant-numeric: tabular-nums; /* ALL numbers aligned */
}

/* Display heading — still fluid, but monospace */
.heading-display {
  font-family: var(--font-all);
  font-size: clamp(1.75rem, 4vw, 3.5rem);
  font-weight: 700;
  letter-spacing: -0.02em;
  line-height: 1.1;
  color: var(--text);
}

/* Section heading */
.heading-section {
  font-family: var(--font-all);
  font-size: clamp(1rem, 2vw, 1.5rem);
  font-weight: 600;
  letter-spacing: -0.01em;
  line-height: 1.3;
  color: var(--text);
}

/* Label / overline */
.label {
  font-family: var(--font-all);
  font-size: 11px;
  font-weight: 500;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--text-secondary);
}

/* Accent label — for section identifiers */
.label-accent {
  font-family: var(--font-all);
  font-size: 11px;
  font-weight: 600;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--accent);
}

/* KPI / metric number */
.metric-value {
  font-family: var(--font-all);
  font-size: clamp(1.75rem, 3vw, 2.75rem);
  font-weight: 700;
  letter-spacing: -0.02em;
  line-height: 1;
  color: var(--text);
  font-variant-numeric: tabular-nums;
}

/* Terminal prompt */
.prompt {
  font-family: var(--font-all);
  font-size: 13px;
  color: var(--accent);
}

.prompt::before {
  content: '$ ';
  color: var(--text-dim);
}
```

---

## Component System

```css
/* Card — border-only elevation */
.card {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius);
  padding: 1rem 1.25rem;
}

.card:hover {
  background: var(--surface-elevated);
  border-color: var(--border-strong);
}

/* Card with accent border-top */
.card-accent {
  background: var(--surface);
  border: 1px solid var(--border);
  border-top: 2px solid var(--accent);
  border-radius: var(--radius);
  padding: 1rem 1.25rem;
}

/* Metric card */
.card-metric {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius);
  padding: 1rem 1.25rem;
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.card-metric .metric-label {
  font-family: var(--font-all);
  font-size: 11px;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--text-secondary);
}

.card-metric .metric-delta {
  font-family: var(--font-all);
  font-size: 12px;
  font-variant-numeric: tabular-nums;
}

.metric-delta-up   { color: var(--color-success); }
.metric-delta-down { color: var(--color-error); }
.metric-delta-flat { color: var(--text-secondary); }

/* Separator — border-top instead of card boxes */
.separator {
  border: none;
  border-top: 1px solid var(--border);
  margin: 0;
}

/* Dense layout — no cards, just separators */
.row-dense {
  padding: 0.75rem 0;
  border-top: 1px solid var(--border);
  display: grid;
  align-items: center;
  gap: 1rem;
}
```

---

## Status Badges

```css
/* Status badge — dot + text */
.status {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  font-family: var(--font-all);
  font-size: 11px;
  font-weight: 500;
  letter-spacing: 0.06em;
  text-transform: uppercase;
  padding: 3px 8px;
  border-radius: var(--radius-sm);
}

.status::before {
  content: '';
  display: block;
  width: 5px;
  height: 5px;
  border-radius: 50%;
  flex-shrink: 0;
}

/* Status variants */
.status-online {
  color: var(--color-success);
  background: rgba(52, 211, 153, 0.08);
  border: 1px solid rgba(52, 211, 153, 0.2);
}
.status-online::before {
  background: var(--color-success);
  box-shadow: 0 0 4px rgba(52, 211, 153, 0.5);
  animation: pulse-status 2s infinite;
}

.status-warning {
  color: var(--color-warning);
  background: rgba(245, 158, 11, 0.08);
  border: 1px solid rgba(245, 158, 11, 0.2);
}
.status-warning::before { background: var(--color-warning); }

.status-error {
  color: var(--color-error);
  background: rgba(248, 113, 113, 0.08);
  border: 1px solid rgba(248, 113, 113, 0.2);
}
.status-error::before { background: var(--color-error); }

.status-offline {
  color: var(--text-dim);
  background: rgba(255, 255, 255, 0.03);
  border: 1px solid var(--border);
}
.status-offline::before { background: var(--text-dim); }

@keyframes pulse-status {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.4; }
}
```

---

## Buttons

```css
/* Primary button */
.btn-primary {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 8px 16px;
  background: var(--accent);
  color: var(--text-on-accent);
  font-family: var(--font-all);
  font-size: 12px;
  font-weight: 600;
  letter-spacing: 0.04em;
  border: none;
  border-radius: var(--radius-sm);
  cursor: pointer;
  transition: all 0.15s ease;
}

.btn-primary:hover {
  opacity: 0.9;
  box-shadow: 0 0 12px rgba(34, 211, 238, 0.2);
}

.btn-primary:active {
  transform: scale(0.98);
  box-shadow: none;
}

/* Ghost button — NO rounded-full here */
.btn-ghost {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 7px 15px;
  background: transparent;
  color: var(--text);
  font-family: var(--font-all);
  font-size: 12px;
  font-weight: 500;
  letter-spacing: 0.04em;
  border: 1px solid var(--border);
  border-radius: var(--radius-sm);
  cursor: pointer;
  transition: all 0.15s ease;
}

.btn-ghost:hover {
  background: var(--surface-hover);
  border-color: var(--border-strong);
  color: var(--text);
}

.btn-ghost:active {
  transform: scale(0.98);
}

/* Icon button */
.btn-icon {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 32px;
  height: 32px;
  background: transparent;
  color: var(--text-secondary);
  border: 1px solid var(--border);
  border-radius: var(--radius-sm);
  cursor: pointer;
  transition: all 0.15s ease;
}

.btn-icon:hover {
  background: var(--surface-elevated);
  color: var(--text);
  border-color: var(--border-strong);
}
```

---

## Navigation

```css
.nav {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0.75rem 1.5rem;
  border-bottom: 1px solid var(--border);
  background: var(--surface);
  position: sticky;
  top: 0;
  z-index: 50;
}

.nav-logo {
  font-family: var(--font-all);
  font-size: 0.875rem;
  font-weight: 700;
  color: var(--text);
  text-decoration: none;
  letter-spacing: -0.01em;
}

.nav-links {
  display: flex;
  align-items: center;
  gap: 1.5rem;
  list-style: none;
  margin: 0;
  padding: 0;
}

.nav-link {
  font-family: var(--font-all);
  font-size: 12px;
  font-weight: 500;
  letter-spacing: 0.04em;
  color: var(--text-secondary);
  text-decoration: none;
  transition: color 0.15s ease;
}

.nav-link:hover,
.nav-link.active {
  color: var(--text);
}

.nav-link.active {
  color: var(--accent);
}

/* Breadcrumb */
.breadcrumb {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-family: var(--font-all);
  font-size: 11px;
  color: var(--text-dim);
}

.breadcrumb-sep::before {
  content: '/';
  color: var(--text-dim);
}

.breadcrumb-active {
  color: var(--text);
}
```

---

## Log Viewer

```css
/* Terminal-style log output */
.log-container {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius);
  overflow: hidden;
  font-family: var(--font-all);
  font-size: 12px;
}

.log-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0.5rem 1rem;
  border-bottom: 1px solid var(--border);
  background: var(--surface-elevated);
}

.log-title {
  font-size: 11px;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--text-secondary);
}

.log-body {
  padding: 0.75rem 1rem;
  display: flex;
  flex-direction: column;
  gap: 2px;
  max-height: 320px;
  overflow-y: auto;
}

.log-line {
  display: grid;
  grid-template-columns: 140px 50px 1fr;
  gap: 1rem;
  padding: 2px 0;
  line-height: 1.5;
}

.log-time {
  color: var(--text-dim);
  white-space: nowrap;
}

.log-level { font-weight: 600; }
.log-info  .log-level { color: var(--color-info); }
.log-ok    .log-level { color: var(--color-success); }
.log-warn  .log-level { color: var(--color-warning); }
.log-err   .log-level { color: var(--color-error); }

.log-msg { color: var(--text); word-break: break-all; }
```

---

## Motion

Only fade and cursor blink. No springs, no translateY.

```css
/* Fade-in on load — no translateY, just opacity */
.reveal {
  opacity: 0;
  transition: opacity 0.3s ease;
}

.reveal.visible {
  opacity: 1;
}

.reveal:nth-child(1) { transition-delay: 0s; }
.reveal:nth-child(2) { transition-delay: 0.04s; }
.reveal:nth-child(3) { transition-delay: 0.08s; }
.reveal:nth-child(4) { transition-delay: 0.12s; }

/* Cursor blink — for prompt/command elements */
.cursor::after {
  content: '▋';
  color: var(--accent);
  animation: blink 1s step-end infinite;
}

@keyframes blink {
  0%, 100% { opacity: 1; }
  50% { opacity: 0; }
}

/* Typing effect — add typing class to show progressive text */
.typing {
  overflow: hidden;
  white-space: nowrap;
  animation: type-in 1.5s steps(40) forwards;
}

@keyframes type-in {
  from { width: 0; }
  to { width: 100%; }
}

/* Status pulse — for online indicators */
@keyframes pulse-dot {
  0%, 100% { opacity: 1; box-shadow: 0 0 4px currentColor; }
  50% { opacity: 0.5; box-shadow: none; }
}

@media (prefers-reduced-motion: reduce) {
  .reveal { opacity: 1 !important; transition: none !important; }
  .cursor::after { animation: none; opacity: 1; }
  .typing { animation: none; width: 100%; }
}
```

---

## Layout Patterns

```css
/* Dashboard grid — dense, no large section gaps */
.dashboard-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 1px; /* 1px trick for razor separators */
  background: var(--border);
}

.dashboard-grid > * {
  background: var(--surface);
  padding: 1rem 1.25rem;
}

/* Two-column layout: sidebar + main */
.layout-sidebar {
  display: grid;
  grid-template-columns: 240px 1fr;
  min-height: 100dvh;
}

@media (max-width: 768px) {
  .layout-sidebar {
    grid-template-columns: 1fr;
  }
}

/* Sidebar */
.sidebar {
  border-right: 1px solid var(--border);
  background: var(--surface);
  padding: 1.5rem 1rem;
  display: flex;
  flex-direction: column;
  gap: 0.25rem;
}

/* Sidebar nav item */
.sidebar-item {
  display: flex;
  align-items: center;
  gap: 0.625rem;
  padding: 0.5rem 0.75rem;
  border-radius: var(--radius-sm);
  font-family: var(--font-all);
  font-size: 12px;
  font-weight: 500;
  color: var(--text-secondary);
  text-decoration: none;
  transition: all 0.15s ease;
}

.sidebar-item:hover {
  background: var(--surface-hover);
  color: var(--text);
}

.sidebar-item.active {
  background: var(--accent-dim);
  color: var(--accent);
  border: 1px solid var(--accent-border);
}

/* Main content area */
.main-content {
  padding: 1.5rem 2rem;
  overflow: auto;
}
```

---

## Anti-Patterns

| Pattern | Why banned |
|---------|------------|
| Any serif font | Zero exceptions — monospace only |
| Rounded pill buttons (`border-radius: 9999px`) | Wrong aesthetic — reserved for Soft Premium |
| Pastel or desaturated colors | This is dark-mode, high-contrast territory |
| Large section padding (py-24+) | Dense layout — 12-16px padding per component |
| CSS gradients (decorative) | No gradients — flat surfaces only |
| Drop shadows (soft/diffused) | Elevation via borders, not shadows |
| Neon outer glow on everything | Phosphor glow reserved for accent elements only |
| Pure `#000000` background | Use `#0a0a0a` — the 6% difference is noticeable |
| Animated gradients / mesh backgrounds | Static dot grid only |
| Inter or any proportional font | The whole point is monospace character spacing |
| Spring bounce animations | Fade and cursor blink only |
| Empty state with just text | Even terminals have ASCII art — make it visual |
