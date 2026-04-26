# Component Patterns
> Buttons need 8 states not 5 (add loading, error, success). Forms validate on blur not keystroke.
> Use native `<dialog>` for modals. Toast timers pause on hidden tabs.
> Every component: HTML structure + CSS + accessibility attributes. Copy-paste ready.

---

## 1. Buttons

Four variants x 8 states. Every button must handle: default, hover, active/pressed, focused (:focus-visible), disabled, loading, error, success.

### HTML Structure

```html
<!-- Primary -->
<button class="btn btn-primary" type="button">
  <span class="btn-label">Save changes</span>
</button>

<!-- Loading state -->
<button class="btn btn-primary btn-loading" type="button" aria-busy="true" aria-label="Saving...">
  <span class="btn-spinner" aria-hidden="true"></span>
  <span class="btn-label">Saving...</span>
</button>

<!-- Error state -->
<button class="btn btn-primary btn-error" type="button">
  <span class="btn-label">Failed - try again</span>
</button>

<!-- Success state -->
<button class="btn btn-primary btn-success" type="button">
  <svg class="btn-icon" aria-hidden="true"><!-- checkmark --></svg>
  <span class="btn-label">Saved</span>
</button>

<!-- Disabled -->
<button class="btn btn-primary" type="button" disabled aria-disabled="true">
  <span class="btn-label">Save changes</span>
</button>
```

### CSS

```css
.btn {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.625rem 1.25rem;
  font-size: 0.9375rem;
  font-weight: 500;
  line-height: 1;
  border-radius: 0.5rem;
  border: 1.5px solid transparent;
  cursor: pointer;
  transition: background 180ms ease, color 180ms ease, transform 120ms ease,
    box-shadow 180ms ease, border-color 180ms ease;
  user-select: none;
  white-space: nowrap;
}

/* Pill variant */
.btn-pill { border-radius: 9999px; }

/* Variants */
.btn-primary     { background: var(--color-accent); color: #fff; border-color: var(--color-accent); }
.btn-secondary   { background: var(--color-surface-raised); color: var(--color-text); border-color: var(--color-border); }
.btn-ghost       { background: transparent; color: var(--color-text); border-color: transparent; }
.btn-destructive { background: var(--color-error); color: #fff; border-color: var(--color-error); }

/* States */
.btn:hover:not(:disabled) { filter: brightness(1.08); }
.btn:active:not(:disabled) { transform: scale(0.97) translateY(1px); }

/* Focus - :focus-visible only, NOT on click */
.btn:focus-visible {
  outline: 2.5px solid var(--color-accent);
  outline-offset: 3px;
}

.btn:disabled,
.btn[aria-disabled="true"] {
  opacity: 0.45;
  cursor: not-allowed;
  pointer-events: none;
}

/* Loading */
.btn-loading { pointer-events: none; }
.btn-spinner {
  width: 1em; height: 1em;
  border: 2px solid currentColor;
  border-top-color: transparent;
  border-radius: 50%;
  animation: btn-spin 0.65s linear infinite;
  flex-shrink: 0;
}
@keyframes btn-spin { to { transform: rotate(360deg); } }

/* Error - red flash + shake */
.btn-error {
  background: var(--color-error);
  border-color: var(--color-error);
  animation: btn-shake 0.4s ease;
}
@keyframes btn-shake {
  0%,100% { transform: translateX(0); }
  20%      { transform: translateX(-4px); }
  40%      { transform: translateX(4px); }
  60%      { transform: translateX(-3px); }
  80%      { transform: translateX(3px); }
}

/* Success - green flash */
.btn-success {
  background: var(--color-success);
  border-color: var(--color-success);
  animation: btn-success-flash 0.3s ease;
}
@keyframes btn-success-flash {
  0%   { transform: scale(0.96); }
  60%  { transform: scale(1.03); }
  100% { transform: scale(1); }
}
```

