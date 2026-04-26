# UX Writing Rules
> Error formula: what happened + why + how to fix. "Email needs an @ symbol" not "Invalid input".
> Button labels specify outcomes: "Save changes" not "OK". "Delete account" not "Continue".
> Empty states are teaching moments: illustration + heading + description + action CTA.

---

## 1. Error Messages

**Formula: [What happened] + [Why] + [How to fix]**

Every error message must answer all three. If you can only answer one, answer "how to fix."

| Bad | Good |
|-----|------|
| "Invalid input" | "Email needs an @ symbol. Try: name@example.com" |
| "Error 422" | "Password must be 8+ characters. Add a number or symbol to make it stronger." |
| "Something went wrong" | "Connection lost — your changes are saved locally. We'll sync when you're back online." |
| "Error 403: Forbidden" | "You don't have permission to view this. Contact your admin for access." |
| "File upload failed" | "That file is too large (max 10MB). Try compressing it or upload a smaller version." |
| "Username unavailable" | "That username is taken. Try 'sarah.chen' or 'sarahc92'." |
| "Session expired" | "You've been signed out after 30 minutes of inactivity. Sign back in to continue." |

**Tone rules:**
- Never blame the user ("you entered an invalid email" → "that email address isn't valid")
- No exclamation marks in errors — it feels sarcastic
- No "Oops!" — be direct, not cute
- No passive voice ("an error has occurred" → "we couldn't save your changes")
- Include examples when format matters (email, phone, date)
- Link to support or help docs for errors the user can't fix themselves

---

## 2. Button Labels

**Specify the outcome, not the action. Label = what happens when you click.**

| Bad | Good |
|-----|------|
| "OK" | "Got it" / "Sounds good" / "Dismiss" |
| "Submit" | "Create account" / "Send message" / "Place order" |
| "Continue" | "Go to billing" / "Start import" / "Open project" |
| "Yes" / "No" | "Delete permanently" / "Keep it" |
| "Click here" | "Download the guide" / "View all plans" |
| "Save" (ambiguous) | "Save changes" / "Save draft" / "Save and publish" |
| "Cancel" (for destructive dialogs) | "Keep project" / "Don't delete" |

**Hierarchy rules:**
- Primary action: most important, one per screen
- Secondary action: ghost or outlined button
- Tertiary: text link — no button chrome at all
- Destructive actions (delete, remove, revoke): use `.btn-destructive` variant
- Don't make every button primary — hierarchy communicates importance

**Pairing rules (in confirmation dialogs):**
- The cancel/dismiss should say what stays true: "Keep project", "Don't delete"
- The confirm should name the specific action: "Delete project", "Remove member"
- Never just "Yes" / "No" — too abstract when stakes are high

---

## 3. Empty States

**Empty states are teaching moments, not dead ends. Pattern: illustration → heading → description → CTA.**

Structure every empty state with these 4 elements:

1. **Visual** — icon, illustration, or relevant image (never just blank space)
2. **Heading** — what will appear here ("No projects yet" not "Empty")
3. **Description** — why it matters and how to get started
4. **Action** — primary CTA button + optional secondary link

**Examples:**

```
No projects yet
Projects help you organize your work and collaborate with your team.
[Create your first project]  or  [Start from a template]
```

```
Your inbox is empty
Messages from your team will appear here.
[Invite teammates]
```

```
No results for "dark mode"
Try different keywords, or browse all documentation topics.
[Browse all docs]  or  [Clear search]
```

**5 types of empty states (each needs different copy):**

| Type | Copy approach |
|------|--------------|
| First use | Emphasize value, provide template, reduce friction |
| User cleared | Light touch — they know what to do, just acknowledge |
| No search results | Suggest alternatives, offer to clear filters |
| No permissions | Explain why access is restricted, how to get it |
| Error/failed to load | Explain what failed, provide retry action |

**Rules:**
- Never just "No data" or a white blank
- Empty state is NOT a loading state (different components)
- If the user has never used the feature, emphasize the value
- If the user emptied it intentionally, keep it lightweight
- Always provide at least one action

---

## 4. Microcopy

**Every word in the UI is copy. Make it earn its place.**

### Helper Text (below inputs)
- Purpose: explain what's expected, not what went wrong
- Show it before the user has made an error (proactive, not reactive)
- Examples: "Letters and numbers only" / "This will be public on your profile" / "You can change this later"
- NOT "This field is required" — that's an error message, not help

### Placeholder Text
- Placeholder is NOT a label — it disappears when the user types
- Use it to show format examples: "name@company.com" / "+1 (555) 000-0000"
- Never put required information only in placeholder
- Keep placeholders shorter than real expected input

### Tooltip Copy
- Explain WHY, not WHAT — the user can see the button label
- Bad: "This is the settings button" — they can see it says "Settings"
- Good: "Changes here apply to all team members" / "Requires admin permissions"
- Max ~10 words — if more is needed, link to documentation

### Loading States
- Set expectations: "Analyzing your data... usually takes 30-60 seconds"
- Explain what's happening: "Processing payment..." not just "Loading..."
- Offer escape for long operations: "Cancel" or "Notify me when done"

