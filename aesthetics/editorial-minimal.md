# Editorial Minimal Aesthetic
> Off-black #111111 on warm bone #F7F6F3. Serif headings (Newsreader/Instrument Serif).
> Cards: 1px #EAEAEA border, 8-12px radius, 24-40px padding. Ultra-subtle shadows.
> BANNED: Inter, Lucide, heavy shadows, bright backgrounds, gradients, glassmorphism.

---

## Core Philosophy

Editorial minimal is restraint made intentional. The palette is warm bone — never pure white — and every shadow is barely-visible. Hierarchy comes from typographic contrast, not color. Warmth comes from the paper-toned background, not decoration.

This aesthetic works for: personal blogs, independent publications, reading apps, long-form content platforms, professional portfolios, notebooks/journaling tools, and product documentation.

---

## Color System

```css
:root {
  /* Backgrounds */
  --bg: #f7f6f3;          /* warm bone — the soul of the aesthetic */
  --surface: #ffffff;
  --surface-alt: #f9f9f8; /* slightly warmer for cards against white */

  /* Borders — always 1px, never heavier */
  --border: #eaeaea;
  --border-dim: rgba(0, 0, 0, 0.06);

  /* Text */
  --text: #111111;        /* off-black — NEVER #000000 */
  --text-secondary: #787774;
  --text-tertiary: #b3b0aa;

  /* Accent — muted, desaturated. Options below. */
  /* Sage:      */ --accent: #5c7a6a;
  /* Terracotta:*/ /* --accent: #b06a4a; */
  /* Navy:      */ /* --accent: #3a4e6e; */
  --accent-dim: rgba(92, 122, 106, 0.1);

  /* Semantic pastels (for tags, badges) */
  --tag-red-bg: #fdebec;    --tag-red-text: #9f2f2d;
  --tag-blue-bg: #e1f3fe;   --tag-blue-text: #1f6c9f;
  --tag-green-bg: #edf3ec;  --tag-green-text: #346538;
  --tag-yellow-bg: #fbf3db; --tag-yellow-text: #956400;

  /* Shadows — ultra-subtle, barely there */
  --shadow-sm: 0 2px 8px rgba(0, 0, 0, 0.04);
  --shadow-md: 0 4px 16px rgba(0, 0, 0, 0.06), 0 1px 4px rgba(0, 0, 0, 0.03);
  --shadow-hover: 0 2px 8px rgba(0, 0, 0, 0.06);

  /* Geometry */
  --radius-sm: 4px;
  --radius-md: 8px;
  --radius-lg: 12px;
  --radius-full: 9999px;
}

/* Dark mode — restrained, warm-dark */
@media (prefers-color-scheme: dark) {
  :root {
    --bg: #111111;
    --surface: #1a1a1a;
    --surface-alt: #1e1e1e;
    --border: #2e2e2e;
    --border-dim: rgba(255, 255, 255, 0.06);
    --text: #e8e6e1;
    --text-secondary: #888884;
    --text-tertiary: #555552;
    --accent: #7fa08f;
    --accent-dim: rgba(127, 160, 143, 0.12);
    --shadow-sm: 0 2px 8px rgba(0, 0, 0, 0.25);
    --shadow-md: 0 4px 16px rgba(0, 0, 0, 0.35), 0 1px 4px rgba(0, 0, 0, 0.2);
    --shadow-hover: 0 2px 8px rgba(0, 0, 0, 0.3);
  }
}
```

---

## Typography

