# Aesthetic Presets — Full CSS
> 16 complete preset systems with light + dark CSS custom properties.
> Each includes fonts, colors, shadows, radius, and background treatment.
> Pick ONE preset, paste its vars, then customize. Never mix presets.

---

## Usage

Paste the `:root` block into your stylesheet. For dark mode, paste the `@media` block too. Import fonts from Google Fonts or Bunny Fonts. Adjust `--accent` to match brand if needed.

---

### Blueprint
> Technical documentation, architecture diagrams, developer tools, API references.
**Fonts:** Space Mono (headings) + Inter (body) + Space Mono (mono)
**Mood:** precise, engineered, trustworthy

#### Light Theme
```css
:root {
  --bg: #f0f4f8;
  --surface: #ffffff;
  --surface-elevated: #ffffff;
  --border: rgba(59, 130, 181, 0.2);
  --text: #1a2332;
  --text-dim: #4a6080;
  --accent: #2563eb;
  --accent-dim: rgba(37, 99, 235, 0.12);
  --font-heading: 'Space Mono', monospace;
  --font-body: 'Inter', system-ui, sans-serif;
  --font-mono: 'Space Mono', monospace;
  --radius: 4px;
  --shadow-sm: 0 1px 3px rgba(37, 99, 235, 0.08);
  --shadow-md: 0 4px 16px rgba(37, 99, 235, 0.12), 0 1px 4px rgba(0,0,0,0.06);
}
```

#### Dark Theme
```css
@media (prefers-color-scheme: dark) {
  :root {
    --bg: #0d1117;
    --surface: #161b22;
    --surface-elevated: #21262d;
    --border: rgba(48, 109, 180, 0.3);
    --text: #c9d1d9;
    --text-dim: #6e7681;
    --accent: #58a6ff;
    --accent-dim: rgba(88, 166, 255, 0.1);
  }
}
```

**Background treatment:** subtle dot-grid via `radial-gradient(circle, rgba(37,99,235,0.08) 1px, transparent 1px)` at 24px spacing
**Shadow style:** blue-tinted, low opacity. `0 4px 16px rgba(37, 99, 235, 0.12)`

---

### Editorial
> Long-form content, portfolios, agency sites, publishing platforms.
**Fonts:** Instrument Serif (headings) + Literata (body) + JetBrains Mono (mono)
**Mood:** refined, literary, timeless

#### Light Theme
```css
:root {
  --bg: #faf8f5;
  --surface: #ffffff;
  --surface-elevated: #fffefb;
  --border: #e8e4de;
  --text: #1c1917;
  --text-dim: #78716c;
  --accent: #b45309;
  --accent-dim: rgba(180, 83, 9, 0.1);
  --font-heading: 'Instrument Serif', 'Georgia', serif;
  --font-body: 'Literata', 'Georgia', serif;
  --font-mono: 'JetBrains Mono', monospace;
  --radius: 6px;
  --shadow-sm: 0 1px 4px rgba(28, 25, 23, 0.06);
  --shadow-md: 0 4px 20px rgba(28, 25, 23, 0.08), 0 1px 4px rgba(28, 25, 23, 0.04);
}
```

#### Dark Theme
```css
@media (prefers-color-scheme: dark) {
  :root {
    --bg: #1c1917;
    --surface: #292524;
    --surface-elevated: #3c3633;
    --border: #44403c;
    --text: #e7e5e4;
    --text-dim: #a8a29e;
    --accent: #fb923c;
    --accent-dim: rgba(251, 146, 60, 0.1);
  }
}
```

**Background treatment:** faint warm grain overlay via SVG filter, opacity 3%
**Shadow style:** warm brown-tinted. `0 4px 20px rgba(28, 25, 23, 0.08)`

---

### Paper/Ink
> Notebooks, journals, handcraft brands, artisan portfolios, zines.
**Fonts:** Fraunces (headings) + Newsreader (body) + Courier Prime (mono)
**Mood:** analog, warm, organic

#### Light Theme
```css
:root {
  --bg: #faf7f2;
  --surface: #f5f0e8;
  --surface-elevated: #fffef9;
  --border: #d4c9b4;
  --text: #2d2316;
  --text-dim: #7a6a52;
  --accent: #8b5e3c;
  --accent-dim: rgba(139, 94, 60, 0.12);
  --font-heading: 'Fraunces', serif;
  --font-body: 'Newsreader', serif;
  --font-mono: 'Courier Prime', monospace;
  --radius: 3px;
  --shadow-sm: 0 2px 6px rgba(45, 35, 22, 0.1);
  --shadow-md: 0 6px 24px rgba(45, 35, 22, 0.12), 0 2px 6px rgba(45, 35, 22, 0.06);
}
```

