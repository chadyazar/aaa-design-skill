# aaa-design

A Claude Code skill for producing AAA-quality HTML pages, dashboards, slide decks, and diagrams.

Installs as a global skill at `~/.claude/skills/aaa-design/` and is invoked via the `Skill(aaa-design)` tool. See `SKILL.md` for the full decision-tree router.

## What's inside

| Path | Purpose |
|---|---|
| `SKILL.md` | Entry point — 7-layer system, color-palette table, decision-tree router |
| `templates/` | 8 production-ready HTML implementations (dashboard, landing, slide-deck, etc.) |
| `references/` | 15 focused guides (anti-patterns, presets, css-effects, slide-patterns, etc.) |
| `references/brand-specs/` | Curated brand DESIGN.md library, sourced from VoltAgent's awesome-design-md |
| `aesthetics/` | 4 full aesthetic sub-systems (soft-premium, editorial, brutalist, terminal) |
| `scripts/share.sh` | Vercel instant-deploy for a single HTML file |
| `scripts/weekly-refresh.sh` | Runs by the scheduled agent each Monday — re-pulls specs, audits anti-patterns, opens PR |

## Brand specs (16 installed)

Routed by mood and use case. Use these when a project's brief matches a brand's aesthetic.

| Category | Brands |
|---|---|
| **Fintech / Crypto** | Stripe, Coinbase, Kraken, Wise, Revolut |
| **SaaS / Dev tools** | Linear, Vercel, Notion, Cal.com, Raycast |
| **AI platforms** | Claude, Cohere, OpenCode AI |
| **Premium / Consumer** | Apple, Tesla, Spotify |

Each spec follows the same 9-section structure (Visual Theme → Color Palette → Typography → Components → Layout → Depth & Elevation → Do's and Don'ts → Responsive → Agent Prompt Guide). To add a new brand: `npx -y getdesign@latest add <slug>` in any temp dir, then move the resulting `DESIGN.md` into `references/brand-specs/<slug>/`.

## Weekly enhancement

The `scripts/weekly-refresh.sh` script runs automatically every Monday 05:00 UTC via a scheduled remote agent and:
1. Re-pulls every installed brand spec, captures upstream diffs
2. Detects new brands in awesome-design-md not yet in `brand-specs/`, pulls them into `_pending/` for review
3. Ingests GitHub issues with label `slop` opened during the week and bundles them into the anti-patterns audit
4. Flags any `references/*.md` over 400 lines for splitting
5. Appends a dated section to `CHANGELOG.md`
6. Opens a PR titled `weekly: aaa-design refresh YYYY-MM-DD` — manual review before merge

## License

MIT — see `LICENSE`. Brand specs sourced from VoltAgent's [awesome-design-md](https://github.com/VoltAgent/awesome-design-md) under MIT.

## Origins

Consolidates four design lineages: taste-skill, impeccable, Emil Kowalski, and awesome-design-md.