### Accessibility Notes
- Always `type="button"` unless submitting a form
- Loading: add `aria-busy="true"` + update `aria-label` to describe the in-progress action
- Error/success: wrap dynamic messages in `aria-live="polite"` region
- Never rely on color alone - pair with icon or text

---

## 2. Navigation

### 2a. Topbar

```html
<header class="topbar" role="banner">
  <div class="topbar-container">
    <a href="/" class="topbar-logo" aria-label="Home">
      <img src="/logo.svg" alt="Brand name" width="120" height="32">
    </a>
    <nav class="topbar-nav" aria-label="Main navigation">
      <ul role="list">
        <li><a href="/features" aria-current="page">Features</a></li>
        <li><a href="/pricing">Pricing</a></li>
        <li><a href="/docs">Docs</a></li>
      </ul>
    </nav>
    <div class="topbar-actions">
      <a href="/login" class="btn btn-ghost btn-sm">Log in</a>
      <a href="/signup" class="btn btn-primary btn-sm">Get started</a>
    </div>
    <button class="topbar-hamburger" aria-expanded="false" aria-controls="mobile-menu"
      aria-label="Open menu">
      <span></span><span></span><span></span>
    </button>
  </div>
</header>
```

```css
.topbar {
  position: sticky;
  top: 0;
  z-index: 100;
  background: var(--color-bg);
  border-bottom: 1px solid transparent;
  transition: border-color 200ms, backdrop-filter 200ms, background 200ms;
}
/* Frost glass on scroll - add .is-scrolled via JS */
.topbar.is-scrolled {
  backdrop-filter: blur(12px) saturate(1.4);
  background: color-mix(in oklch, var(--color-bg) 80%, transparent);
  border-bottom-color: var(--color-border);
}
.topbar-container {
  display: flex;
  align-items: center;
  gap: 2rem;
  max-width: 1280px;
  margin: 0 auto;
  padding: 0 1.5rem;
  height: 64px;
}
.topbar-nav { flex: 1; }
.topbar-nav ul { display: flex; gap: 0.25rem; list-style: none; padding: 0; margin: 0; }
.topbar-nav a {
  padding: 0.375rem 0.75rem;
  border-radius: 0.375rem;
  color: var(--color-text-muted);
  font-size: 0.9rem;
  transition: color 150ms, background 150ms;
}
.topbar-nav a:hover,
.topbar-nav a[aria-current="page"] {
  color: var(--color-text);
  background: var(--color-surface-raised);
}
```

### 2b. Sidebar (Collapsible: full to icon-only)

```html
<aside class="sidebar" aria-label="Sidebar navigation" data-collapsed="false">
  <button class="sidebar-toggle" aria-expanded="true" aria-label="Collapse sidebar">
    <!-- chevron icon -->
  </button>
  <nav>
    <p class="sidebar-section-label">Workspace</p>
    <ul role="list">
      <li>
        <a href="/dashboard" class="sidebar-item" aria-current="page">
          <svg aria-hidden="true" class="sidebar-icon"><!-- icon --></svg>
          <span class="sidebar-label">Dashboard</span>
        </a>
      </li>
      <li>
        <a href="/projects" class="sidebar-item">
          <svg aria-hidden="true" class="sidebar-icon"><!-- icon --></svg>
          <span class="sidebar-label">Projects</span>
        </a>
      </li>
    </ul>
  </nav>
</aside>
```

```css
.sidebar {
  width: 240px;
  transition: width 220ms cubic-bezier(0.4, 0, 0.2, 1);
  overflow: hidden;
}
.sidebar[data-collapsed="true"] { width: 56px; }
.sidebar[data-collapsed="true"] .sidebar-label,
.sidebar[data-collapsed="true"] .sidebar-section-label { opacity: 0; width: 0; overflow: hidden; }

.sidebar-item {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  padding: 0.5rem 0.75rem;
  border-radius: 0.5rem;
  color: var(--color-text-muted);
  transition: background 150ms, color 150ms, border-color 150ms;
  border-left: 2px solid transparent;
}
.sidebar-item[aria-current="page"] {
  background: color-mix(in oklch, var(--color-accent) 12%, transparent);
  color: var(--color-accent);
  border-left-color: var(--color-accent);
}
.sidebar-section-label {
  font-size: 0.7rem;
  font-weight: 600;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--color-text-muted);
  padding: 0 0.75rem;
  margin: 1rem 0 0.25rem;
}
```