#### Dark Theme
```css
@media (prefers-color-scheme: dark) {
  :root {
    --bg: #1a130a;
    --surface: #251c11;
    --surface-elevated: #322618;
    --border: #4a3825;
    --text: #e8dcc8;
    --text-dim: #9a8570;
    --accent: #d4956a;
    --accent-dim: rgba(212, 149, 106, 0.12);
  }
}
```

**Background treatment:** subtle paper texture via repeating noise, very light grain at 4% opacity
**Shadow style:** warm sepia. `0 6px 24px rgba(45, 35, 22, 0.12)`

---

### Monochrome Terminal
> CRT/retrocomputing aesthetic, developer personal sites, terminal emulators.
**Fonts:** JetBrains Mono (headings + body + mono)
**Mood:** retro, raw, focused

#### Light Theme
```css
:root {
  --bg: #f5f5f0;
  --surface: #ebebea;
  --surface-elevated: #ffffff;
  --border: rgba(0, 0, 0, 0.12);
  --text: #111111;
  --text-dim: #555555;
  --accent: #1a1a1a;
  --accent-dim: rgba(0, 0, 0, 0.08);
  --font-heading: 'JetBrains Mono', monospace;
  --font-body: 'JetBrains Mono', monospace;
  --font-mono: 'JetBrains Mono', monospace;
  --radius: 2px;
  --shadow-sm: none;
  --shadow-md: 0 0 0 1px rgba(0,0,0,0.1);
}
```

#### Dark Theme
```css
@media (prefers-color-scheme: dark) {
  :root {
    --bg: #0c0c0c;
    --surface: #141414;
    --surface-elevated: #1e1e1e;
    --border: rgba(255, 255, 255, 0.1);
    --text: #e0e0e0;
    --text-dim: #666666;
    --accent: #f0f0f0;
    --accent-dim: rgba(240, 240, 240, 0.08);
  }
}
```

**Background treatment:** no decoration — pure monochrome. Optional scanlines at 2% opacity.
**Shadow style:** none or 1px border. Elevation via border shift, not shadow.

---

### Dracula
> Code editors, developer tools, syntax highlighting previews, IDE-adjacent UIs.
**Fonts:** JetBrains Mono (headings + mono) + Inter (body)
**Mood:** dark, vivid, developer-native

#### Light Theme
```css
:root {
  --bg: #f8f8f2;
  --surface: #ffffff;
  --surface-elevated: #ffffff;
  --border: rgba(98, 114, 164, 0.2);
  --text: #282a36;
  --text-dim: #6272a4;
  --accent: #8be9fd;
  --accent-dim: rgba(139, 233, 253, 0.15);
  --font-heading: 'JetBrains Mono', monospace;
  --font-body: 'Inter', system-ui, sans-serif;
  --font-mono: 'JetBrains Mono', monospace;
  --radius: 6px;
  --shadow-sm: 0 2px 8px rgba(40, 42, 54, 0.08);
  --shadow-md: 0 4px 20px rgba(40, 42, 54, 0.12);
}
```

#### Dark Theme
```css
@media (prefers-color-scheme: dark) {
  :root {
    --bg: #282a36;
    --surface: #343746;
    --surface-elevated: #44475a;
    --border: rgba(98, 114, 164, 0.3);
    --text: #f8f8f2;
    --text-dim: #6272a4;
    --accent: #bd93f9;
    --accent-dim: rgba(189, 147, 249, 0.12);
  }
}
```

**Background treatment:** none — Dracula palette is its own texture
**Shadow style:** purple-tinted in dark. `0 4px 20px rgba(189, 147, 249, 0.15)`

---

### Nord
> Technical documentation, clean developer tools, Scandinavian-aesthetic products.
**Fonts:** Plus Jakarta Sans (headings + body) + JetBrains Mono (mono)
**Mood:** calm, icy, systematic

#### Light Theme
```css
:root {
  --bg: #eceff4;
  --surface: #e5e9f0;
  --surface-elevated: #ffffff;
  --border: rgba(76, 86, 106, 0.15);
  --text: #2e3440;
  --text-dim: #4c566a;
  --accent: #5e81ac;
  --accent-dim: rgba(94, 129, 172, 0.12);
  --font-heading: 'Plus Jakarta Sans', sans-serif;
  --font-body: 'Plus Jakarta Sans', sans-serif;
  --font-mono: 'JetBrains Mono', monospace;
  --radius: 8px;
  --shadow-sm: 0 1px 4px rgba(46, 52, 64, 0.06);
  --shadow-md: 0 4px 16px rgba(46, 52, 64, 0.1), 0 1px 4px rgba(46, 52, 64, 0.06);
}
```

