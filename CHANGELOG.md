# Changelog

All notable changes to the aaa-design skill. Maintained by the weekly refresh agent and human edits.

Format: `## YYYY-MM-DD` headers, oldest at bottom. Sections per change category.

## 2026-04-26

**Initial install + brand-spec library bootstrap.**

### Added
- Skill installed globally at `~/.claude/skills/aaa-design/` (16 files: SKILL.md + 4 aesthetics + 15 references + 8 templates + 1 script).
- `references/brand-specs/` library — 16 brand DESIGN.md specs sourced from VoltAgent's awesome-design-md via `npx getdesign add`.
  - Fintech / Crypto: stripe, coinbase, kraken, wise, revolut
  - SaaS / Dev tools: linear-app, vercel, notion, cal, raycast
  - AI platforms: claude, cohere, opencode-ai
  - Premium / Consumer: apple, tesla, spotify
- `LICENSE` (MIT, attributing VoltAgent + getdesign.md as upstream).
- `README.md` describing repo structure, brand-spec library, and weekly refresh workflow.
- `scripts/weekly-refresh.sh` — automation entry point for the scheduled agent.
- `.gitignore` for node_modules, OS metadata, and pull artifacts.

### Memory
- T1 anchor saved at `memory/feedback_aaa_design_for_dashboards_and_decks.md` so future sessions auto-route dashboard/PPT/diagram work through this skill.

### Schedule
- Weekly refresh routine created (Monday 05:00 UTC) — runs `scripts/weekly-refresh.sh` and opens PR.