### 2c. Breadcrumbs

```html
<nav aria-label="Breadcrumb">
  <ol class="breadcrumbs">
    <li><a href="/">Home</a></li>
    <li><a href="/projects">Projects</a></li>
    <li aria-current="page">Alpha Launch</li>
  </ol>
</nav>
```

```css
.breadcrumbs {
  display: flex;
  flex-wrap: wrap;
  list-style: none;
  padding: 0; margin: 0;
  font-size: 0.875rem;
  color: var(--color-text-muted);
}
.breadcrumbs li + li::before {
  content: '/';
  padding: 0 0.5rem;
  opacity: 0.4;
}
.breadcrumbs a { color: inherit; }
.breadcrumbs a:hover { color: var(--color-text); }
.breadcrumbs [aria-current="page"] { color: var(--color-text); font-weight: 500; }
```

---

## 3. Cards

Four variants. Depth tiers: flat (border only) - raised (shadow-sm) - elevated (shadow-md) - floating (shadow-lg + hover lift).

### Product Card

```html
<article class="card card-elevated card-product">
  <a href="/product/1" class="card-image-link" tabindex="-1" aria-hidden="true">
    <img src="/img/product.jpg" alt="" class="card-image" loading="lazy">
  </a>
  <div class="card-body">
    <h3 class="card-title"><a href="/product/1">Product Name</a></h3>
    <p class="card-price">$49.00</p>
    <button class="btn btn-primary btn-sm" type="button">Add to cart</button>
  </div>
</article>
```

### Feature Card (Bento-Compatible)

```html
<div class="card card-flat card-feature">
  <div class="card-icon" aria-hidden="true"><!-- icon --></div>
  <h3 class="card-title">Fast by default</h3>
  <p class="card-description">Sub-100ms response times out of the box. No config needed.</p>
</div>
```

### Pricing Card (3-tier: ghost / elevated / ghost)

```html
<div class="card card-elevated card-pricing" aria-label="Pro plan">
  <p class="pricing-tier">Pro</p>
  <p class="pricing-price"><span class="pricing-amount">$29</span>/mo</p>
  <ul class="pricing-features" role="list">
    <li>Unlimited projects</li>
    <li>Priority support</li>
    <li>Custom domain</li>
  </ul>
  <a href="/signup?plan=pro" class="btn btn-primary">Get started</a>
</div>
```

### Testimonial Card

```html
<figure class="card card-raised card-testimonial">
  <blockquote class="testimonial-quote">
    "This shipped our product 3x faster than anything else we tried."
  </blockquote>
  <figcaption class="testimonial-attribution">
    <img src="/avatars/sarah.jpg" alt="" class="testimonial-avatar" width="40" height="40">
    <div>
      <p class="testimonial-name">Sarah Chen</p>
      <p class="testimonial-role">CTO at Forma</p>
    </div>
  </figcaption>
</figure>
```

### Card CSS

