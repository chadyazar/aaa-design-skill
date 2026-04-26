# Soft Premium Aesthetic
> Double-bezel architecture: nested shells with concentric radii for haptic depth.
> Pill-shaped CTAs with nested icon wrappers. Generous spacing (py-24 minimum).
> Fonts: Geist/Clash Display. Icons: Phosphor Light. Motion: spring easing, staggered reveals.

---

## Core Philosophy

Soft premium is haptic depth without heaviness. Everything feels physical — like machined glass sitting in an aluminium tray — but never cold or corporate. The shadows spread wide and barely darken. The borders are hairlines. The radius is generous. Breathing room is measured in rems, not pixels.

This aesthetic works for: consumer SaaS, health/wellness, lifestyle apps, AI products, portfolio sites, and anything that needs to feel like a $150k agency built it.

---

## Color System

```css
:root {
  /* Backgrounds */
  --bg: #fafaf9;
  --surface: #ffffff;
  --surface-elevated: #ffffff;
  --surface-overlay: rgba(255, 255, 255, 0.85);

  /* Borders */
  --border-subtle: rgba(0, 0, 0, 0.04);
  --border-default: rgba(0, 0, 0, 0.08);
  --border-strong: rgba(0, 0, 0, 0.14);

  /* Text */
  --text-primary: #111111;
  --text-secondary: #6b7280;
  --text-tertiary: #9ca3af;

  /* Accent (swap to brand color — keep saturation < 80%) */
  --accent: #7c3aed;
  --accent-hover: #6d28d9;
  --accent-dim: rgba(124, 58, 237, 0.08);
  --accent-border: rgba(124, 58, 237, 0.2);

  /* Elevation */
  --shadow-sm: 0 2px 8px rgba(0, 0, 0, 0.04), 0 0 0 1px rgba(0, 0, 0, 0.04);
  --shadow-md: 0 20px 40px rgba(0, 0, 0, 0.06), 0 4px 12px rgba(0, 0, 0, 0.04);
  --shadow-lg: 0 32px 64px rgba(0, 0, 0, 0.08), 0 8px 24px rgba(0, 0, 0, 0.04);
  --shadow-focus: 0 0 0 3px rgba(124, 58, 237, 0.2);

  /* Geometry */
  --radius-sm: 12px;
  --radius-md: 20px;
  --radius-lg: 28px;
  --radius-xl: 36px;
  --radius-full: 9999px;
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  :root {
    --bg: #0a0a0f;
    --surface: #13131a;
    --surface-elevated: #1e1e2a;
    --surface-overlay: rgba(19, 19, 26, 0.85);
    --border-subtle: rgba(255, 255, 255, 0.03);
    --border-default: rgba(255, 255, 255, 0.08);
    --border-strong: rgba(255, 255, 255, 0.14);
    --text-primary: #f5f5f7;
    --text-secondary: #8e8ea0;
    --text-tertiary: #6b6b80;
    --accent: #a78bfa;
    --accent-hover: #8b5cf6;
    --accent-dim: rgba(167, 139, 250, 0.1);
    --accent-border: rgba(167, 139, 250, 0.2);
    --shadow-sm: 0 2px 8px rgba(0, 0, 0, 0.2), 0 0 0 1px rgba(255, 255, 255, 0.04);
    --shadow-md: 0 20px 40px rgba(0, 0, 0, 0.4), 0 4px 12px rgba(0, 0, 0, 0.2);
    --shadow-lg: 0 32px 64px rgba(0, 0, 0, 0.5), 0 8px 24px rgba(0, 0, 0, 0.3);
  }
}
```

---

## Typography

```css
/* Font imports — add to <head> */
/* @import url('https://fonts.bunny.net/css?family=clash-display:400,500,600,700&display=swap'); */
/* @import url('https://fonts.bunny.net/css?family=satoshi:400,500,700&display=swap'); */

:root {
  --font-heading: 'Clash Display', 'Cabinet Grotesk', 'Outfit', sans-serif;
  --font-body: 'Satoshi', 'Plus Jakarta Sans', system-ui, sans-serif;
  --font-mono: 'Geist Mono', 'JetBrains Mono', monospace;
}

/* Display headings — flagship, hero sections */
.heading-display {
  font-family: var(--font-heading);
  font-size: clamp(2.5rem, 6vw, 5rem);
  font-weight: 600;
  letter-spacing: -0.03em;
  line-height: 1.05;
  color: var(--text-primary);
}

/* Section headings */
.heading-section {
  font-family: var(--font-heading);
  font-size: clamp(1.75rem, 3.5vw, 2.75rem);
  font-weight: 600;
  letter-spacing: -0.02em;
  line-height: 1.15;
  color: var(--text-primary);
}

/* Eyebrow — small tag above headings */
.eyebrow {
  font-family: var(--font-body);
  font-size: 0.6875rem; /* 11px */
  font-weight: 600;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--accent);
  display: inline-block;
  padding: 4px 12px;
  background: var(--accent-dim);
  border: 1px solid var(--accent-border);
  border-radius: var(--radius-full);
  margin-bottom: 1rem;
}

/* Body */
body {
  font-family: var(--font-body);
  font-size: 1rem;
  line-height: 1.65;
  color: var(--text-primary);
  -webkit-font-smoothing: antialiased;
}

/* Description / lead text */
.text-lead {
  font-size: 1.125rem;
  line-height: 1.7;
  color: var(--text-secondary);
  max-width: 54ch;
}
```