#### Dark Theme
```css
@media (prefers-color-scheme: dark) {
  :root {
    --bg: #2e3440;
    --surface: #3b4252;
    --surface-elevated: #434c5e;
    --border: rgba(216, 222, 233, 0.1);
    --text: #eceff4;
    --text-dim: #81a1c1;
    --accent: #88c0d0;
    --accent-dim: rgba(136, 192, 208, 0.12);
  }
}
```

**Background treatment:** none — Nord palette is architectural
**Shadow style:** desaturated, barely-there. `0 4px 16px rgba(46, 52, 64, 0.1)`

---

### Warm Signal
> Fintech, wealth management, premium SaaS dashboards, sophisticated dark-mode apps.
**Fonts:** Clash Display (headings) + Satoshi (body) + JetBrains Mono (mono)
**Mood:** rich, amber, sophisticated

#### Light Theme
```css
:root {
  --bg: #fdf6ec;
  --surface: #ffffff;
  --surface-elevated: #fff9f0;
  --border: rgba(180, 120, 30, 0.15);
  --text: #1c1409;
  --text-dim: #7a5c30;
  --accent: #d97706;
  --accent-dim: rgba(217, 119, 6, 0.1);
  --font-heading: 'Clash Display', sans-serif;
  --font-body: 'Satoshi', sans-serif;
  --font-mono: 'JetBrains Mono', monospace;
  --radius: 10px;
  --shadow-sm: 0 2px 8px rgba(180, 120, 30, 0.08);
  --shadow-md: 0 8px 32px rgba(180, 120, 30, 0.12), 0 2px 8px rgba(0,0,0,0.04);
}
```

#### Dark Theme
```css
@media (prefers-color-scheme: dark) {
  :root {
    --bg: #130e05;
    --surface: #1f1709;
    --surface-elevated: #2c2212;
    --border: rgba(217, 119, 6, 0.2);
    --text: #f5e8c8;
    --text-dim: #8a7045;
    --accent: #f59e0b;
    --accent-dim: rgba(245, 158, 11, 0.12);
  }
}
```

**Background treatment:** subtle warm gradient radial in hero areas, 3% opacity amber glow
**Shadow style:** amber-tinted. `0 8px 32px rgba(180, 120, 30, 0.16)`

---

### Midnight Editorial
> Luxury brands, premium publications, high-end agency sites, portfolio sites.
**Fonts:** Fraunces (headings) + Newsreader (body) + JetBrains Mono (mono)
**Mood:** deep navy, gold, exclusive

#### Light Theme
```css
:root {
  --bg: #f7f8fa;
  --surface: #ffffff;
  --surface-elevated: #ffffff;
  --border: rgba(15, 23, 42, 0.1);
  --text: #0f172a;
  --text-dim: #475569;
  --accent: #b8860b;
  --accent-dim: rgba(184, 134, 11, 0.1);
  --font-heading: 'Fraunces', serif;
  --font-body: 'Newsreader', serif;
  --font-mono: 'JetBrains Mono', monospace;
  --radius: 8px;
  --shadow-sm: 0 1px 4px rgba(15, 23, 42, 0.06);
  --shadow-md: 0 8px 32px rgba(15, 23, 42, 0.1), 0 2px 8px rgba(15, 23, 42, 0.04);
}
```

#### Dark Theme
```css
@media (prefers-color-scheme: dark) {
  :root {
    --bg: #070c18;
    --surface: #0f172a;
    --surface-elevated: #1e293b;
    --border: rgba(184, 134, 11, 0.2);
    --text: #f1f5f9;
    --text-dim: #94a3b8;
    --accent: #d4af37;
    --accent-dim: rgba(212, 175, 55, 0.1);
  }
}
```

**Background treatment:** deep navy gradient on hero. Subtle gold hairline borders on key elements.
**Shadow style:** navy-tinted, deep. `0 8px 32px rgba(7, 12, 24, 0.4)`

---

### Swiss Clean
> B2B SaaS, productivity tools, clean brand sites, modernist design studios.
**Fonts:** Neue Haas Grotesk / Aktiv Grotesk (headings + body) + IBM Plex Mono (mono)
**Mood:** precise, bold, modernist