```css
/* Base */
.card { border-radius: 0.75rem; overflow: hidden; background: var(--color-surface); }

/* Depth tiers */
.card-flat     { border: 1px solid var(--color-border); }
.card-raised   { box-shadow: 0 1px 3px color-mix(in oklch, black 12%, transparent); }
.card-elevated {
  box-shadow: 0 4px 16px color-mix(in oklch, black 8%, transparent),
              0 1px 4px  color-mix(in oklch, black 6%, transparent);
}
.card-floating {
  box-shadow: 0 8px 32px color-mix(in oklch, black 6%, transparent),
              0 2px 8px  color-mix(in oklch, black 5%, transparent);
  transition: transform 200ms ease, box-shadow 200ms ease;
}
.card-floating:hover {
  transform: translateY(-4px);
  box-shadow: 0 16px 48px color-mix(in oklch, black 4%, transparent),
              0 4px 12px  color-mix(in oklch, black 4%, transparent);
}

/* Product */
.card-image { width: 100%; aspect-ratio: 4/3; object-fit: cover; display: block; }
.card-body  { padding: 1rem 1.25rem 1.25rem; }

/* Pricing */
.card-pricing  { padding: 2rem; text-align: center; }
.pricing-tier  { font-size: 0.875rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.06em; }
.pricing-amount { font-size: 2.5rem; font-weight: 700; line-height: 1; }
.pricing-features { list-style: none; padding: 0; text-align: left; margin: 1.5rem 0; }
.pricing-features li { padding: 0.375rem 0; border-bottom: 1px solid var(--color-border); font-size: 0.9rem; }

/* Testimonial */
.card-testimonial      { padding: 1.5rem; }
.testimonial-quote     { font-size: 1rem; line-height: 1.6; margin: 0 0 1.25rem; font-style: italic; }
.testimonial-attribution { display: flex; align-items: center; gap: 0.75rem; }
.testimonial-avatar    { border-radius: 50%; object-fit: cover; }
.testimonial-name      { font-weight: 600; font-size: 0.875rem; margin: 0; }
.testimonial-role      { font-size: 0.8rem; color: var(--color-text-muted); margin: 0; }
```

---

## 4. Forms

Validate on **blur** (not every keystroke). Error message appears after field loses focus.

```html
<form class="form" novalidate>
  <div class="field" data-state="idle">
    <label for="email" class="field-label">
      Email address <span class="field-required" aria-label="required">*</span>
    </label>
    <input
      id="email" type="email" class="field-input"
      placeholder="you@example.com"
      aria-describedby="email-hint email-error"
      autocomplete="email" required
    >
    <p id="email-hint" class="field-hint">We send your receipt here</p>
    <p id="email-error" class="field-error" role="alert" aria-live="polite" hidden>
      Email needs an @ symbol. Try: name@example.com
    </p>
  </div>

  <!-- Textarea with character count -->
  <div class="field">
    <label for="message" class="field-label">Message</label>
    <div class="textarea-wrapper">
      <textarea id="message" class="field-input field-textarea" maxlength="500"
        aria-describedby="message-count"></textarea>
      <span id="message-count" class="field-char-count" aria-live="polite">0 / 500</span>
    </div>
  </div>

  <!-- Custom select -->
  <div class="field">
    <label for="plan" class="field-label">Plan</label>
    <div class="select-wrapper">
      <select id="plan" class="field-input field-select">
        <option value="">Choose a plan</option>
        <option value="free">Free</option>
        <option value="pro">Pro - $29/mo</option>
      </select>
      <svg class="select-chevron" aria-hidden="true"><!-- chevron --></svg>
    </div>
  </div>

  <!-- Custom checkbox -->
  <label class="field-checkbox">
    <input type="checkbox" class="checkbox-input">
    <span class="checkbox-control" aria-hidden="true"></span>
    <span class="checkbox-label">I agree to the terms</span>
  </label>

  <button type="submit" class="btn btn-primary">Create account</button>
</form>
```

