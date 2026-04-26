# Design Evaluation Framework
> 5-dimension audit: accessibility, performance, responsive, theming, anti-patterns. Score P0-P3.
> 5 test personas: Alex (power user), Jordan (first-timer), Sam (accessibility), Riley (stress tester), Casey (mobile).
> Cognitive load: ≤4 visible actions per screen. Squint test: hierarchy visible at 30% blur.

---

## 1. Five-Dimension Audit Framework

Score each dimension 0-4. Total out of 20. Severity tags: P0 (blocks launch) → P3 (polish).

### Dimension 1: Accessibility (P0)

The highest priority. Failures here block launch.

| Check | Pass criteria |
|-------|--------------|
| Color contrast — body text | ≥ 4.5:1 (WCAG AA) |
| Color contrast — large text (18px+ or 14px+ bold) | ≥ 3:1 |
| Color contrast — UI components/focus indicators | ≥ 3:1 |
| Focus indicators | Visible on ALL interactive elements. `:focus-visible` only — not `:focus` |
| Keyboard navigation | All functionality reachable via Tab / Shift+Tab / Arrow keys |
| Tab order | Logical, follows visual flow |
| Semantic HTML | `<button>` not `<div onclick>`, `<nav>`, `<main>`, `<header>`, proper heading hierarchy |
| Alt text | All meaningful images have descriptive alt. Decorative images have `alt=""` |
| Form labels | Every input has a `<label>`. `placeholder` is NOT a label |
| ARIA | Interactive elements have `role`, `aria-label`, `aria-expanded`, `aria-selected` where needed |
| Screen reader test | Tab through the page with VoiceOver/NVDA — does it make sense? |
| Reduced motion | `@media (prefers-reduced-motion: reduce)` disables/simplifies animations |

**Score 0-4:** 0 = Fails WCAG A, 1 = Major gaps (few ARIA, no keyboard), 2 = Partial (significant gaps), 3 = WCAG AA mostly met, 4 = WCAG AA fully met

```css
/* Required reduced-motion rule */
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```

### Dimension 2: Performance (P1)

Fix before v1 ships.

| Metric | Target |
|--------|--------|
| Lighthouse Performance score | ≥ 95 |
| Largest Contentful Paint (LCP) | < 2.5s |
| Cumulative Layout Shift (CLS) | < 0.1 |
| First Input Delay (FID) | < 100ms |
| Total Blocking Time (TBT) | < 200ms |

**Common failures to check:**
- Images not lazy-loaded (`loading="lazy"` missing)
- Images missing `width` + `height` attributes (causes layout shift)
- Animations using `width`, `height`, `top`, `left` instead of `transform` + `opacity`
- Layout thrashing (reading/writing DOM properties in loops)
- Missing `will-change` on elements that animate frequently
- Unoptimized images (no WebP/AVIF, no compression)
- Unused CSS/JS included in bundle

**Score 0-4:** 0 = Severe (layout thrash, unoptimized everything), 1 = Major (no lazy load, expensive animations), 2 = Partial, 3 = Good (minor improvements), 4 = Lighthouse 95+

### Dimension 3: Responsive Design (P1)

| Check | Pass criteria |
|-------|--------------|
| Minimum viewport | Works at 320px width |
| Maximum viewport | No stretched content at 2560px |
| Touch targets | All interactive elements ≥ 44×44px |
| No horizontal scroll | Content doesn't overflow viewport |
| Text reflow | Content restructures, doesn't just shrink |
| Font size | Minimum 16px body, 14px secondary text |
| Text scaling | Zoom to 200% — layout doesn't break |
| Images | Responsive (`max-width: 100%`) or `<picture>` with srcset |
| Navigation | Mobile nav pattern (hamburger or bottom bar) at ≤768px |

**Score 0-4:** 0 = Desktop only, 1 = Some breakpoints (many mobile failures), 2 = Works on mobile (rough edges), 3 = Good responsive (minor touch/overflow issues), 4 = Fluid across all viewports

### Dimension 4: Theming (P2)

Fix in v1.1.