#### Light Theme
```css
:root {
  --bg: #ffffff;
  --surface: #f8f8f8;
  --surface-elevated: #ffffff;
  --border: #e0e0e0;
  --text: #111111;
  --text-dim: #666666;
  --accent: #e61919;
  --accent-dim: rgba(230, 25, 25, 0.08);
  --font-heading: 'Neue Haas Grotesk', 'Aktiv Grotesk', 'Arial Black', sans-serif;
  --font-body: 'Neue Haas Grotesk', 'Aktiv Grotesk', 'Arial', sans-serif;
  --font-mono: 'IBM Plex Mono', monospace;
  --radius: 0px;
  --shadow-sm: none;
  --shadow-md: 0 0 0 1px #e0e0e0;
}
```

#### Dark Theme
```css
@media (prefers-color-scheme: dark) {
  :root {
    --bg: #111111;
    --surface: #1a1a1a;
    --surface-elevated: #222222;
    --border: #333333;
    --text: #f4f4f0;
    --text-dim: #888888;
    --accent: #ff2a2a;
    --accent-dim: rgba(255, 42, 42, 0.1);
  }
}
```

**Background treatment:** none — structure IS the decoration. Visible grid lines as design element.
**Shadow style:** none. Elevation via 1px border shifts only.

---

### Terminal Mono
> Developer dashboards, command centers, monitoring interfaces, data terminals.
**Fonts:** JetBrains Mono (all)
**Mood:** technical, focused, code-native

#### Light Theme
```css
:root {
  --bg: #f5f5f5;
  --surface: #ebebeb;
  --surface-elevated: #ffffff;
  --border: rgba(0, 0, 0, 0.1);
  --text: #1a1a1a;
  --text-dim: #555555;
  --accent: #0891b2;
  --accent-dim: rgba(8, 145, 178, 0.1);
  --font-heading: 'JetBrains Mono', 'SF Mono', monospace;
  --font-body: 'JetBrains Mono', 'SF Mono', monospace;
  --font-mono: 'JetBrains Mono', 'SF Mono', monospace;
  --radius: 8px;
  --shadow-sm: none;
  --shadow-md: 0 0 0 1px rgba(0,0,0,0.08), 0 4px 12px rgba(0,0,0,0.06);
}
```

#### Dark Theme
```css
@media (prefers-color-scheme: dark) {
  :root {
    --bg: #0a0a0a;
    --surface: #141414;
    --surface-elevated: #1e1e1e;
    --border: rgba(255, 255, 255, 0.08);
    --text: #e0e0e0;
    --text-dim: #555555;
    --accent: #22d3ee;
    --accent-dim: rgba(34, 211, 238, 0.1);
  }
}
```

**Background treatment:** radial-gradient dot grid. `radial-gradient(circle, rgba(255,255,255,0.04) 1px, transparent 1px)` at 20px spacing.
**Shadow style:** none or border-only. Uses `border-top` separators instead of card shadows.

---

### Soft Premium
> Consumer apps, health/wellness, SaaS marketing, lifestyle products.
**Fonts:** Clash Display (headings) + Satoshi (body) + Geist Mono (mono)
**Mood:** haptic, airy, expensive

#### Light Theme
```css
:root {
  --bg: #fafaf9;
  --surface: #ffffff;
  --surface-elevated: #ffffff;
  --border: rgba(0, 0, 0, 0.06);
  --text: #111111;
  --text-dim: #6b7280;
  --accent: #7c3aed;
  --accent-dim: rgba(124, 58, 237, 0.08);
  --font-heading: 'Clash Display', 'Cabinet Grotesk', sans-serif;
  --font-body: 'Satoshi', 'Plus Jakarta Sans', sans-serif;
  --font-mono: 'Geist Mono', 'JetBrains Mono', monospace;
  --radius: 24px;
  --shadow-sm: 0 2px 8px rgba(0, 0, 0, 0.04), 0 0 0 1px rgba(0,0,0,0.04);
  --shadow-md: 0 20px 40px rgba(0, 0, 0, 0.06), 0 4px 12px rgba(0,0,0,0.04);
}
```

#### Dark Theme
```css
@media (prefers-color-scheme: dark) {
  :root {
    --bg: #0a0a0f;
    --surface: #13131a;
    --surface-elevated: #1e1e2a;
    --border: rgba(255, 255, 255, 0.06);
    --text: #f5f5f7;
    --text-dim: #8e8ea0;
    --accent: #a78bfa;
    --accent-dim: rgba(167, 139, 250, 0.1);
  }
}
```