```css
/* Font imports */
/* @import url('https://fonts.bunny.net/css?family=newsreader:400,400i,600,700&display=swap'); */
/* @import url('https://fonts.bunny.net/css?family=literata:400,400i,500&display=swap'); */
/* @import url('https://fonts.bunny.net/css?family=jetbrains-mono:400,500&display=swap'); */

:root {
  --font-heading: 'Newsreader', 'Lyon Text', 'Instrument Serif', Georgia, serif;
  --font-body: 'Literata', Georgia, serif;
  --font-ui: 'Geist Sans', system-ui, -apple-system, sans-serif;
  --font-mono: 'JetBrains Mono', 'SF Mono', monospace;
}

body {
  font-family: var(--font-body);
  font-size: 1rem;
  line-height: 1.65;
  color: var(--text);
  background: var(--bg);
  -webkit-font-smoothing: antialiased;
}

/* Display heading */
.heading-display {
  font-family: var(--font-heading);
  font-size: clamp(2rem, 5vw, 3.5rem);
  font-weight: 600;
  letter-spacing: -0.02em;
  line-height: 1.1;
  color: var(--text);
}

/* Section heading */
.heading-section {
  font-family: var(--font-heading);
  font-size: clamp(1.5rem, 3vw, 2.25rem);
  font-weight: 600;
  letter-spacing: -0.015em;
  line-height: 1.2;
  color: var(--text);
}

/* Body prose — max 65ch */
.prose {
  font-family: var(--font-body);
  font-size: 1.0625rem;
  line-height: 1.75;
  color: var(--text);
  max-width: 65ch;
}

/* UI label — nav, buttons, metadata */
.label {
  font-family: var(--font-ui);
  font-size: 0.8125rem;
  font-weight: 500;
  color: var(--text-secondary);
  letter-spacing: 0.01em;
}

/* Overline — category above heading */
.overline {
  font-family: var(--font-ui);
  font-size: 0.6875rem;
  font-weight: 600;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--accent);
  margin-bottom: 0.75rem;
  display: block;
}

blockquote {
  font-family: var(--font-heading);
  font-size: 1.25rem;
  font-style: italic;
  line-height: 1.6;
  color: var(--text);
  border-left: 2px solid var(--border);
  padding-left: 1.5rem;
  margin: 2rem 0;
}
```

---

## Card System

```css
/* Standard card — always 1px border, 8-12px radius */
.card {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius-md);
  padding: 1.75rem 2rem;
  box-shadow: var(--shadow-sm);
  transition: box-shadow 0.2s ease;
}

.card:hover {
  box-shadow: var(--shadow-hover);
}

/* Article preview card */
.card-article {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius-md);
  overflow: hidden;
  transition: box-shadow 0.2s ease;
}

.card-article:hover {
  box-shadow: var(--shadow-hover);
}

.card-article .card-body {
  padding: 1.5rem;
}

.card-article .card-meta {
  font-family: var(--font-ui);
  font-size: 0.75rem;
  color: var(--text-secondary);
  display: flex;
  align-items: center;
  gap: 0.5rem;
  margin-bottom: 0.75rem;
}

.card-article .card-title {
  font-family: var(--font-heading);
  font-size: 1.1875rem;
  font-weight: 600;
  letter-spacing: -0.01em;
  line-height: 1.3;
  color: var(--text);
  margin-bottom: 0.625rem;
}

.card-article .card-excerpt {
  font-size: 0.9375rem;
  line-height: 1.65;
  color: var(--text-secondary);
}

/* Feature card */
.card-feature {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius-lg);
  padding: 2.5rem;
  box-shadow: var(--shadow-sm);
}
```

---

## Buttons

```css
/* Primary — solid #111111, restrained radius (NO rounded-full) */
.btn-primary {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 11px 20px;
  background: var(--text);
  color: #ffffff;
  font-family: var(--font-ui);
  font-size: 0.875rem;
  font-weight: 500;
  border: none;
  border-radius: var(--radius-sm); /* 4-6px only */
  cursor: pointer;
  text-decoration: none;
  transition: all 0.15s ease;
  letter-spacing: 0.01em;
}

.btn-primary:hover {
  background: #333333;
}

.btn-primary:active {
  transform: scale(0.98);
}

/* Ghost */
.btn-ghost {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 10px 18px;
  background: transparent;
  color: var(--text);
  font-family: var(--font-ui);
  font-size: 0.875rem;
  font-weight: 500;
  border: 1px solid var(--border);
  border-radius: var(--radius-sm);
  cursor: pointer;
  text-decoration: none;
  transition: all 0.15s ease;
}

.btn-ghost:hover {
  background: rgba(0, 0, 0, 0.04);
  border-color: rgba(0, 0, 0, 0.2);
}

.btn-ghost:active {
  transform: scale(0.98);
}

/* Inline text link */
.link {
  color: var(--accent);
  text-decoration: underline;
  text-decoration-color: rgba(92, 122, 106, 0.4);
  text-underline-offset: 3px;
  transition: text-decoration-color 0.15s ease;
}

.link:hover {
  text-decoration-color: var(--accent);
}
```

