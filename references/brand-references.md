# Brand Design References
> Cross-cutting patterns from 59 real brands (Stripe, Linear, Figma, Apple, Claude, Vercel).
> Shadow as brand expression. Typography as signature. Negative letter-spacing at display sizes.
> Use the 9-section DESIGN.md structure for any new project's design spec.

> **Brand specs on disk: `references/brand-specs/<slug>/DESIGN.md`** (16 installed, refreshed weekly).
> Fintech: stripe · coinbase · kraken · wise · revolut. SaaS: linear-app · vercel · notion · cal · raycast. AI: claude · cohere · opencode-ai. Premium: apple · tesla · spotify.
> To add a brand: in any temp dir run `npx -y getdesign@latest add <slug>` then move the resulting `DESIGN.md` into `references/brand-specs/<slug>/`. Or open a slop-labeled GitHub issue and let Monday's refresh agent handle it.

---

## 1. The DESIGN.md Protocol

### What It Is
DESIGN.md is a plain-text design system document that AI agents read to generate consistent UI. No Figma exports, no JSON schemas — just a markdown file dropped in the project root.

### The 9-Section Structure
Every DESIGN.md follows this format (from [awesome-design-md](https://github.com/VoltAgent/awesome-design-md)):

| # | Section | What It Captures |
|---|---------|-----------------|
| 1 | Visual Theme & Atmosphere | Mood, density, design philosophy in prose |
| 2 | Color Palette & Roles | Semantic name + hex + functional role for every color |
| 3 | Typography Rules | Font families, full hierarchy table with sizes/weights/tracking |
| 4 | Component Stylings | Buttons, cards, inputs, navigation with all states |
| 5 | Layout Principles | Spacing scale, grid, whitespace philosophy |
| 6 | Depth & Elevation | Shadow system, surface hierarchy table |
| 7 | Do's and Don'ts | Design guardrails and anti-patterns |
| 8 | Responsive Behavior | Breakpoints, touch targets, collapsing strategy |
| 9 | Agent Prompt Guide | Quick color reference + ready-to-use component prompts |

### When to Generate a DESIGN.md
Generate before writing any code when:
- Starting a new website, app, or product
- Redesigning an existing product
- Building a component library
- Onboarding an AI agent to an existing codebase's visual style

### How to Use It
1. Pick a reference brand close to your aesthetic (see Section 3 below)
2. Copy that brand's DESIGN.md from `awesome-design-md` as a starting point
3. Modify Section 2 (colors) and Section 3 (fonts) for your brand
4. Section 9 (Agent Prompt Guide) is the most important — it's what you paste to the agent

The design spec drives code. Never let code drive the design spec.

---

## 2. Cross-Cutting Patterns

These patterns appear across multiple top brands. They separate premium from generic.

### Shadow as Brand Expression
Shadows should match your accent color, not default to neutral gray.

- **Stripe**: `rgba(50,50,93,0.25)` — blue-tinted primary shadow echoes the navy-purple palette. Even elevation feels on-brand.
- **Claude**: `rgba(0,0,0,0.05) 0px 4px 24px` — whisper-soft warm shadow, barely visible. Depth through ring shadows instead.
- **Linear**: Semi-transparent white borders on dark (`rgba(255,255,255,0.08)`) replace shadows entirely. Elevation = luminance steps.
- **Vercel**: Multi-layer stack: `rgba(0,0,0,0.08) 0px 0px 0px 1px, rgba(0,0,0,0.04) 0px 2px 2px, #fafafa 0px 0px 0px 1px` — the inner `#fafafa` ring is the glow that makes Vercel cards feel built, not floating.
- **Framer**: `rgba(0,153,255,0.15) 0px 0px 0px 1px` — blue-tinted ring on pure black. Every bordered element subtly signals the brand color.
- **Resend**: `rgba(214,235,253,0.19)` frost borders — icy blue-tinted lines that catch light against the void.

**Rule**: Tint your shadows with your accent color at 8–25% opacity. A shadow at `rgba(50,50,93,0.25)` vs `rgba(0,0,0,0.25)` feels completely different.

### Typography as Signature
Font weight and tracking choices are more distinctive than font choice alone.

- **Stripe**: weight 300 at display sizes — light as luxury. Opposite of the "bold headline" convention. Feels like it doesn't need to shout.
- **Linear**: weight 510 as the default emphasis weight — between regular (400) and medium (500). Subtly heavier than expected.
- **Superhuman**: weight 460 and 540 — non-standard stops on a variable font, sitting between conventional categories.
- **Figma**: weight 320, 330, 340 — variable font weights most systems never explore. Hierarchy through micro-differences.
- **Vercel**: weight 400/500/600 only — three weights, strict roles: 400 (read), 500 (interact), 600 (announce). No 700.

### Negative Letter-Spacing at Display Sizes
Nearly every premium brand tightens display headings. Common range: -0.02em to -0.04em.

| Brand | Display Size | Letter-Spacing |
|-------|-------------|----------------|
| Stripe | 56px | -1.4px |
| Stripe | 48px | -0.96px |
| Vercel | 48px | -2.4px to -2.88px |
| Linear | 72px | -1.584px |
| Linear | 48px | -1.056px |
| Notion | 64px | -2.125px |
| Framer | 110px | -5.5px |
| Resend | 56px (ABC Favorit) | -2.8px |
| Apple | 56px | -0.28px |
| Cursor | 72px | -2.16px |
| Supabase | 72px | normal (zero) — intentional density via 1.00 line-height |

Progressive relaxation: always loosen tracking as font size decreases. At 16px body = normal tracking.

### Section Rhythm via Background Alternation
White → off-white → dark → white. This pattern appears in Stripe, Vercel, Apple, Claude, Notion, Linear.

- **Apple**: Strict binary — `#000000` (dark immersive) alternates with `#f5f5f7` (informational). Like scenes in a film.
- **Claude**: Parchment (`#f5f4ed`) alternates with Near Black (`#141413`). Each section is a distinct "room."
- **Notion**: White alternates with Warm White (`#f6f5f4`). Gentle rhythm, same tone family.
- **Stripe**: Full-width dark brand sections (`#1c1e54`) break the white canvas at key moments.

Never put 3+ white sections in a row — visual entropy increases.

### Semantic Color Constraint
Best brands use 1-2 accent colors max. Everything else is neutral gray spectrum.

- **Apple**: One accent — Apple Blue (`#0071e3`). Reserved exclusively for interactive elements.
- **Linear**: One accent — brand indigo (`#5e6ad2` / `#7170ff`). Everything else is cool gray.
- **Figma**: Zero interface colors. Literally only `#000000` and `#ffffff` for chrome. Color comes from product content only.
- **Supabase**: One accent — emerald green (`#3ecf8e`). Always identity marker, never decoration.
- **Vercel**: Three functional colors — Ship Red (`#ff5b4f`), Preview Pink (`#de1d8d`), Develop Blue (`#0a72ef`) — only in workflow pipeline context.

### Dark Mode is NOT Inverted Light Mode
On dark surfaces, elevation works in reverse — lighter surfaces are higher.

- **Linear**: Background luminance stepping: `rgba(255,255,255, 0.02 → 0.04 → 0.05)` — more opaque = more elevated.
- **Spotify**: `#121212` (base) → `#181818` (cards) → `#1f1f1f` (interactive) — shade differences communicate hierarchy.
- **Supabase**: Borders go darker → lighter: `#242424` (subtle) → `#2e2e2e` (standard) → `#363636` (prominent).
- Desaturate accents slightly in dark mode — Stripe's purple, Linear's violet both reduce saturation to avoid neon bleed.

### Border as Secondary Expression
1px borders at very low opacity (0.06–0.12) replace or supplement shadows.

- **Vercel**: Shadow-as-border — `box-shadow: 0px 0px 0px 1px rgba(0,0,0,0.08)`. Zero offset, zero blur, 1px spread. Avoids box-model implications of real borders.
- **Linear**: `rgba(255,255,255,0.05)` to `rgba(255,255,255,0.08)` — borders drawn in moonlight.
- **Notion**: `1px solid rgba(0,0,0,0.1)` throughout — whisper-weight division lines.
- **Resend**: `rgba(214,235,253,0.19)` — icy blue-tinted lines. Not gray, not neutral. Cold crystalline shimmer.
- **Claude**: `1px solid #f0eee6` — cream-tinted border barely visible, creates containment without weight.

### Warm vs Cool Gray as Philosophy
Your grays reveal your brand temperature.

- **Warm grays** (yellow-brown undertone): Claude (`#5e5d59`, `#87867f`), Cursor (`#26251e`), Notion (`#615d59`, `#a39e98`), Superhuman (`#292827`). Approachable, editorial, human.
- **Cool grays** (blue undertone): Linear (`#d0d6e0`, `#8a8f98`), Vercel (`#4d4d4d`, `#666666`), Stripe (`#64748d`). Technical, precise, developer-native.

Never mix warm and cool grays in the same system. Pick a temperature and commit.

---

## 3. Brand-Specific Recommendations

### For Landing Pages / Marketing

**Study Stripe** when you need:
- Shadow system that feels branded (blue-tinted: `rgba(50,50,93,0.25)`)
- Weight 300 typography that signals premium without shouting
- Feature section layouts with dark brand break (`#1c1e54`)
- Financial/enterprise credibility combined with design taste
- Blue-to-magenta gradient accents (`#ea2261` → `#f96bee`) for hero decoration
- Tabular number formatting (`"tnum"` OpenType) in data displays

**Study Figma** when you need:
- Monochrome interface with product color as the hero
- Variable font with unusual weight stops (320, 330, 340, 450, 480, 540)
- Pill and circular button geometry (50px radius, 50%)
- Gallery-like pacing where product screenshots are the art
- Vibrant gradient hero section (electric green, yellow, purple, pink)

**Study Vercel** when you need:
- Maximum minimalism with technical authority
- Geist font at -2.4px to -2.88px display tracking
- Shadow-as-border technique instead of CSS borders
- Pure achromatic palette with functional accent colors only
- Compressed, billboard-impact headlines that feel "minified"

### For Dashboards / Data-Heavy UI

**Study Linear** when you need:
- Dark-first luminance hierarchy
- Dense sidebar navigation with keyboard shortcut affordances
- Inter Variable with `"cv01", "ss03"` for a geometric, purposeful feel
- Surface elevation through background opacity steps (not shadows)
- weight 510 as a signature "between-weights" emphasis

**Study Stripe Dashboard** when you need:
- Tabular numbers (`"tnum"`) in financial data tables
- Clean metric cards with `sohne-var` weight 300
- Dense financial data with generous surrounding chrome
- Conservative 4–8px border radius (nothing pill-shaped)

**Study Supabase** when you need:
- Code-integrated UI (terminal windows embedded in marketing)
- HSL with alpha channels for translucent layering
- Depth through border hierarchy instead of shadows
- Developer console markers (Source Code Pro uppercase, 1.2px tracking)

### For Warm / Human Products

**Study Claude** when you need:
- Warm parchment backgrounds (`#f5f4ed`) — aged paper, not white
- Serif headings (Anthropic Serif weight 500) with editorial gravitas
- All-warm neutrals — every gray with yellow-brown undertone
- Ring-based shadow system (`0px 0px 0px 1px`)
- Terracotta accent (`#c96442`) — earthy, deliberately un-tech
- Generous body line-height (1.60) for a literary reading experience
- Organic illustrations instead of tech iconography

**Study Notion** when you need:
- Content-first minimal chrome
- Warm neutral grays (`#f6f5f4`, `#615d59`, `#a39e98`) with yellow undertones
- Multi-layer shadows at sub-0.05 individual opacity (depth felt, not seen)
- Ultra-thin `1px solid rgba(0,0,0,0.1)` borders throughout
- White/warm-white section alternation for gentle visual rhythm

**Study Cursor** when you need:
- Warm off-white canvas (`#f2f1ed`) with dark warm-brown text (`#26251e`)
- Three-font system: gothic display (CursorGothic), serif body (jjannon), mono code (berkeleyMono)
- oklab color space borders for perceptually uniform edge treatment
- Hover states that shift text color to warm crimson (`#cf2d56`)

### For Developer Tools

**Study Vercel** when you need:
- Geist font system — `Geist Sans` + `Geist Mono` with OpenType `"liga"` globally
- Terminal-inspired components and deployment status patterns
- Technical language baked into design: compressed text as "minified" aesthetic
- Workflow-specific color coding (Red/Pink/Blue for each pipeline stage)

**Study Cursor** when you need:
- AI-integrated UI patterns (timeline showing thinking/grep/read/edit states)
- Code editor chrome embedded in marketing
- Warm developer tool aesthetic (cream, not cold white)
- Sub-8px spacing scale (1.5, 2, 2.5, 3, 4, 5, 6px) for micro-precision

**Study Resend** when you need:
- Premium developer docs aesthetic on pure black
- Three-font editorial hierarchy: serif hero (Domaine Display), geometric sections (ABC Favorit), body (Inter)
- Icy blue-tinted frost borders (`rgba(214,235,253,0.19)`)
- Multi-color accent scale per feature with opacity variants (12–42%)
- Commit Mono as first-class design element, not afterthought

**Study Supabase** when you need:
- Green accent as identity marker, never decoration
- Depth through border contrast (no shadows on dark backgrounds)
- Radix color primitives + HSL alpha for sophisticated token system
- Source Code Pro uppercase as "developer console" marker

### For Premium / Luxury

**Study Apple** when you need:
- Extreme negative space — each product section at near full-viewport height
- SF Pro Display/Text with optical sizing (Display at 20px+, Text below)
- Single accent color (`#0071e3`) reserved exclusively for interactive elements
- Glass nav: `rgba(0,0,0,0.8)` + `backdrop-filter: saturate(180%) blur(20px)`
- 980px pill radius for "Learn more" CTAs — the signature Apple link shape
- Binary section rhythm: `#000000` (immersive) ↔ `#f5f5f7` (informational)
- No borders on cards — elevation through background color contrast only

**Study Superhuman** when you need:
- Deep purple gradient hero (`#1b1938`) as singular dramatic gesture — rest is white
- Variable font with non-standard weight stops (460, 540) — confidence without aggression
- Ultra-tight display line-height (0.96) — headlines feel architectural
- Warm cream buttons (`#e9e5dd`) instead of saturated CTAs — understated luxury
- Binary border-radius system: only 8px and 16px — radical simplicity
- Lavender accent (`#cbb7fb`) as the only color departure from neutral palette

**Study Framer** when you need:
- Absolute void black (`#000000`) — not warm, not gray
- GT Walsheim with -5.5px tracking at 110px — most extreme compression in dev tooling
- Frosted glass surfaces: `rgba(255,255,255,0.1)` on dark backgrounds
- Blue accent ring shadows: `rgba(0,153,255,0.15) 0px 0px 0px 1px`
- Product screenshots as sole marketing imagery — no illustrations, no icons

### For Music / Media / Entertainment

**Study Spotify** when you need:
- Content-first darkness — UI recedes so album art can glow
- Pill and circle geometry exclusively (500px–9999px, 50%)
- Uppercase button labels with wide tracking (1.4px–2px)
- Heavy shadows on dark: `rgba(0,0,0,0.5) 0px 8px 24px`
- Functional green accent (`#1ed760`) — never decorative
- Compact typography (10px–24px range) — app density, not editorial

---

## 4. Quick Reference Table

| Brand | Primary Font | Accent Color | Signature Pattern | Best For |
|-------|-------------|-------------|-------------------|----------|
| **Stripe** | sohne-var weight 300 | `#533afd` purple | Blue-tinted shadows, light headlines | Fintech, enterprise SaaS |
| **Linear** | Inter Variable weight 510 | `#5e6ad2` indigo | Luminance stepping on dark, `cv01+ss03` | Developer tools, project management |
| **Figma** | figmaSans weight 320–700 | None (black + white) | Interface-less chrome, product IS the color | Creative tools, design products |
| **Apple** | SF Pro Display + Text | `#0071e3` blue | Optical sizing, 980px pill CTAs, glass nav | Consumer hardware, premium products |
| **Claude** | Anthropic Serif weight 500 | `#c96442` terracotta | Parchment background, warm ring shadows | AI products, warm editorial |
| **Vercel** | Geist weight 600 | Functional only | Shadow-as-border, -2.88px display tracking | Dev platforms, deployment |
| **Notion** | NotionInter weight 700 | `#0075de` blue | Warm grays, whisper borders, 5-layer shadows | Productivity, content tools |
| **Spotify** | SpotifyMixUI weight 700 | `#1ed760` green | Dark content-first, pill geometry, uppercase buttons | Media, music, entertainment |
| **Supabase** | Circular weight 400 | `#3ecf8e` green | Border depth hierarchy, HSL tokens, no shadows | Open-source developer tools |
| **Cursor** | CursorGothic + jjannon | `#f54e00` orange | oklab borders, three-font system, warm cream canvas | AI code editors |
| **Framer** | GT Walsheim weight 500 | `#0099ff` blue | -5.5px tracking at 110px, void black canvas | Design tools, motion-first |
| **Resend** | Domaine + ABC Favorit | `#ff801f` orange | Frost borders, three-font editorial hierarchy | Developer email, API docs |
| **Superhuman** | Super Sans VF weight 460 | `#cbb7fb` lavender | Purple gradient hero, variable weight 460/540, binary radii | Premium productivity |
| **Linear** | Inter Variable weight 510 | `#5e6ad2` indigo | Dark-native, luminance hierarchy, `cv01+ss03` | Issue tracking, dev tools |
| **Framer** | GT Walsheim Medium | `#0099ff` blue | Absolute black void, frosted glass, spring-loaded type | Dark design tools |

---

## 5. GitHub Source & Deep Study

**Repo**: [https://github.com/VoltAgent/awesome-design-md](https://github.com/VoltAgent/awesome-design-md)

58 DESIGN.md files (plus yours), each with:
- `DESIGN.md` — the design system (what agents read)
- `preview.html` — visual catalog: color swatches, type scale, buttons, cards
- `preview-dark.html` — same catalog with dark surfaces

### Directory Paths
```
awesome-design-md/design-md/
├── stripe/DESIGN.md          # Enterprise SaaS gold standard
├── linear.app/DESIGN.md      # Dark-first developer tool
├── figma/DESIGN.md           # Creative tool, variable font mastery
├── apple/DESIGN.md           # Minimal, optical sizing, SF Pro
├── claude/DESIGN.md          # Warm AI, parchment canvas
├── vercel/DESIGN.md          # Technical minimal, Geist system
├── notion/DESIGN.md          # Content-first, warm neutrals
├── spotify/DESIGN.md         # Dark media, pill geometry
├── supabase/DESIGN.md        # Developer emerald, border depth
├── cursor/DESIGN.md          # Warm dev tool, oklab borders
├── framer/DESIGN.md          # Void black, extreme tracking
├── resend/DESIGN.md          # Frost border, editorial dark
└── superhuman/DESIGN.md      # Luxury email, variable font
```

### How to Use for a New Project
1. Find the brand closest to your aesthetic in the table above
2. Copy their DESIGN.md as your starting template
3. Replace Section 2 (colors) and Section 3 (fonts) for your brand
4. Keep the Section 1 (Visual Theme) prose style as a model — describe atmosphere
5. Paste Section 9 (Agent Prompt Guide) directly to the AI agent as context

### Blending References
When no single brand fits, combine two:

| Goal | Blend |
|------|-------|
| Dark + developer + warm | Linear + Cursor |
| Minimal + human + editorial | Notion + Claude |
| Premium + technical | Apple + Vercel |
| Bold + creative + motion | Figma + Framer |
| Developer + premium dark | Resend + Superhuman |
| Open-source + trustworthy | Supabase + Linear |