**Background treatment:** subtle noise texture via SVG filter at 3% opacity. Optional mesh gradient orbs in hero.
**Shadow style:** wide, diffused ambient. `0 20px 40px rgba(0,0,0,0.06)` — the shadow spreads far but barely darkens.

---

### Editorial Minimal
> Magazines, personal blogs, photography sites, writing-focused platforms.
**Fonts:** Newsreader (headings) + system-serif (body) + JetBrains Mono (mono)
**Mood:** warm bone, off-black, editorial restraint

#### Light Theme
```css
:root {
  --bg: #f7f6f3;
  --surface: #ffffff;
  --surface-elevated: #ffffff;
  --border: #eaeaea;
  --text: #111111;
  --text-dim: #787774;
  --accent: #111111;
  --accent-dim: rgba(17, 17, 17, 0.06);
  --font-heading: 'Newsreader', 'Lyon Text', 'Instrument Serif', serif;
  --font-body: 'Literata', Georgia, serif;
  --font-mono: 'JetBrains Mono', 'SF Mono', monospace;
  --radius: 8px;
  --shadow-sm: 0 2px 8px rgba(0, 0, 0, 0.04);
  --shadow-md: 0 4px 16px rgba(0, 0, 0, 0.06), 0 1px 4px rgba(0,0,0,0.03);
}
```

#### Dark Theme
```css
@media (prefers-color-scheme: dark) {
  :root {
    --bg: #111111;
    --surface: #1a1a1a;
    --surface-elevated: #222222;
    --border: #2e2e2e;
    --text: #e8e6e1;
    --text-dim: #888884;
    --accent: #e8e6e1;
    --accent-dim: rgba(232, 230, 225, 0.06);
  }
}
```

**Background treatment:** none — warmth comes from `#f7f6f3` bone tone, not decoration
**Shadow style:** barely-there. `0 2px 8px rgba(0,0,0,0.04)` — reader barely notices it.

---

### Brutalist Swiss
> Design studios, portfolios, experimental sites, editorial magazines, avant-garde brands.
**Fonts:** Archivo Black / Monument Extended (headings) + Helvetica Neue (body) + IBM Plex Mono (mono)
**Mood:** raw, stark, print-derived

#### Light Theme
```css
:root {
  --bg: #f4f4f0;
  --surface: #eaeae6;
  --surface-elevated: #ffffff;
  --border: #050505;
  --text: #050505;
  --text-dim: #555555;
  --accent: #e61919;
  --accent-dim: rgba(230, 25, 25, 0.08);
  --font-heading: 'Archivo Black', 'Monument Extended', 'Arial Black', sans-serif;
  --font-body: 'Helvetica Neue', 'Helvetica', Arial, sans-serif;
  --font-mono: 'IBM Plex Mono', monospace;
  --radius: 0px;
  --shadow-sm: none;
  --shadow-md: none;
}
```

#### Dark Theme
```css
@media (prefers-color-scheme: dark) {
  :root {
    --bg: #0a0a0a;
    --surface: #111111;
    --surface-elevated: #1a1a1a;
    --border: #f4f4f0;
    --text: #f4f4f0;
    --text-dim: #888888;
    --accent: #ff2a2a;
    --accent-dim: rgba(255, 42, 42, 0.1);
  }
}
```

**Background treatment:** none — structure from visible grid borders. `display: grid; gap: 1px; background: #050505` with colored children creates razor-thin dividers.
**Shadow style:** none. Zero border-radius. Zero shadows. All elevation via border weight change.

---

### Brutalist Tactical
> Security dashboards, military-aesthetic apps, data-heavy monitoring, hacker tools.
**Fonts:** JetBrains Mono (all) + IBM Plex Mono (alternative)
**Mood:** CRT phosphor, classified, hardware-limited

#### Light Theme
```css
:root {
  --bg: #f0f0ec;
  --surface: #e4e4df;
  --surface-elevated: #f4f4f0;
  --border: #1a1a1a;
  --text: #0a0a0a;
  --text-dim: #4a4a4a;
  --accent: #1a7a1a;
  --accent-dim: rgba(26, 122, 26, 0.1);
  --font-heading: 'JetBrains Mono', 'IBM Plex Mono', monospace;
  --font-body: 'JetBrains Mono', 'IBM Plex Mono', monospace;
  --font-mono: 'JetBrains Mono', 'IBM Plex Mono', monospace;
  --radius: 0px;
  --shadow-sm: none;
  --shadow-md: none;
}
```