---

## Layout

```css
.container {
  max-width: 1100px;
  margin: 0 auto;
  padding: 0 clamp(1.25rem, 4vw, 3rem);
  width: 100%;
}

/* Prose container — for article reading */
.container-narrow {
  max-width: 720px;
  margin: 0 auto;
  padding: 0 clamp(1.25rem, 4vw, 2.5rem);
}

.section {
  padding-top: clamp(4rem, 8vw, 7rem);
  padding-bottom: clamp(4rem, 8vw, 7rem);
}

/* Editorial two-column */
.layout-editorial {
  display: grid;
  grid-template-columns: 1fr 280px;
  gap: 4rem;
  align-items: start;
}

@media (max-width: 768px) {
  .layout-editorial {
    grid-template-columns: 1fr;
    gap: 2rem;
  }
}

/* Feature grid — 1px gap trick for razor-thin dividers */
.grid-features {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 1px;
  background: var(--border);
}

.grid-features > * {
  background: var(--bg);
  padding: 2rem;
}

@media (max-width: 640px) {
  .grid-features { grid-template-columns: 1fr; }
}

/* Accordion — NO card containers, dividers only */
.accordion-item {
  border-bottom: 1px solid var(--border);
}

.accordion-trigger {
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1.25rem 0;
  font-family: var(--font-heading);
  font-size: 1.0625rem;
  font-weight: 500;
  color: var(--text);
  background: none;
  border: none;
  cursor: pointer;
  text-align: left;
}

.accordion-content {
  padding-bottom: 1.25rem;
  font-size: 0.9375rem;
  line-height: 1.7;
  color: var(--text-secondary);
}
```

---

## Navigation

```css
/* Top nav — simple, border-bottom only */
.nav {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 1.5rem clamp(1.25rem, 4vw, 3rem);
  border-bottom: 1px solid var(--border);
}

.nav-logo {
  font-family: var(--font-heading);
  font-size: 1.125rem;
  font-weight: 600;
  color: var(--text);
  text-decoration: none;
  letter-spacing: -0.01em;
}

.nav-links {
  display: flex;
  align-items: center;
  gap: 2rem;
  list-style: none;
  margin: 0;
  padding: 0;
}

.nav-link {
  font-family: var(--font-ui);
  font-size: 0.875rem;
  font-weight: 500;
  color: var(--text-secondary);
  text-decoration: none;
  transition: color 0.15s ease;
}

.nav-link:hover,
.nav-link.active {
  color: var(--text);
}
```

---

## Tags and Badges

```css
.tag {
  display: inline-flex;
  align-items: center;
  gap: 5px;
  padding: 3px 10px;
  border-radius: var(--radius-full);
  font-family: var(--font-ui);
  font-size: 0.6875rem;
  font-weight: 600;
  letter-spacing: 0.04em;
  text-transform: uppercase;
}

.tag-red    { background: var(--tag-red-bg);    color: var(--tag-red-text); }
.tag-blue   { background: var(--tag-blue-bg);   color: var(--tag-blue-text); }
.tag-green  { background: var(--tag-green-bg);  color: var(--tag-green-text); }
.tag-yellow { background: var(--tag-yellow-bg); color: var(--tag-yellow-text); }

.tag-neutral {
  background: rgba(0, 0, 0, 0.05);
  color: var(--text-secondary);
}

/* Keyboard shortcut chip */
kbd {
  display: inline-flex;
  align-items: center;
  padding: 2px 6px;
  font-family: var(--font-mono);
  font-size: 0.75rem;
  color: var(--text-secondary);
  background: var(--bg);
  border: 1px solid var(--border);
  border-radius: var(--radius-sm);
  box-shadow: 0 1px 0 rgba(0,0,0,0.08);
}
```

---

## Article Header