---

## Double-Bezel Architecture

The signature pattern. Every premium card, image, and feature panel must use nested enclosures — like a glass plate sitting in an aluminium tray.

```html
<!-- Double-bezel card -->
<div class="bezel-outer">
  <div class="bezel-inner">
    <!-- content -->
  </div>
</div>
```

```css
/* Outer shell — subtle container that "holds" the card */
.bezel-outer {
  background: rgba(0, 0, 0, 0.03);
  border: 1px solid var(--border-subtle);
  border-radius: var(--radius-xl); /* e.g. 36px */
  padding: 8px;
}

/* Inner core — the actual visible card */
.bezel-inner {
  background: var(--surface);
  border: 1px solid var(--border-default);
  border-radius: calc(var(--radius-xl) - 6px); /* concentric: 30px */
  box-shadow:
    inset 0 1px 1px rgba(255, 255, 255, 0.15),
    var(--shadow-md);
  padding: 2rem;
  overflow: hidden;
}

/* Dark mode inner highlight */
@media (prefers-color-scheme: dark) {
  .bezel-outer {
    background: rgba(255, 255, 255, 0.02);
    border-color: rgba(255, 255, 255, 0.06);
  }
  .bezel-inner {
    box-shadow:
      inset 0 1px 0 rgba(255, 255, 255, 0.08),
      var(--shadow-md);
  }
}
```

**Concentric radius rule:** outer radius - 6px = inner radius. For outer `36px` → inner `30px`. For outer `28px` → inner `22px`. Never use the same radius on nested containers.

---

## Premium Button System

```html
<!-- Primary pill CTA with nested icon wrapper -->
<button class="btn-primary">
  Get started
  <span class="btn-icon-wrapper">
    <svg width="14" height="14" ...>→</svg>
  </span>
</button>

<!-- Ghost / secondary -->
<button class="btn-ghost">Learn more</button>
```

```css
/* Base button */
.btn-primary {
  display: inline-flex;
  align-items: center;
  gap: 10px;
  padding: 14px 20px 14px 24px; /* extra left pad, tighter right for icon */
  background: var(--accent);
  color: white;
  font-family: var(--font-body);
  font-size: 0.9375rem;
  font-weight: 600;
  border: none;
  border-radius: var(--radius-full);
  cursor: pointer;
  transition:
    transform 0.2s cubic-bezier(0.34, 1.56, 0.64, 1),
    box-shadow 0.2s ease,
    background 0.15s ease;
}

/* Nested icon circle — the "button in button" */
.btn-icon-wrapper {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 28px;
  height: 28px;
  border-radius: var(--radius-full);
  background: rgba(255, 255, 255, 0.15);
  transition: transform 0.2s cubic-bezier(0.34, 1.56, 0.64, 1);
  flex-shrink: 0;
}

/* Hover — button scales down slightly, icon moves diagonally */
.btn-primary:hover {
  background: var(--accent-hover);
  box-shadow: 0 8px 24px rgba(124, 58, 237, 0.3);
  transform: translateY(-1px);
}

.btn-primary:hover .btn-icon-wrapper {
  transform: translate(2px, -1px) scale(1.05);
}

/* Active — physical press sensation */
.btn-primary:active {
  transform: scale(0.98) translateY(0);
  box-shadow: none;
}

/* Ghost button */
.btn-ghost {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 13px 22px;
  background: transparent;
  color: var(--text-primary);
  font-family: var(--font-body);
  font-size: 0.9375rem;
  font-weight: 500;
  border: 1px solid var(--border-strong);
  border-radius: var(--radius-full);
  cursor: pointer;
  transition: all 0.15s ease;
}

.btn-ghost:hover {
  background: rgba(0, 0, 0, 0.04);
  border-color: var(--border-strong);
}

.btn-ghost:active {
  transform: scale(0.98);
}
```