| Check | Pass criteria |
|-------|--------------|
| Design tokens | All colors, spacing, typography via CSS custom properties |
| No hardcoded values | No `color: #3b82f6` outside the token definition |
| Dark mode | All surfaces, text, borders work in dark mode |
| System preference | `@media (prefers-color-scheme: dark)` respected |
| Theme switching | All values update instantly on theme change |
| Token naming | Semantic names (`--color-surface` not `--gray-100`) |

```css
/* Correct approach */
:root { --color-accent: oklch(55% 0.22 250); }
[data-theme="dark"] { --color-accent: oklch(65% 0.22 250); }

/* Wrong — hardcoded */
.button { background: #3b82f6; }
```

**Score 0-4:** 0 = All hardcoded, 1 = Minimal tokens, 2 = Tokens exist (inconsistently used), 3 = Good (minor hardcoded values), 4 = Full token system, dark mode works perfectly

### Dimension 5: Anti-Patterns / AI Slop (P2)

The "did an AI make this?" test. Check against all DON'T rules in frontend-design skill.

**Common AI fingerprints (each = -1 point):**
- Cyan-on-dark or purple-to-blue gradient aesthetic
- Gradient text on headings/metrics
- Glassmorphism cards used decoratively (blur + border glow)
- Hero metric layout (big number, small label, gradient accent)
- 3-equal-column feature card grid
- Lucide/Feather icons used exclusively
- Dark mode with glowing neon accents
- "Rounded rectangle with colored border on one side" card style
- Inter or Roboto as the only font
- Generic stock "diverse team" photos
- AI copywriting cliches (Elevate, Seamless, Unleash, Game-changer)

**Score 0-4:** 0 = 5+ AI tells (obviously AI-generated), 1 = 3-4 tells, 2 = 1-2 noticeable tells, 3 = Mostly clean, 4 = No AI tells — distinctive, intentional design

### Audit Health Score Table

| # | Dimension | Score | Key Finding |
|---|-----------|-------|-------------|
| 1 | Accessibility | /4 | |
| 2 | Performance | /4 | |
| 3 | Responsive Design | /4 | |
| 4 | Theming | /4 | |
| 5 | Anti-Patterns | /4 | |
| **Total** | | **/20** | |

**Rating bands:** 18-20 Excellent (minor polish) | 14-17 Good (address weak dimensions) | 10-13 Acceptable (significant work needed) | 6-9 Poor (major overhaul) | 0-5 Critical (fundamental issues)

### Severity Tags

| Tag | Meaning | Action |
|-----|---------|--------|
| **P0** | Blocks launch — user cannot complete core task | Fix immediately |
| **P1** | Significant difficulty or WCAG AA violation | Fix before v1 ships |
| **P2** | Annoyance, workaround exists | Fix in v1.1 |
| **P3** | Nice-to-fix, minimal user impact | Fix if time permits |

---

## 2. Five Persona Archetypes

Test EVERY design against these 5 personas. Pick the 2-3 most relevant for the current interface type, then walk through the primary user flow for each.

### Alex — Power User

**Context:** Uses the product daily, knows it deeply, wants efficiency above all else.

**Test questions:**
- Can they accomplish frequent tasks without touching the mouse?
- Are there keyboard shortcuts for primary actions?
- Is there bulk selection / multi-action capability?
- Does the interface show enough information density? (Not everything needs progressive disclosure for power users)
- Can they customize or configure the interface?
- Are advanced filters, sorting, and search available?
- Does the UI get out of their way, or constantly interrupt with confirmations and tooltips?

**Red flags:**
- Forced modal onboarding they can't skip
- Required click-through confirmations for common actions
- No keyboard shortcuts
- Information hidden behind hover states they'll never use (they're keyboard-first)
- Can't bulk-select or perform batch actions

### Jordan — First-Timer

**Context:** First time using this product or this category. No prior mental model. Easily lost.