### Success Messages
- Confirm specifically what happened: "Profile photo updated" not just "Saved"
- Include next step when relevant: "Invitation sent — they'll get an email shortly"
- Match the emotional weight: big wins get celebration, small saves get a quiet tick

### Confirmation Dialogs
- State the specific thing being affected: "Delete 'Alpha Launch'?" not "Delete item?"
- Explain irreversibility for destructive actions: "This can't be undone"
- Button labels name the specific action: "Delete project" not "Confirm"

---

## 5. Voice vs Tone

**Voice is your personality — constant. Tone adapts to context.**

Define your brand voice in 3 adjectives. Examples:
- Notion: calm, empowering, minimal
- Linear: precise, direct, craft-focused
- Vercel: fast, developer-first, confident

**Tone adapts to context:**

| Context | Tone | Example |
|---------|------|---------|
| Success / celebration | Warm, energetic | "You're all set! Your site is live." |
| Error / failure | Calm, helpful | "We couldn't save that. Try again." |
| Empty state | Encouraging, action-oriented | "No projects yet — start something." |
| Onboarding | Welcoming, concise | "Let's set up your workspace." |
| Warning | Direct, not alarmist | "This will affect all team members." |
| Destructive action | Serious, clear | "This can't be undone." |
| Loading | Reassuring | "Almost there..." |
| Billing | Professional, transparent | "Your card ending in 4242 will be charged $29." |

---

## 6. Consistency Rules

**One term per concept. Inconsistency breaks mental models.**

Pick one and use it everywhere:
- Delete / Remove / Clear → pick one (usually "Delete" for permanent, "Remove" for reversible)
- Settings / Preferences / Configuration → pick one
- Team / Organization / Workspace → pick one
- Invite / Add / Share → pick one per action type

**Build a terminology glossary.** Even 10 terms is enough to prevent drift.

**Same action = same label everywhere.** If "Save" means "write to disk" in one place, it means that everywhere. Don't use "Save" and "Update" interchangeably.

**Heading hierarchy:**
- Page title: what the page IS
- Section heading: what the section DOES
- Card title: what the item IS
- Never duplicate — headings should add info, not restate the parent

---

## 7. Translation Planning

Design for +30% text expansion — German is typically 30-40% longer than English.

**Rules for translation-safe copy:**
- Avoid text in images — can't be translated without re-exporting
- Never concatenate strings: `"Save " + itemName` breaks in many languages
- Use ICU MessageFormat for plurals: `{count, plural, one {# item} other {# items}}`
- Leave space for expansion in button sizing — use `padding` not `width`
- Date/time: use the `Intl` API, never hardcode formats

```javascript
// Safe: locale-aware formatting
new Intl.DateTimeFormat('en-US').format(date); // 1/15/2024
new Intl.DateTimeFormat('de-DE').format(date); // 15.1.2024

new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(1234.56);
// → $1,234.56

// Safe: ICU plural
t('file_count', { count: 3 }); // handles "1 file" vs "3 files"
```

- Avoid idioms, metaphors, or culturally-specific humour
- LTR/RTL: use CSS logical properties (`margin-inline-start` not `margin-left`)

---

## 8. Content Anti-Patterns

Things that always make copy worse:

| Anti-pattern | Why it's bad | Fix |
|---|---|---|
| "Click here" | Non-descriptive, inaccessible for screen readers | Name the action: "Download the report" |
| "Please" on every label | Wastes space, adds no meaning | Use sparingly if at all |
| Passive voice in instructions | Unclear who does what | Active: "Upload your file" not "A file should be uploaded" |
| Exclamation marks in errors | Feels sarcastic or panicked | Drop them entirely from error copy |
| "!" everywhere in success | Loses impact when overused | Save for genuine milestones |
| Jargon users won't know | Creates confusion, breeds support tickets | Plain language first, tooltip explanation if needed |
| Hedging language | "This might possibly..." | Be direct and confident |
| AI writing tells | "Elevate", "Seamless", "Unleash", "Next-Gen", "Game-changer", "Delve", "Tapestry", "In the world of..." | Write specific, concrete copy |
| Lorem ipsum in designs | Hides copy problems until too late | Write real draft copy from day one |
| Title Case On Every Heading | Looks corporate, harder to read | Sentence case instead |
| Generic metric labels | "47%" (of what?) | Always include context: "47% faster loading" |
| Modal for everything | Interrupts flow for simple actions | Inline editing, expandable sections |
| Redundant intros | "Welcome to the settings page. This is where you can configure settings." | Start with the most useful thing |

---

## Quick Reference Checklist

Before shipping any copy, run through this:

- [ ] Error message: what + why + how to fix?
- [ ] Button label: names the specific outcome?
- [ ] Empty state: visual + heading + description + CTA?
- [ ] No "Click here", "Submit", "OK", "Yes/No"?
- [ ] Consistent terms — same word for same concept everywhere?
- [ ] Placeholders are examples, not labels?
- [ ] Tooltips explain WHY, not WHAT?
- [ ] No passive voice in action instructions?
- [ ] No AI-writing cliches?
- [ ] Does it read like a human wrote it for this specific product?