---

## Spatial Breathing (Spacing System)

```css
/* Section-level spacing — never go below py-24 (6rem) */
.section {
  padding-top: clamp(4rem, 8vw, 8rem);
  padding-bottom: clamp(4rem, 8vw, 8rem);
  padding-left: clamp(1.25rem, 5vw, 6rem);
  padding-right: clamp(1.25rem, 5vw, 6rem);
}

/* Content container */
.container {
  max-width: 1280px;
  margin: 0 auto;
  width: 100%;
  padding: 0 clamp(1.25rem, 4vw, 3rem);
}

/* Heading → description gap */
.heading-group {
  display: flex;
  flex-direction: column;
  gap: 1.25rem;
  margin-bottom: 3.5rem;
}

/* Feature grid — asymmetric, never 3-equal-columns */
.feature-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 1.5rem;
}

@media (min-width: 1024px) {
  .feature-grid {
    grid-template-columns: 2fr 1fr;
  }
}

@media (max-width: 768px) {
  .feature-grid {
    grid-template-columns: 1fr;
  }
}
```

---

## Card System (Frosted Glass Variant)

```css
/* Standard elevated card */
.card {
  background: var(--surface);
  border: 1px solid var(--border-default);
  border-radius: var(--radius-lg);
  padding: 2rem;
  box-shadow: var(--shadow-md);
  transition: box-shadow 0.3s ease, transform 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
}

.card:hover {
  box-shadow: var(--shadow-lg);
  transform: translateY(-2px);
}

/* Frosted glass card — use only for overlays, modals, floating elements */
.card-glass {
  background: var(--surface-overlay);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: var(--radius-lg);
  padding: 2rem;
  /* Edge refraction — the key detail */
  box-shadow:
    inset 0 1px 0 rgba(255, 255, 255, 0.15),
    inset 0 -1px 0 rgba(255, 255, 255, 0.06),
    var(--shadow-md);
}

/* Stat / metric card — clean with number emphasis */
.card-stat {
  background: var(--surface);
  border: 1px solid var(--border-subtle);
  border-radius: var(--radius-md);
  padding: 1.5rem;
  box-shadow: var(--shadow-sm);
}

.card-stat .stat-number {
  font-family: var(--font-heading);
  font-size: clamp(2rem, 4vw, 3.25rem);
  font-weight: 700;
  letter-spacing: -0.03em;
  line-height: 1;
  color: var(--text-primary);
  font-variant-numeric: tabular-nums;
}

.card-stat .stat-label {
  font-size: 0.8125rem;
  color: var(--text-secondary);
  margin-top: 0.5rem;
}
```

---

## Hero Section

```html
<section class="hero">
  <div class="container">
    <div class="hero-inner">
      <span class="eyebrow">Introducing v2.0</span>
      <h1 class="heading-display">
        Ship interfaces<br>that feel <em>expensive</em>
      </h1>
      <p class="text-lead">
        Premium UI patterns, coded from scratch. Every component built for
        the 5% who actually notice the difference.
      </p>
      <div class="hero-actions">
        <button class="btn-primary">
          Start building
          <span class="btn-icon-wrapper">
            <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
              <path d="M2 7h10M8 3l4 4-4 4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
          </span>
        </button>
        <button class="btn-ghost">See examples</button>
      </div>
    </div>
  </div>
</section>
```

```css
.hero {
  min-height: 100dvh; /* NEVER use h-screen — iOS Safari jumps */
  display: flex;
  align-items: center;
  padding: clamp(6rem, 12vw, 10rem) clamp(1.25rem, 5vw, 6rem);
  position: relative;
  overflow: hidden;
}

/* Optional: subtle noise texture overlay (fixed, pointer-events-none) */
.hero::before {
  content: '';
  position: fixed;
  inset: 0;
  z-index: 0;
  pointer-events: none;
  opacity: 0.03;
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)'/%3E%3C/svg%3E");
}

.hero-inner {
  max-width: 720px;
  position: relative;
  z-index: 1;
}

.hero-actions {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin-top: 2.5rem;
  flex-wrap: wrap;
}
```

---

## Testimonial Card

```html
<div class="testimonial-card">
  <div class="testimonial-quote">
    "The attention to detail is unreal. Our conversion rate went up 23% after switching."
  </div>
  <div class="testimonial-author">
    <div class="testimonial-avatar">
      <img src="https://picsum.photos/seed/sarah-k/40/40" alt="" width="40" height="40">
    </div>
    <div>
      <div class="testimonial-name">Sarah Kaufman</div>
      <div class="testimonial-role">Head of Product, Meridian Labs</div>
    </div>
  </div>
</div>
```