```html
<article>
  <header class="article-header">
    <span class="overline">Design Systems</span>
    <h1 class="heading-display">
      The case for editorial restraint in product design
    </h1>
    <p class="prose" style="margin-top: 1rem; color: var(--text-secondary);">
      When every product looks like a SaaS template, the ones that feel like
      someone made a choice stand out.
    </p>
    <div class="article-meta">
      <time class="label">April 8, 2026</time>
      <span class="label">—</span>
      <span class="label">8 min read</span>
    </div>
  </header>
  <div class="article-body prose"><!-- content --></div>
</article>
```

```css
.article-header {
  padding-bottom: 3rem;
  margin-bottom: 3rem;
  border-bottom: 1px solid var(--border);
}

.article-meta {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  margin-top: 1.5rem;
}

.article-body { max-width: 65ch; }

.article-body h2 {
  font-family: var(--font-heading);
  font-size: 1.625rem;
  font-weight: 600;
  letter-spacing: -0.015em;
  margin-top: 3rem;
  margin-bottom: 1rem;
}

.article-body p {
  margin-bottom: 1.5rem;
  font-size: 1.0625rem;
  line-height: 1.75;
}

.article-body code {
  font-family: var(--font-mono);
  font-size: 0.875em;
  background: rgba(0, 0, 0, 0.05);
  padding: 2px 6px;
  border-radius: 4px;
}

.article-body pre {
  background: var(--surface-alt);
  border: 1px solid var(--border);
  border-radius: var(--radius-md);
  padding: 1.5rem;
  overflow-x: auto;
  margin: 2rem 0;
}

.article-body hr {
  border: none;
  border-top: 1px solid var(--border);
  margin: 3rem 0;
}
```

---

## Motion

Motion is quiet. No springs, no bouncing, no spectacle.

```css
:root {
  --ease-smooth: cubic-bezier(0.16, 1, 0.3, 1);
}

.reveal {
  opacity: 0;
  transform: translateY(12px);
  transition:
    opacity 0.6s var(--ease-smooth),
    transform 0.6s var(--ease-smooth);
}

.reveal.visible {
  opacity: 1;
  transform: none;
}

.reveal:nth-child(1) { transition-delay: 0s; }
.reveal:nth-child(2) { transition-delay: 0.07s; }
.reveal:nth-child(3) { transition-delay: 0.14s; }
.reveal:nth-child(4) { transition-delay: 0.21s; }

@media (prefers-reduced-motion: reduce) {
  .reveal { opacity: 1 !important; transform: none !important; transition: none !important; }
}
```

```javascript
const observer = new IntersectionObserver(
  entries => entries.forEach(e => {
    if (e.isIntersecting) { e.target.classList.add('visible'); observer.unobserve(e.target); }
  }),
  { threshold: 0.1, rootMargin: '0px 0px -32px 0px' }
);
document.querySelectorAll('.reveal').forEach(el => observer.observe(el));
```

---

## Banned Patterns — With Reasoning

| Pattern | Why it's banned |
|---------|-----------------|
| `Inter` font | Zero personality in editorial contexts |
| Pure `#000000` text | Too harsh against warm bone background |
| `shadow-md` / `shadow-lg` (Tailwind defaults) | Heavy shadows break the flat paper feel |
| Bright-colored section backgrounds | Everything shares the warm bone palette |
| CSS gradients | Breaks the flat, paper-derivative feel |
| Glassmorphism | Inappropriate — belongs to tech/SaaS aesthetics |
| `rounded-full` on buttons | Looks like consumer SaaS, not editorial |
| 3-equal-column card grids | Generic, impersonal, breaks editorial rhythm |
| Emoji anywhere in UI | Use overline tags or icons instead |
| `Times New Roman` / `Georgia` directly | Use Newsreader or Instrument Serif for intentional editorial serif |
| Centered hero layout | Left-align for editorial — centered reads as marketing |
| AI copywriting clichés | "Elevate", "Seamless", "Next-gen" — plain, specific language only |
| Generic placeholder names | "John Doe", "Acme Corp" — use realistic, contextual names |
| Heavy animation | No springs, no blur-in, no dramatic scale — quiet fade only |