#### Dark Theme
```css
@media (prefers-color-scheme: dark) {
  :root {
    --bg: #0a0a0a;
    --surface: #111111;
    --surface-elevated: #1a1a1a;
    --border: rgba(234, 234, 234, 0.2);
    --text: #eaeaea;
    --text-dim: #666666;
    --accent: #00ff41;
    --accent-dim: rgba(0, 255, 65, 0.08);
  }
}
```

**Background treatment:** CRT scanlines via `repeating-linear-gradient(0deg, transparent, transparent 2px, rgba(0,0,0,0.15) 2px, rgba(0,0,0,0.15) 4px)`
**Shadow style:** none. Phosphor glow for accent only: `text-shadow: 0 0 10px rgba(0,255,65,0.4)` on status elements.

---

### Dark Luxury
> Premium products, exclusive services, high-end hospitality, luxury e-commerce.
**Fonts:** Cormorant Garamond / PP Editorial New (headings) + Satoshi (body) + JetBrains Mono (mono)
**Mood:** near-black, gold, hairline, exclusive

#### Light Theme
```css
:root {
  --bg: #f8f6f1;
  --surface: #ffffff;
  --surface-elevated: #ffffff;
  --border: rgba(180, 155, 90, 0.2);
  --text: #1a1510;
  --text-dim: #6b5d45;
  --accent: #b49545;
  --accent-dim: rgba(180, 149, 69, 0.1);
  --font-heading: 'Cormorant Garamond', 'PP Editorial New', serif;
  --font-body: 'Satoshi', sans-serif;
  --font-mono: 'JetBrains Mono', monospace;
  --radius: 6px;
  --shadow-sm: 0 1px 4px rgba(26, 21, 16, 0.06);
  --shadow-md: 0 8px 32px rgba(26, 21, 16, 0.1), 0 1px 4px rgba(180, 149, 69, 0.06);
}
```

#### Dark Theme
```css
@media (prefers-color-scheme: dark) {
  :root {
    --bg: #0c0a07;
    --surface: #14120e;
    --surface-elevated: #1e1c17;
    --border: rgba(180, 149, 69, 0.2);
    --text: #f0eadd;
    --text-dim: #8a7a5a;
    --accent: #d4af37;
    --accent-dim: rgba(212, 175, 55, 0.1);
  }
}
```

**Background treatment:** very subtle warm noise texture. In dark: thin gold hairline borders as primary structural element.
**Shadow style:** gold-tinted on dark. `0 8px 32px rgba(212, 175, 55, 0.08)` — barely warm, barely there.

---

### Neon Accent
> Gaming, entertainment, nightlife, creative agencies, bold brand campaigns.
**Fonts:** Cabinet Grotesk / Clash Display (headings) + Satoshi (body) + Geist Mono (mono)
**Mood:** dark canvas, one vivid accent, restrained (not rainbow)

#### Light Theme
```css
:root {
  --bg: #f8f9fa;
  --surface: #ffffff;
  --surface-elevated: #ffffff;
  --border: rgba(0, 0, 0, 0.08);
  --text: #0d0d0d;
  --text-dim: #6b7280;
  --accent: #00d4aa;
  --accent-dim: rgba(0, 212, 170, 0.1);
  --font-heading: 'Cabinet Grotesk', 'Clash Display', sans-serif;
  --font-body: 'Satoshi', sans-serif;
  --font-mono: 'Geist Mono', monospace;
  --radius: 12px;
  --shadow-sm: 0 2px 8px rgba(0, 0, 0, 0.06);
  --shadow-md: 0 8px 32px rgba(0, 0, 0, 0.08);
}
```

#### Dark Theme
```css
@media (prefers-color-scheme: dark) {
  :root {
    --bg: #080808;
    --surface: #111111;
    --surface-elevated: #1a1a1a;
    --border: rgba(255, 255, 255, 0.06);
    --text: #f0f0f0;
    --text-dim: #666666;
    --accent: #00d4aa;
    --accent-dim: rgba(0, 212, 170, 0.08);
  }
}
```

**Background treatment:** dark canvas is the feature. One or two very faint radial glows behind hero content, 2% opacity, same hue as accent.
**Shadow style:** accent-tinted on CTAs and key cards only. `0 0 0 1px rgba(0,212,170,0.2), 0 8px 32px rgba(0,212,170,0.08)`. Everything else: no shadow.