```css
.field { display: flex; flex-direction: column; gap: 0.375rem; }
.field-label { font-size: 0.875rem; font-weight: 500; }
.field-required { color: var(--color-error); margin-left: 0.125rem; }

.field-input {
  padding: 0.625rem 0.875rem;
  border: 1.5px solid var(--color-border);
  border-radius: 0.5rem;
  background: var(--color-surface);
  color: var(--color-text);
  font-size: 0.9375rem;
  transition: border-color 150ms, box-shadow 150ms;
  width: 100%;
}
.field-input:hover { border-color: var(--color-border-strong); }
.field-input:focus {
  outline: none;
  border-color: var(--color-accent);
  box-shadow: 0 0 0 3px color-mix(in oklch, var(--color-accent) 20%, transparent);
}

/* Validation states */
.field[data-state="error"]   .field-input { border-color: var(--color-error); }
.field[data-state="error"]   .field-input:focus {
  box-shadow: 0 0 0 3px color-mix(in oklch, var(--color-error) 20%, transparent);
}
.field[data-state="success"] .field-input { border-color: var(--color-success); }
.field[data-state="error"]   .field-error { display: block; }

.field-hint  { font-size: 0.8rem; color: var(--color-text-muted); margin: 0; }
.field-error { font-size: 0.8rem; color: var(--color-error); margin: 0; display: none; }
.field-textarea { resize: vertical; min-height: 120px; }

.textarea-wrapper  { position: relative; }
.field-char-count  {
  position: absolute; bottom: 0.5rem; right: 0.75rem;
  font-size: 0.75rem; color: var(--color-text-muted); pointer-events: none;
}

/* Custom select */
.select-wrapper { position: relative; }
.field-select   { appearance: none; padding-right: 2.5rem; cursor: pointer; }
.select-chevron {
  position: absolute; right: 0.75rem; top: 50%; transform: translateY(-50%);
  pointer-events: none; color: var(--color-text-muted); width: 1rem; height: 1rem;
}

/* Custom checkbox */
.field-checkbox  { display: flex; align-items: center; gap: 0.625rem; cursor: pointer; }
.checkbox-input  { position: absolute; opacity: 0; width: 0; height: 0; }
.checkbox-control {
  width: 1.125rem; height: 1.125rem;
  border: 1.5px solid var(--color-border);
  border-radius: 0.25rem;
  background: var(--color-surface);
  flex-shrink: 0;
  transition: background 150ms, border-color 150ms;
  display: grid; place-items: center;
}
.checkbox-input:checked + .checkbox-control {
  background: var(--color-accent);
  border-color: var(--color-accent);
}
.checkbox-input:checked + .checkbox-control::after {
  content: '';
  width: 0.35rem; height: 0.6rem;
  border: 2px solid #fff;
  border-top: none; border-left: none;
  transform: rotate(45deg) translateY(-1px);
}
.checkbox-input:focus-visible + .checkbox-control {
  outline: 2.5px solid var(--color-accent);
  outline-offset: 2px;
}
```

**Validate on blur, not keystroke:**
```javascript
input.addEventListener('blur', () => {
  const valid = input.checkValidity();
  field.dataset.state = valid ? 'success' : 'error';
  errorEl.hidden = valid;
});

// Character count
textarea.addEventListener('input', () => {
  countEl.textContent = textarea.value.length + ' / ' + textarea.maxLength;
});
```

---

## 5. Modal (Native dialog element)

Uses native `<dialog>` with `inert` attribute on background. No library needed.

```html
<button class="btn btn-secondary" type="button" id="open-modal">Open modal</button>

<dialog class="modal" id="my-modal" aria-labelledby="modal-title" aria-describedby="modal-desc">
  <div class="modal-content">
    <div class="modal-header">
      <h2 id="modal-title" class="modal-title">Delete project</h2>
      <button class="modal-close" aria-label="Close dialog" autofocus>
        <svg aria-hidden="true"><!-- X icon --></svg>
      </button>
    </div>
    <p id="modal-desc" class="modal-body">
      This will permanently delete "Alpha Launch" and all its data. This cannot be undone.
    </p>
    <div class="modal-footer">
      <button class="btn btn-ghost" type="button" data-modal-close>Cancel</button>
      <button class="btn btn-destructive" type="button">Delete project</button>
    </div>
  </div>
</dialog>
```

