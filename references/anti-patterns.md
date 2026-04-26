# Anti-Patterns Reference

Consolidated forbidden patterns across all design skills. If two or more appear in a single output, it is slop — reject and redo.

## Typography

| Forbidden | Why | Use Instead |
|-----------|-----|-------------|
| Inter as primary font | Most overused AI default | Geist, Outfit, Cabinet Grotesk, Satoshi |
| Roboto, Arial, Helvetica as primary | Generic system fallbacks promoted to primary | DM Sans, Plus Jakarta Sans, IBM Plex Sans |
| `system-ui, sans-serif` alone | No character, no intent | Named font + system fallback |
| Serif fonts on dashboard/software UIs | Breaks tool aesthetic | Sans-serif only for data UIs |
| Oversized H1 that screams | Hierarchy via size alone | Control with weight + color + tracking |
| Body text below 16px | Fails readability | `1rem` minimum for body |
| More than 2-3 font families | Visual noise | One display + one mono, max |
| Pairing two similar sans-serifs | No contrast = no hierarchy | Genuine contrast (serif+sans, geometric+humanist) |

## Color

| Forbidden | Why | Use Instead |
|-----------|-----|-------------|
| Pure black `#000000` | Harsh, unnatural | Off-black, Zinc-950 (`#09090b`), `oklch(10% 0 0)` |
| Indigo/violet (`#8b5cf6`, `#7c3aed`, `#a78bfa`) | Tailwind default purple = zero design intent | Terracotta, teal, rose, amber, deep blue |
| Cyan + magenta + pink neon gradient | AI slop signature | Earthy or IDE-derived palettes |
| Fuchsia `#d946ef` | Tailwind default | Cranberry, sage, emerald |
| Gradient text on headings (`background-clip: text`) | Screams AI-generated | Solid color with weight contrast |
| Animated glowing box-shadows | AI slop cliche | Subtle tinted shadows, inner borders |
| Neon/outer glow (`box-shadow` glows) | Dated, performant-hostile | 1px inner borders, subtle tinted shadows |
| Multiple overlapping radial neon glows | "Neon haze" = generic | Single ambient orb, max 15% opacity |
| Oversaturated accents (>80% saturation) | Clashes with neutrals | Desaturate to blend elegantly |
| Fluctuating warm/cool grays in same project | Inconsistent palette | One temperature, committed |
| Excessive gradient text on large headers | Generic AI pattern | Solid colors, typographic weight |

## Layout

| Forbidden | Why | Use Instead |
|-----------|-----|-------------|
| Perfectly centered everything | Zero visual interest | Asymmetric, split-screen, left-aligned |
| 3-column equal card row | Most generic AI layout | 2-col zig-zag, asymmetric grid, horizontal scroll |
| All cards styled identically | No hierarchy signal | Vary depth: hero > elevated > default > recessed |
| Every section equal visual weight | Nothing stands out | Hero sections dominate, reference sections compact |
| Symmetric left/right mirroring | Predictable, boring | Asymmetric whitespace, fractional grid units |
| `h-screen` for full-height sections | iOS Safari layout jump | `min-h-[100dvh]` always |
| Complex flexbox percentage math | Fragile | CSS Grid (`grid-cols-*`) |
| Centered Hero/H1 when DESIGN_VARIANCE > 4 | Anti-center bias rule | Split screen, left-aligned, asymmetric |
| Generic cards when VISUAL_DENSITY > 7 | Wasted space at high density | `border-t`, `divide-y`, negative space |

## Animation & Motion

| Forbidden | Why | Use Instead |
|-----------|-----|-------------|
| `@keyframes glow { box-shadow: 0 0 20px... }` | AI slop signature | No glowing shadows |
| Pulsing/breathing on static content | Purposeless motion | Reserve pulse for live status indicators |
| Continuous animations after page load | Distracting | Entrance reveals + hover feedback only |
| `ease-in` on UI elements | Feels sluggish | `ease-out` or custom curve |
| `transition: all` | Performance waste, unintended side effects | Specify exact properties |
| `scale(0)` entry animation | Nothing appears from nothing | Start from `scale(0.95)` + `opacity: 0` |
| Keyframes on rapidly-triggered elements | Restart from zero, not interruptible | CSS transitions for dynamic UI |
| Animation on keyboard-initiated actions | Users repeat these 100+ times/day | No animation, instant response |
| `window.addEventListener('scroll')` | Performance collapse | Framer Motion hooks or IntersectionObserver |
| Linear easing for UI transitions | Robotic feel | Custom cubic-bezier curves |
| Duration > 300ms on UI elements | Feels slow | 150-250ms for most interactions |

## Content & Data

| Forbidden | Why | Use Instead |
|-----------|-----|-------------|
| Emoji icons in section headers | AI slop signal | SVG icons, monospace labels, colored dot indicators |
| Generic names (John Doe, Jane Smith) | Lazy placeholder data | Creative, realistic-sounding names |
| Generic avatars (SVG egg/user icon) | Zero personality | Photo placeholders or styled initials |
| Predictable numbers (99.99%, 50%) | Obviously fake | Organic data (47.2%, 73.8%) |
| Startup slop names (Acme, Nexus, SmartFlow) | Template vibes | Premium, contextual brand names |
| Filler words (Elevate, Seamless, Unleash, Next-Gen) | AI copywriting cliches | Concrete verbs, specific claims |
| Broken Unsplash links | Unreliable CDN | `picsum.photos/seed/{string}/800/600` or SVG avatars |

## Template Patterns

| Forbidden | Why | Use Instead |
|-----------|-----|-------------|
| Three-dot window chrome (red/yellow/green) | Overused cliche | Simple header with filename/language label |
| KPI cards with identical gradient text | No hierarchy | Hero number for primary, subdued for supporting |
| "Neon Dashboard" as aesthetic choice | Always produces generic | Blueprint, Editorial, Paper/ink |
| Gradient mesh (pink/purple/cyan blobs) background | Generic AI background | Subtle gradients, faint grid, gentle radial glow |
| shadcn/ui in default state | Generic out of box | Customize radii, colors, shadows to match aesthetic |
| Custom mouse cursors | Outdated, accessibility/performance hostile | Standard cursors always |
| `useState` for magnetic hover / continuous animations | Performance collapse on mobile | `useMotionValue` + `useTransform` outside render cycle |
| Mixing GSAP/ThreeJS with Framer Motion in same tree | Conflicting animation systems | Framer for UI, GSAP/Three for isolated canvas/scroll |

## The Slop Test

Count how many of these appear in your output:

1. Inter/Roboto font with purple/violet gradient accents
2. Every heading has `background-clip: text` gradient
3. Emoji icons leading every section
4. Glowing cards with animated shadows
5. Cyan-magenta-pink color scheme on dark background
6. Perfectly uniform card grid with no visual hierarchy
7. Three-dot code block chrome

**Score 2+ = slop.** Regenerate with a constrained aesthetic (Blueprint, Editorial, Paper/ink, or a specific IDE theme).
