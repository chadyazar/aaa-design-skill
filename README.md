<div align="center">

![aaa-design banner](assets/banner.svg)

**The ultimate design skill for Claude Code — produces AAA-quality HTML pages, dashboards, slide decks, and diagrams that pass the slop test.**

[![License: MIT](https://img.shields.io/badge/License-MIT-9333ea?style=flat-square)](LICENSE)
[![Brand Specs](https://img.shields.io/badge/brand_specs-16-533afd?style=flat-square)](references/brand-specs)
[![Templates](https://img.shields.io/badge/templates-8-a78bfa?style=flat-square)](templates)
[![Aesthetics](https://img.shields.io/badge/aesthetics-4-c4b5fd?style=flat-square)](aesthetics)
[![References](https://img.shields.io/badge/references-15-e9d5ff?style=flat-square)](references)
[![Weekly Refresh](https://img.shields.io/badge/refresh-weekly_monday_05_dubai-34d399?style=flat-square)](scripts/weekly-refresh.sh)

[Install](#install) · [How it works](#how-it-works) · [Brand specs](#brand-specs) · [Templates](#templates) · [Quality gate](#quality-gate) · [Weekly refresh](#weekly-refresh)

</div>

---

## What this is

A self-contained Claude Code skill that lives at `~/.claude/skills/aaa-design/` and is invoked via `Skill(aaa-design)` from any project. It enforces a 7-layer system — design parameters, philosophy, decision-tree router, color palettes, DESIGN.md protocol, interaction essentials, quality gate — that produces output indistinguishable from senior product-design work.

Built on four lineages: [taste-skill](https://github.com/anthropics/skills) · impeccable · [Emil Kowalski](https://emilkowal.ski) · [VoltAgent's awesome-design-md](https://github.com/VoltAgent/awesome-design-md).

## How it works

When you ask Claude to build a dashboard, slide deck, diagram, or any HTML visual, the skill routes the request through a decision tree to the right template + 2–3 reference files (~1500 lines of context, never all 50+ files), enforces a 20-palette rotation rule, and runs a quality gate before delivering.

| Layer | What it controls |
|---|---|
| **1. Design parameters** | Three dials: `DESIGN_VARIANCE`, `MOTION_INTENSITY`, `VISUAL_DENSITY` (1–10 each) |
| **2. Philosophy** | Default-excellent, anti-AI-slop, production-grade, context-first |
| **3. Decision-tree router** | Maps task type to template + references — load only what you need |
| **4. Color palettes** | 20 curated palettes (light + dark variants), rotation rule prevents drift |
| **5. DESIGN.md protocol** | 9-section spec for any custom (non-template) project |
| **6. Interaction essentials** | 8 element states, custom easing curves, timing scales |
| **7. Quality gate** | Squint, swap, slop, themes, responsive, accessibility tests |

## Repo layout

```
~/.claude/skills/aaa-design/
├── SKILL.md                          ← entry point: 7-layer system + decision tree
├── README.md                         ← you are here
├── CHANGELOG.md                      ← weekly refresh agent appends here
├── templates/                        ← 8 production HTML implementations
├── references/                       ← 15 focused guides
│   └── brand-specs/                  ← 16 brand DESIGN.md files (refreshed weekly)
├── aesthetics/                       ← 4 full aesthetic sub-systems
└── scripts/
    ├── share.sh                      ← Vercel instant-deploy
    └── weekly-refresh.sh             ← Mondays: re-pulls specs, opens PR
```

## Templates

Production-ready HTML implementations. Pick one as your starting point.

| Template | When to use |
|---|---|
| `templates/dashboard.html` | Admin / analytics UI with charts and KPI cards |
| `templates/landing-page.html` | Marketing site, product launch, hero-first layouts |
| `templates/article-page.html` | Long-form blog post, documentation page |
| `templates/architecture.html` | System architecture diagrams (CSS Grid + flow arrows) |
| `templates/mermaid-flowchart.html` | Mermaid-based flowcharts and sequence diagrams |
| `templates/data-table.html` | Sortable, filterable HTML data tables with sticky header |
| `templates/hero-sections.html` | Reusable hero variants (centered, split, gradient, etc.) |
| `templates/slide-deck.html` | 100dvh-per-slide presentations (PPT replacement) |

## Aesthetics

Four full aesthetic sub-systems. Each defines color, typography, motion, and component conventions for that mood.

| Aesthetic | Mood | Use for |
|---|---|---|
| `aesthetics/soft-premium.md` | Refined, calm, expensive | Fintech, luxury SaaS, premium subscription products |
| `aesthetics/editorial-minimal.md` | Magazine-grade typography, generous whitespace | Long-form content, agency sites, designer portfolios |
| `aesthetics/brutalist-industrial.md` | Raw, structural, mono-driven | Dev tools, infra products, engineering blogs |
| `aesthetics/terminal-mono.md` | Cockpit feel, dense, ANSI energy | Trading dashboards, observability, CLI companions |

## Brand specs

16 real-world brand DESIGN.md files (sourced from VoltAgent's awesome-design-md via `npx getdesign add`). Each follows a 9-section structure: visual theme, color palette, typography, components, layout, depth, do's/don'ts, responsive, agent prompt guide.

| Category | Brands |
|---|---|
| **Fintech / Crypto** | [stripe](references/brand-specs/stripe) · [coinbase](references/brand-specs/coinbase) · [kraken](references/brand-specs/kraken) · [wise](references/brand-specs/wise) · [revolut](references/brand-specs/revolut) |
| **SaaS / Dev tools** | [linear-app](references/brand-specs/linear-app) · [vercel](references/brand-specs/vercel) · [notion](references/brand-specs/notion) · [cal](references/brand-specs/cal) · [raycast](references/brand-specs/raycast) |
| **AI platforms** | [claude](references/brand-specs/claude) · [cohere](references/brand-specs/cohere) · [opencode-ai](references/brand-specs/opencode-ai) |
| **Premium / Consumer** | [apple](references/brand-specs/apple) · [tesla](references/brand-specs/tesla) · [spotify](references/brand-specs/spotify) |

To add a new brand: in any temp dir run `npx -y getdesign@latest add <slug>`, then move the resulting `DESIGN.md` into `references/brand-specs/<slug>/`. Or open a slop-labeled GitHub issue and the Monday refresh agent handles it.

## References

15 focused guides, each under ~400 lines with a 3-line TL;DR header so you can decide in seconds whether to load it.

| File | What's in it |
|---|---|
| `anti-patterns.md` | Banned patterns: Inter, purple gradients, glowing cards, generic shadcn |
| `brand-references.md` | Cross-cutting patterns from 59 brands + the 9-section DESIGN.md protocol |
| `components.md` | All 8 element states for buttons, inputs, cards, modals, etc. |
| `css-components.md` | Production-grade CSS for the component primitives |
| `css-effects.md` | Glassmorphism, depth, conic gradients, mesh backgrounds |
| `css-layout.md` | Grid systems, asymmetric splits, masonry, container queries |
| `css-mermaid.md` | Mermaid theming rules to match page palette |
| `evaluation.md` | 5-dimension scoring rubric, 5 test personas, cognitive-load audit |
| `interactions.md` | Easing curves, stagger cascades, scroll-triggered, spring physics |
| `libraries.md` | Recommended libraries (Chart.js, Mermaid, GSAP, Framer Motion) |
| `presets.md` | 16 aesthetic systems with full CSS variables ready to paste |
| `responsive-nav.md` | Mobile nav patterns: hamburger, bottom-tab, command-palette |
| `slide-patterns.md` | Slide-deck layouts, transitions, typography scaling |
| `ux-writing.md` | Microcopy, empty states, error messages, button labels |
| `wow-patterns.md` | Signature effects: kinetic typography, shader-like CSS, hover orchestration |

## Quality gate

Run before delivering any output. If 2+ tests fail, redo.

| Test | Fail if |
|---|---|
| **Squint** | Can't perceive hierarchy at 30% blur |
| **Swap** | Replace styling with generic dark, nobody notices |
| **Slop** | 2+ patterns from `anti-patterns.md` |
| **Both themes** | Either light or dark looks broken |
| **Responsive** | Content clips or overflows at any width |
| **Accessibility** | Contrast < 4.5:1 body / < 3:1 large; no focus indicators |

Full audits use `references/evaluation.md` (5-dimension scoring × 5 test personas).

## Install

The skill is already installed locally — this repo is the canonical version-controlled mirror.

```bash
# fresh install on a new machine
cd ~/.claude/skills
git clone https://github.com/chadyazar/aaa-design-skill aaa-design
```

Verify Claude Code picks it up:

```bash
# in any project, ask Claude:
# "use aaa-design to build a dashboard"
# Claude should invoke Skill(aaa-design) automatically.
```

## Usage

In any Claude Code session:

```
> Build me a trading dashboard for crypto-agent. Use aaa-design.
```

Claude will:
1. Invoke `Skill(aaa-design)` and load `SKILL.md`
2. Route via the decision tree → `templates/dashboard.html` + `aesthetics/terminal-mono.md` + `references/css-effects.md`
3. Pick a palette (varying from prior outputs)
4. Generate the HTML
5. Run the quality gate

Override the dials inline: *"Use aaa-design with `DESIGN_VARIANCE=9`, `MOTION_INTENSITY=3`, terminal-mono aesthetic, Storm & Lightning palette."*

## Weekly refresh

Every Monday at 05:00 Asia/Dubai (01:00 UTC), a scheduled remote agent runs [`scripts/weekly-refresh.sh`](scripts/weekly-refresh.sh) which:

1. Re-pulls every brand spec via `npx -y getdesign@latest add <slug>` and captures upstream diffs
2. Scans VoltAgent's awesome-design-md for new brands not yet in `brand-specs/`, pulls them into `_pending/` for review
3. Ingests GitHub issues with label `slop` opened in the past 7 days
4. Flags any `references/*.md` over 400 lines for splitting
5. Appends a dated section to `CHANGELOG.md`
6. Branches `weekly/refresh-YYYY-MM-DD`, commits, pushes, opens a PR titled `weekly: aaa-design refresh YYYY-MM-DD`

Manual review before merge — the agent never auto-merges.

## Contributing

This is a personal skill, but the structure is general-purpose. To propose a pattern that should be added globally:

- **Anti-pattern** (something looks AI-generated): open an issue with label `slop`, include a screenshot or URL.
- **New aesthetic / template**: open a PR adding the file plus a row in the relevant table here.
- **Brand spec**: leave it to the weekly refresh — open an issue labeled `slop` mentioning the brand, the agent backfills it.

## License

MIT — see [`LICENSE`](LICENSE). Brand specs under `references/brand-specs/` are sourced from VoltAgent's [awesome-design-md](https://github.com/VoltAgent/awesome-design-md) and [getdesign.md](https://getdesign.md), both MIT.