**Test questions:**
- Can they identify the primary action within 3 seconds?
- Is the first step obvious without reading documentation?
- Are errors forgiving? Can they undo mistakes?
- Is jargon explained or avoided?
- Are there sample templates or example data to start from?
- Is there a clear progression (what's step 1, step 2)?
- Do they know where they are and how to go back?

**Red flags:**
- Icon-only navigation without labels
- Technical jargon in error messages ("404 Not Found", "HTTP 422")
- No empty state guidance (blank screen with no next action)
- Dead-end flows (no back button, no cancel)
- Overwhelming options on first use (progressive disclosure needed)

### Sam — Accessibility User

**Context:** Uses screen reader (VoiceOver/NVDA), keyboard-only navigation, or needs high contrast. Could also represent users with motor disabilities or cognitive impairments.

**Test flow:**
1. Tab through the page — does the order make sense?
2. Are all interactive elements reachable and labeled?
3. Activate a form — do error messages get announced?
4. Open a modal — is focus trapped correctly? Can they close with Escape?
5. Check with Windows High Contrast mode
6. Zoom to 200% — does the layout survive?

**Red flags:**
- `div` or `span` used as buttons (`<div onclick>`)
- Missing `aria-label` on icon buttons
- Focus not managed when modal opens (focus stays behind the modal)
- Color as the only indicator of state (red text = error, but no icon or message)
- Animations don't respect `prefers-reduced-motion`
- Skip-to-content link missing

### Riley — Stress Tester

**Context:** Uses the product in edge-case conditions: 10,000 records, 500-character names, slow 3G connection, maximum limits hit, errors triggered.

**Test scenarios:**
- Load a list with 1,000+ items — does it paginate, virtualize, or crash?
- Enter a name with 200 characters — does the UI handle it or overflow?
- Submit a form twice quickly — is double-submission prevented?
- Disconnect internet mid-operation — what error state is shown?
- Force an API 500 error — is there a recovery path?
- Upload a file that's too large — is the error message specific?
- Use emoji in text fields — does the UI break?

**Red flags:**
- Text overflow without truncation or wrapping
- No loading/disabled state on submit buttons (double-submit possible)
- Generic "Something went wrong" for all API errors
- No offline error state
- List renders all 10,000 items at once (performance crash)
- File size error just says "Upload failed"

### Casey — Distracted Mobile User

**Context:** One-handed use, on the go, potentially in bright sunlight. Gets interrupted mid-task (phone call, notification). Often on a slow connection.

**Test scenarios:**
- Complete the primary flow one-handed on a 375px iPhone
- Trigger a phone call mid-form — does state persist on return?
- Check in bright sunlight (high contrast mode)
- Attempt to tap small UI elements with a "fat finger" (44px target minimum)
- All hover-only interactions (things that only appear on hover are invisible on touch)
- Primary actions: are they in the thumb zone (bottom half of screen)?

**Red flags:**
- Touch targets smaller than 44×44px
- Critical actions only available on hover
- Form loses data after a phone call interrupts the session
- Primary CTA is at the top of the screen (hard to reach one-handed)
- Font size below 16px on mobile (triggers iOS auto-zoom on inputs)
- No `autocomplete` attributes on common fields (name, email, address)

---

## 3. Cognitive Load Checklist

**Working memory limit: ≤4 visible actions per screen.** Beyond 4, users start making errors and feel overwhelmed.

### 8-Item Cognitive Load Assessment

Score: 0-1 failures = Low (good) | 2-3 = Moderate (investigate) | 4+ = Critical (redesign)

| # | Question | Pass |
|---|----------|------|
| 1 | Can user identify the primary action within 3 seconds? | Yes |
| 2 | Are related items visually grouped? | Yes |
| 3 | Is there a clear visual hierarchy (what to look at first, second)? | Yes |
| 4 | Are defaults sensible? (User can proceed without changing anything) | Yes |
| 5 | Is progressive disclosure used? (Advanced options hidden until needed) | Yes |
| 6 | Are there fewer than 5 visible choices at any decision point? | Yes |
| 7 | Does the layout follow F-pattern or Z-pattern reading flow? | Yes |
| 8 | Is there a clear "way out" (cancel, back, escape)? | Yes |

### Three Types of Cognitive Load

| Type | Source | Design response |
|------|--------|----------------|
| **Intrinsic** | Inherent complexity of the task (calculating taxes is complex) | Acknowledge it — don't pretend it's simple |
| **Extraneous** | Bad design adding unnecessary cognitive effort | Reduce aggressively — this is always fixable |
| **Germane** | Productive learning that builds mental models | Enable this — good onboarding adds germane load |

Design goal: minimize extraneous, acknowledge intrinsic, enable germane.

---

## 4. Redesign Audit (10 Categories)

Score each 1-5. Action required for anything scored ≤3.

| Category | Check | Score |
|----------|-------|-------|
| **Typography** | Font choice, hierarchy, weights, line length, letter-spacing | /5 |
| **Colors** | Palette cohesion, accent, contrast, dark mode, shadows | /5 |
| **Surfaces** | Cards only where needed, depth tiers, texture, gradients | /5 |
| **Layout** | Grid, whitespace, symmetry/asymmetry, max-width, rhythm | /5 |
| **Interactivity** | Hover/active/focus states, transitions, animations | /5 |
| **Content** | Real copy (no lorem ipsum), specific data, no AI cliches | /5 |
| **Components** | Cards, buttons, modals, forms — generic or distinctive? | /5 |
| **Iconography** | Icon set, consistency, stroke width, favicon | /5 |
| **Code Quality** | Semantic HTML, design tokens, no inline styles, alt text | /5 |
| **Completeness** | Loading/empty/error states, legal links, 404, form validation | /5 |

**Fix priority order (maximum impact, minimum risk):**
1. Font swap — biggest instant improvement, lowest risk
2. Color palette cleanup — remove clashing or oversaturated colors
3. Hover and active states — makes the interface feel alive
4. Layout and spacing — proper grid, max-width, consistent padding
5. Replace generic components — swap cliche patterns for modern alternatives
6. Add loading, empty, and error states — makes it feel finished
7. Polish typography scale and spacing — the premium final touch

---

## 5. Quick Tests

Run these before signing off on any design.

### Squint Test
Blur the page to 30% opacity (or squint). Can you still see the visual hierarchy? If everything blurs into an even gray mush, the contrast between heading levels, sections, and CTAs is too weak. Fix: increase size difference, weight difference, or spatial separation between hierarchy levels.

### 5-Second Test
Show the design to someone for 5 seconds, then cover it. Ask: "What does this page do?" If they can't answer in one sentence, the value proposition or primary purpose isn't clear enough. Fix: strengthen the heading, increase visual emphasis on the primary CTA.

### Thumb Zone Test (Mobile)
On a 375px screen, mark three zones:
- Green (easy): bottom 40% of screen
- Yellow (stretch): middle 30%
- Red (difficult): top 30%

Primary CTAs should be green. Navigation that requires both hands should be in settings, not the main flow.

### No-Color Test
Convert to grayscale. Does information still make sense? If an error state only works because it's red, if a status badge only works because it's green, if a CTA only stands out because it's blue — those are accessibility failures. Information must survive without color.

### Keyboard-Only Test
Unplug or disable the mouse. Try to complete the primary user flow using only Tab, Shift+Tab, Enter, Space, and Arrow keys. Every step of the flow must be reachable. If you get stuck, that's a P0 accessibility issue.

---

## 6. Nielsen's 10 Heuristics Scoring

For full design critiques. Score each 0-4.

| # | Heuristic | Score | Key Issue |
|---|-----------|-------|-----------|
| 1 | Visibility of system status | /4 | Does the UI always inform users of what's happening? |
| 2 | Match system / real world | /4 | Does it use language and concepts from the user's world? |
| 3 | User control and freedom | /4 | Easy undo/redo? Can users escape unwanted states? |
| 4 | Consistency and standards | /4 | Same terms, icons, patterns throughout? |
| 5 | Error prevention | /4 | Does design prevent problems before they occur? |
| 6 | Recognition over recall | /4 | Options visible — users don't need to remember? |
| 7 | Flexibility and efficiency | /4 | Shortcuts for expert users? |
| 8 | Aesthetic and minimalist design | /4 | No irrelevant information competing for attention? |
| 9 | Error recovery | /4 | Error messages helpful and suggest fix? |
| 10 | Help and documentation | /4 | Easy to find help? Focused on user's task? |
| **Total** | | **/40** | |

**Rating bands:** 36-40 Excellent | 28-35 Good | 20-27 Acceptable | 12-19 Poor | 0-11 Critical

A 4 means genuinely excellent. Most real interfaces score 20-32. Be honest.