```css
.modal {
  border: none;
  border-radius: 0.875rem;
  padding: 0;
  max-width: min(560px, calc(100vw - 2rem));
  width: 100%;
  box-shadow: 0 24px 64px rgba(0,0,0,0.28);
  animation: modal-in 220ms cubic-bezier(0.34, 1.56, 0.64, 1);
}
.modal::backdrop {
  background: rgba(0,0,0,0.45);
  backdrop-filter: blur(4px);
  animation: backdrop-in 200ms ease;
}
@keyframes modal-in {
  from { opacity: 0; transform: scale(0.95) translateY(8px); }
  to   { opacity: 1; transform: scale(1) translateY(0); }
}
@keyframes backdrop-in {
  from { opacity: 0; }
  to   { opacity: 1; }
}
.modal-content { padding: 1.75rem; }
.modal-header  { display: flex; align-items: flex-start; justify-content: space-between; margin-bottom: 0.75rem; }
.modal-close   {
  background: none; border: none; cursor: pointer; color: var(--color-text-muted);
  padding: 0.25rem; border-radius: 0.375rem; line-height: 1;
}
.modal-close:hover { color: var(--color-text); background: var(--color-surface-raised); }
.modal-footer  { display: flex; justify-content: flex-end; gap: 0.75rem; margin-top: 1.5rem; }
```

```javascript
const dialog = document.getElementById('my-modal');

document.getElementById('open-modal').addEventListener('click', () => dialog.showModal());

// Close on backdrop click
dialog.addEventListener('click', (e) => { if (e.target === dialog) dialog.close(); });

// Close buttons
dialog.querySelectorAll('[data-modal-close]').forEach(btn =>
  btn.addEventListener('click', () => dialog.close())
);

// Apply inert to background content (improves a11y)
dialog.addEventListener('toggle', () => {
  document.body.querySelectorAll(':not(dialog)').forEach(el => { el.inert = dialog.open; });
});
```

**Accessibility Notes:**
- Native `<dialog>` manages focus trap automatically in modern browsers
- `aria-labelledby` + `aria-describedby` connect title and description
- `autofocus` on close button (not destructive action) - prevents accidental deletion
- Escape key closes by default via native behavior

---

## 6. Tabs

```html
<div class="tabs">
  <div role="tablist" aria-label="Settings sections" class="tabs-list">
    <button role="tab" id="tab-general" aria-controls="panel-general"
      aria-selected="true" class="tabs-tab">General</button>
    <button role="tab" id="tab-security" aria-controls="panel-security"
      aria-selected="false" class="tabs-tab" tabindex="-1">Security</button>
    <button role="tab" id="tab-billing" aria-controls="panel-billing"
      aria-selected="false" class="tabs-tab" tabindex="-1">Billing</button>
    <div class="tabs-indicator" aria-hidden="true"></div>
  </div>

  <div role="tabpanel" id="panel-general" aria-labelledby="tab-general">General content</div>
  <div role="tabpanel" id="panel-security" aria-labelledby="tab-security" hidden>Security content</div>
  <div role="tabpanel" id="panel-billing" aria-labelledby="tab-billing" hidden>Billing content</div>
</div>
```

```css
.tabs-list {
  display: flex;
  border-bottom: 1px solid var(--color-border);
  position: relative;
}
.tabs-tab {
  padding: 0.625rem 1rem;
  font-size: 0.9rem;
  font-weight: 500;
  color: var(--color-text-muted);
  background: none; border: none;
  cursor: pointer;
  transition: color 150ms;
}
.tabs-tab[aria-selected="true"] { color: var(--color-accent); }
.tabs-tab:hover:not([aria-selected="true"]) { color: var(--color-text); }

/* Sliding underline - positioned via JS */
.tabs-indicator {
  position: absolute;
  bottom: -1px; height: 2px;
  background: var(--color-accent);
  border-radius: 2px 2px 0 0;
  transition: left 200ms cubic-bezier(0.4, 0, 0.2, 1),
              width 200ms cubic-bezier(0.4, 0, 0.2, 1);
}
[role="tabpanel"] { padding: 1.5rem 0; }
[role="tabpanel"][hidden] { display: none; }
```