```css
.testimonial-card {
  background: var(--surface);
  border: 1px solid var(--border-default);
  border-radius: var(--radius-lg);
  padding: 2rem;
  box-shadow: var(--shadow-sm);
}

.testimonial-quote {
  font-size: 1.0625rem;
  line-height: 1.65;
  color: var(--text-primary);
  font-style: italic;
  margin-bottom: 1.5rem;
}

.testimonial-author {
  display: flex;
  align-items: center;
  gap: 0.75rem;
}

.testimonial-avatar img {
  border-radius: 50%;
  object-fit: cover;
}

.testimonial-name {
  font-weight: 600;
  font-size: 0.9375rem;
  color: var(--text-primary);
}

.testimonial-role {
  font-size: 0.8125rem;
  color: var(--text-secondary);
}
```

---

## Motion System

All motion uses spring physics — no linear or ease-in-out.

```css
/* Spring easing — the premium feel */
:root {
  --ease-spring: cubic-bezier(0.34, 1.56, 0.64, 1);
  --ease-out-expo: cubic-bezier(0.16, 1, 0.3, 1);
  --ease-in-out-smooth: cubic-bezier(0.4, 0, 0.2, 1);
}

/* Scroll entry animation — add .reveal to any element */
.reveal {
  opacity: 0;
  transform: translateY(16px);
  transition:
    opacity 0.6s var(--ease-out-expo),
    transform 0.6s var(--ease-out-expo);
}

.reveal.visible {
  opacity: 1;
  transform: none;
}

/* Stagger delays for grid children */
.reveal:nth-child(1) { transition-delay: 0s; }
.reveal:nth-child(2) { transition-delay: 0.05s; }
.reveal:nth-child(3) { transition-delay: 0.1s; }
.reveal:nth-child(4) { transition-delay: 0.15s; }
.reveal:nth-child(5) { transition-delay: 0.2s; }

/* Blur-to-sharp variant — premium feel on hero text */
.reveal-blur {
  opacity: 0;
  transform: translateY(12px);
  filter: blur(4px);
  transition:
    opacity 0.8s var(--ease-out-expo),
    transform 0.8s var(--ease-out-expo),
    filter 0.8s var(--ease-out-expo);
}

.reveal-blur.visible {
  opacity: 1;
  transform: none;
  filter: blur(0);
}

/* Reduced motion override */
@media (prefers-reduced-motion: reduce) {
  .reveal, .reveal-blur {
    opacity: 1 !important;
    transform: none !important;
    filter: none !important;
    transition: none !important;
  }
}
```

```javascript
// IntersectionObserver for scroll reveals
const observer = new IntersectionObserver(
  (entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        observer.unobserve(entry.target); // only animate once
      }
    });
  },
  { threshold: 0.1, rootMargin: '0px 0px -40px 0px' }
);

document.querySelectorAll('.reveal, .reveal-blur').forEach(el => {
  observer.observe(el);
});
```

---

## Icon Rules

- **Library:** Phosphor Light weight (`@phosphor-icons/react`) or Remix Line icons
- **Never use:** Lucide, FontAwesome, Material Icons (all too thick for this aesthetic)
- **Stroke width:** 1.0 to 1.5. Never 2+.
- **Sizing:** 16px for inline UI, 20px for buttons, 24px for feature icons, 32-48px for hero icons
- **Color:** match `--text-secondary` for decorative, `--accent` for interactive

```css
/* Icon in button — keeps consistent optical size */
.icon-sm { width: 14px; height: 14px; flex-shrink: 0; }
.icon-md { width: 18px; height: 18px; flex-shrink: 0; }
.icon-lg { width: 24px; height: 24px; flex-shrink: 0; }
.icon-xl { width: 40px; height: 40px; flex-shrink: 0; }
```

---

## Banned Patterns

- **NO** `Inter` font — use Clash Display, Satoshi, Geist, Cabinet Grotesk
- **NO** pure `#000000` — use `#111111` or `var(--text-primary)`
- **NO** neon outer glows — accent shows through shadow tinting, not glow
- **NO** `h-screen` — use `min-h-[100dvh]` to prevent iOS jump
- **NO** 3-equal-column feature rows — use asymmetric bento or zig-zag
- **NO** flat buttons with harsh 4px radius — use pill (full radius) or generous 12px+
- **NO** gradient text on large headings — accent via weight, not rainbow fill
- **NO** emoji in UI — use Phosphor Light icons
- **NO** `backdrop-blur` on scrolling containers — only on fixed/sticky elements
