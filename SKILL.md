---
name: aaa-design
description: Ultimate design skill — produces AAA-quality HTML pages, diagrams, dashboards, and presentations. Routes to 15+ reference files by task type. Consolidates taste-skill + impeccable + Emil Kowalski + awesome-design-md.
---

# AAA Design

Six-layer system for producing visually distinctive, production-grade HTML. Every output must pass the slop test — if it looks AI-generated, it fails.

## Layer 1 — Design Parameters

Three dials control every generation. Override based on user request.

| Dial | Default | Scale |
|------|---------|-------|
| **DESIGN_VARIANCE** | 8 | 1 = symmetric grids. 4-7 = offset margins, mixed ratios. 8-10 = masonry, `2fr 1fr 1fr`, massive empty zones |
| **MOTION_INTENSITY** | 6 | 1-3 = hover/active only. 4-7 = CSS transitions, stagger cascades. 8-10 = scroll-triggered, spring physics |
| **VISUAL_DENSITY** | 4 | 1-3 = art gallery, huge whitespace. 4-7 = standard spacing. 8-10 = cockpit mode, `border-t` instead of cards |

Mobile override: DESIGN_VARIANCE 4-10 falls back to single-column below 768px.

## Layer 2 — Design Philosophy

1. **Default excellence.** Beautiful out of the box. Most users never customize.
2. **Invisible polish.** Pause toast timers on hidden tabs. Fill gaps with pseudo-elements. The aggregate of invisible correctness creates love.
3. **Anti-AI-slop.** If 2+ patterns from `./references/anti-patterns.md` appear, reject and redo. No Inter. No purple gradients. No glowing cards.
4. **Production-grade.** WCAG AA, no console errors, no layout shifts, semantic HTML.
5. **Context first.** You cannot infer design context from code. Ask what the user is building, who sees it, what emotion it should evoke.

## Layer 3 — Decision Tree Router

**Before generating, read the right references.** SKILL.md + 2-3 reference files per task (~1500 lines total). Never all files.

```
What are you building?
├── Website / Web App
│   ├── Landing / marketing    → Read templates/landing-page.html + references/presets.md
│   ├── Dashboard / admin      → Read templates/dashboard.html + aesthetics/terminal-mono.md
│   ├── Blog / article         → Read templates/article-page.html + references/css-components.md
│   ├── Product page           → Read templates/landing-page.html + templates/hero-sections.html
│   └── Custom / unknown       → Generate DESIGN.md first (see protocol below) → then implement
├── Diagram / Visualization
│   ├── Architecture           → Read templates/architecture.html + references/css-layout.md
│   ├── Flowchart / sequence   → Read templates/mermaid-flowchart.html + references/css-mermaid.md
│   ├── Data table             → Read templates/data-table.html + references/css-components.md
│   └── Dashboard with charts  → Read templates/dashboard.html + references/css-effects.md
├── Slide Deck                 → Read templates/slide-deck.html + references/slide-patterns.md
├── Redesign existing          → Read references/evaluation.md → audit → then fix
└── Components / design system → Read references/components.md + references/interactions.md
```

**Additional reads by need:**
- Need an aesthetic system? → `aesthetics/soft-premium.md`, `editorial-minimal.md`, `brutalist-industrial.md`, or `terminal-mono.md`
- Need wow effects? → `references/wow-patterns.md`
- Need brand inspiration? → `references/brand-references.md`
- Need UX copy? → `references/ux-writing.md`
- Need full CSS presets? → `references/presets.md` (16 aesthetic systems with full CSS vars)

## Layer 4 — Color Palettes (20)

Pick one. Never mix palettes. All include light + dark variants in `references/presets.md`.

| Mood | Name | Primary | Accent | Light BG | Dark BG |
|------|------|---------|--------|----------|---------|
| **Professional** | Navy & Gold | `#1e3a5f` | `#d4a73a` | `#faf8f2` | `#0f1729` |
| | Slate & Teal | `#334155` | `#0d9488` | `#f8fafc` | `#0f172a` |
| | Charcoal & Sage | `#374151` | `#65a30d` | `#f9fafb` | `#111827` |
| | Steel & Copper | `#44403c` | `#c2724e` | `#fafaf9` | `#1c1917` |
| **Warm** | Terracotta & Sage | `#c2410c` | `#65a30d` | `#faf7f5` | `#1a1412` |
| | Amber & Emerald | `#d97706` | `#059669` | `#fffbeb` | `#1c1916` |
| | Coral & Sand | `#e85d2a` | `#a3845b` | `#fef7f0` | `#1c1614` |
| | Cinnamon & Cream | `#92400e` | `#ca8a04` | `#fefce8` | `#1a1608` |
| **Cool** | Ocean & Ice | `#0369a1` | `#67e8f9` | `#f0f9ff` | `#0c1929` |
| | Indigo & Mint | `#4338ca` | `#34d399` | `#eef2ff` | `#0f0f2e` |
| | Storm & Lightning | `#475569` | `#38bdf8` | `#f1f5f9` | `#0f1218` |
| | Arctic & Aurora | `#155e75` | `#a78bfa` | `#ecfeff` | `#0a1628` |
| **Bold** | Crimson & Gold | `#be123c` | `#d4a73a` | `#fff5f5` | `#1a0a0a` |
| | Forest & Copper | `#166534` | `#c2724e` | `#f0fdf4` | `#0a1a0a` |
| | Royal & Champagne | `#581c87` | `#e5c77a` | `#faf5ff` | `#1a0a2e` |
| | Obsidian & Rose | `#1c1917` | `#fb7185` | `#fafaf9` | `#0c0a09` |
| **Neutral** | Stone & Cream | `#57534e` | `#ca8a04` | `#fafaf9` | `#1c1917` |
| | Graphite & Linen | `#374151` | `#a16207` | `#f9fafb` | `#111827` |
| | Ash & Wheat | `#525252` | `#b45309` | `#fafafa` | `#171717` |
| | Ink & Paper | `#18181b` | `#0d9488` | `#fafafa` | `#09090b` |