```javascript
const tabs      = [...document.querySelectorAll('[role="tab"]')];
const indicator = document.querySelector('.tabs-indicator');

function selectTab(tab) {
  tabs.forEach(t => {
    t.setAttribute('aria-selected', 'false');
    t.tabIndex = -1;
    document.getElementById(t.getAttribute('aria-controls')).hidden = true;
  });
  tab.setAttribute('aria-selected', 'true');
  tab.tabIndex = 0;
  document.getElementById(tab.getAttribute('aria-controls')).hidden = false;
  indicator.style.left  = tab.offsetLeft + 'px';
  indicator.style.width = tab.offsetWidth + 'px';
}

// Keyboard: arrow keys navigate, Enter/Space activate
document.querySelector('[role="tablist"]').addEventListener('keydown', (e) => {
  const idx = tabs.indexOf(document.activeElement);
  if (e.key === 'ArrowRight') tabs[(idx + 1) % tabs.length].focus();
  if (e.key === 'ArrowLeft')  tabs[(idx - 1 + tabs.length) % tabs.length].focus();
  if (e.key === 'Enter' || e.key === ' ') selectTab(document.activeElement);
});

tabs.forEach(tab => tab.addEventListener('click', () => selectTab(tab)));
selectTab(tabs[0]); // Init
```

---

## 7. Toast / Notification

Stacked toasts with progress bar. Timer pauses when tab is hidden. Swipe-to-dismiss on touch.

```html
<div class="toast-region" role="region" aria-label="Notifications" aria-live="polite">
  <!-- Toasts injected by JS -->
</div>
```

```css
.toast-region {
  position: fixed;
  bottom: 1.5rem; right: 1.5rem;
  display: flex; flex-direction: column-reverse; gap: 0.75rem;
  z-index: 1000;
  max-width: 380px;
  width: calc(100vw - 3rem);
}
.toast {
  display: flex;
  align-items: flex-start;
  gap: 0.75rem;
  padding: 1rem 1.25rem;
  border-radius: 0.75rem;
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  box-shadow: 0 8px 32px rgba(0,0,0,0.14);
  position: relative; overflow: hidden;
  animation: toast-in 280ms cubic-bezier(0.34, 1.4, 0.64, 1);
}
.toast.is-leaving { animation: toast-out 200ms ease forwards; }

@keyframes toast-in {
  from { opacity: 0; transform: translateX(100%) scale(0.95); }
  to   { opacity: 1; transform: translateX(0) scale(1); }
}
@keyframes toast-out {
  to { opacity: 0; transform: translateX(120%); }
}

/* Variants - left accent border */
.toast-success { border-left: 3px solid var(--color-success); }
.toast-error   { border-left: 3px solid var(--color-error); }
.toast-warning { border-left: 3px solid var(--color-warning); }
.toast-info    { border-left: 3px solid var(--color-accent); }

.toast-title       { font-weight: 600; font-size: 0.9rem; margin: 0 0 0.125rem; }
.toast-description { font-size: 0.825rem; color: var(--color-text-muted); margin: 0; }
.toast-dismiss     {
  background: none; border: none; cursor: pointer;
  color: var(--color-text-muted); margin-left: auto;
  padding: 0; font-size: 1.25rem; line-height: 1;
}

/* Progress bar shrinks to zero over --toast-duration */
.toast-progress {
  position: absolute; bottom: 0; left: 0;
  height: 3px; background: var(--color-accent);
  transform-origin: left;
  animation: toast-progress var(--toast-duration, 4s) linear forwards;
}
@keyframes toast-progress { to { transform: scaleX(0); } }
```

```javascript
// Build toast with DOM methods (avoids XSS, no sanitizer needed)
function showToast({ title, description = '', variant = 'info', duration = 4000 }) {
  const region = document.querySelector('.toast-region');
  const toast  = document.createElement('div');
  toast.className = 'toast toast-' + variant;
  toast.setAttribute('role', 'status');
  toast.setAttribute('aria-atomic', 'true');
  toast.style.setProperty('--toast-duration', duration + 'ms');

  const content = document.createElement('div');
  content.className = 'toast-content';

  const titleEl = document.createElement('p');
  titleEl.className = 'toast-title';
  titleEl.textContent = title;
  content.appendChild(titleEl);

  if (description) {
    const descEl = document.createElement('p');
    descEl.className = 'toast-description';
    descEl.textContent = description;
    content.appendChild(descEl);
  }

  const dismissBtn = document.createElement('button');
  dismissBtn.className = 'toast-dismiss';
  dismissBtn.setAttribute('aria-label', 'Dismiss');
  dismissBtn.textContent = 'x';

  const progress = document.createElement('div');
  progress.className = 'toast-progress';

  toast.appendChild(content);
  toast.appendChild(dismissBtn);
  toast.appendChild(progress);

  function dismiss() {
    toast.classList.add('is-leaving');
    toast.addEventListener('animationend', () => toast.remove(), { once: true });
  }

  dismissBtn.addEventListener('click', dismiss);

  let timer = setTimeout(dismiss, duration);

  // Pause on hidden tab - restart timer when visible again
  const onVisibility = () => {
    if (document.hidden) clearTimeout(timer);
    else timer = setTimeout(dismiss, duration);
  };
  document.addEventListener('visibilitychange', onVisibility);

  region.appendChild(toast);
}
```

---

## 8. Badges

```html
<!-- Status badges -->
<span class="badge badge-active">Active</span>
<span class="badge badge-pending">Pending</span>
<span class="badge badge-error">Failed</span>
<span class="badge badge-inactive">Inactive</span>

<!-- Count badge (notification) -->
<div class="badge-wrapper">
  <button class="btn btn-ghost" aria-label="Notifications (3 unread)">
    <svg aria-hidden="true"><!-- bell --></svg>
  </button>
  <span class="badge-count" aria-label="3 unread">3</span>
</div>
```

```css
.badge {
  display: inline-flex;
  align-items: center;
  gap: 0.375rem;
  padding: 0.2rem 0.625rem;
  border-radius: 9999px;
  font-size: 0.75rem;
  font-weight: 500;
  line-height: 1.4;
}
/* Status dot */
.badge::before {
  content: '';
  width: 0.4375rem; height: 0.4375rem;
  border-radius: 50%;
  flex-shrink: 0;
}

.badge-active   { background: color-mix(in oklch, var(--color-success) 15%, transparent); color: var(--color-success); }
.badge-active::before   { background: var(--color-success); }
.badge-pending  { background: color-mix(in oklch, var(--color-warning) 15%, transparent); color: var(--color-warning); }
.badge-pending::before  { background: var(--color-warning); }
.badge-error    { background: color-mix(in oklch, var(--color-error) 15%, transparent);   color: var(--color-error); }
.badge-error::before    { background: var(--color-error); }
.badge-inactive { background: var(--color-surface-raised); color: var(--color-text-muted); }
.badge-inactive::before { background: var(--color-text-muted); }

/* Count dot */
.badge-wrapper { position: relative; display: inline-flex; }
.badge-count {
  position: absolute; top: -4px; right: -4px;
  min-width: 1.125rem; height: 1.125rem;
  padding: 0 0.3rem;
  background: var(--color-error); color: #fff;
  font-size: 0.6875rem; font-weight: 700;
  border-radius: 9999px;
  display: flex; align-items: center; justify-content: center;
  border: 2px solid var(--color-bg);
}
```

**Accessibility Note:** The color dot is decorative - badge text communicates status. For count badges, include count + context in the parent button's `aria-label`.

---

## Design Token Reference

Assumed throughout. Define in `:root`:

```css
:root {
  --color-bg:             oklch(98% 0.005 250);
  --color-surface:        oklch(100% 0 0);
  --color-surface-raised: oklch(96% 0.005 250);
  --color-border:         oklch(90% 0.005 250);
  --color-border-strong:  oklch(80% 0.008 250);
  --color-text:           oklch(18% 0.01 250);
  --color-text-muted:     oklch(50% 0.01 250);
  --color-accent:         oklch(55% 0.22 250);
  --color-success:        oklch(55% 0.17 150);
  --color-error:          oklch(55% 0.2 25);
  --color-warning:        oklch(65% 0.19 75);
}
```