**Vary the choice.** If the last output used a warm palette, try cool. The swap test: replace your palette with generic dark — if nobody notices, you haven't designed.

## Layer 5 — DESIGN.md Protocol

For any custom project (not matching a template), generate a DESIGN.md BEFORE writing code. Structure (from awesome-design-md, 59 real brand specs):

1. **Visual Theme** — mood, adjectives, inspiration brand
2. **Color Roles** — primary, accent, background, surface, border, text, semantic (success/warning/error)
3. **Typography** — heading font, body font, mono font, scale, line-height, letter-spacing
4. **Components** — buttons, cards, inputs, navigation, badges (key CSS for each)
5. **Layout** — grid system, max-width, section spacing, responsive strategy
6. **Depth & Elevation** — shadow tiers, border strategy, glassmorphism rules
7. **Do's and Don'ts** — explicit list of banned patterns and required patterns
8. **Responsive** — breakpoints, mobile-first strategy, touch targets
9. **Agent Guide** — how an AI agent should interpret and implement this spec

See `references/brand-references.md` for real-world examples (Stripe, Linear, Figma, Apple, Claude).

## Layer 6 — Interaction Essentials

**Element states (8, not 5):** default, hover, active, focused, disabled, loading, error, success. See `references/components.md` for full implementations.

**Easing (custom curves, never browser defaults):**
```css
--ease-out: cubic-bezier(0.23, 1, 0.32, 1);      /* entering */
--ease-in: cubic-bezier(0.7, 0, 0.84, 0);          /* exiting */
--spring: cubic-bezier(0.34, 1.56, 0.64, 1);       /* playful */
--ease-drawer: cubic-bezier(0.32, 0.72, 0, 1);     /* iOS-like */
```

**Timing:** micro 100-150ms, small 200-250ms, medium 300-350ms, large 400-500ms. UI under 300ms always.

**Rules:** Only animate `transform` + `opacity`. Respect `prefers-reduced-motion`. Stagger: 50ms between items, cap 500ms. See `references/interactions.md` for advanced patterns.

## Layer 7 — Quality Gate

Run before delivering. No exceptions.

| Test | Fail If |
|------|---------|
| **Squint** | Can't perceive hierarchy at 30% blur |
| **Swap** | Replace styling with generic dark — nobody notices |
| **Slop** | 2+ patterns from `anti-patterns.md` |
| **Both Themes** | Either light or dark looks broken |
| **Responsive** | Content clips or overflows at any width |
| **Accessibility** | Contrast < 4.5:1 body, < 3:1 large. No focus indicators |

For comprehensive audits (5-dimension scoring, 5 test personas, cognitive load): read `references/evaluation.md`.

## Output Format

Single self-contained `.html` file. No external assets except CDN fonts/libraries. Output to `~/.agent/diagrams/`. Open with `open <file>` (macOS).

**Deploy:** `bash {{skill_dir}}/scripts/share.sh <file>` → live Vercel URL.

## Diagram Types (Quick Reference)

| Content | Approach |
|---------|----------|
| Architecture (text-heavy) | CSS Grid cards + flow arrows |
| Architecture (topology) | Mermaid with `theme: 'base'` + `themeVariables` |
| Flowchart / pipeline | Mermaid `graph TD`, `layout: 'elk'` for complex |
| Data table | HTML `<table>` with sticky header |
| Timeline | CSS (central line + cards) |
| Dashboard | CSS Grid + Chart.js |
| Sequence | Mermaid `sequenceDiagram` |

**Mermaid rules:** Always `theme: 'base'` matching page palette. Center with flex. Add zoom controls. Use `<br/>` not `\n`. Never define `.node` CSS class. 15+ elements → hybrid pattern.

## Slide Deck Mode

Opt-in only. Read `./references/slide-patterns.md` + `./templates/slide-deck.html` before generating.

Each slide = 100dvh. Typography 2-3x larger. Pick one preset from `references/presets.md` and commit.

## Architecture Decision

| Project | CSS Approach |
|---------|-------------|
| Next.js + shadcn | Tailwind + CSS variables |
| Component library | CSS Modules + tokens |
| WordPress | BEM + custom properties |
| Static HTML | Vanilla CSS + custom properties |

**Token rule:** Components reference tokens, never raw values. `bg-[#1a1a1a]` = violation.

## File Map

```
templates/          → 8 reference HTML implementations
references/         → 15 focused guides (<400 lines each, 3-line TL;DR headers)
aesthetics/         → 4 full aesthetic sub-systems (soft-premium, editorial, brutalist, terminal)
scripts/share.sh    → Vercel instant deploy
```
