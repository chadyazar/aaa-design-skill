# Interaction Patterns
> clip-path animations, gesture/drag with momentum, @starting-style for enter animations.
> Spring physics: cubic-bezier(0.34, 1.56, 0.64, 1). Tooltip skip-delay. Toast pause-on-hidden-tab.
> Every pattern includes full implementation code (HTML + CSS + JS). No descriptions without code.

---

## 1. clip-path Animations

`clip-path` is hardware-accelerated and animatable — use it for wipes, reveals, and transitions that `opacity` alone can't achieve.

### Hold-to-Delete (Circle Wipe from Click Point)

Press and hold triggers a colored overlay that fills over 2s. Release snaps back in 200ms. The asymmetric timing is intentional — slow means "are you sure?", fast means "ok, cancelled."

```html
<button class="delete-btn">
  <span class="btn-overlay"></span>
  <span class="btn-label">Hold to Delete</span>
</button>
```

```css
.delete-btn {
  position: relative;
  overflow: hidden;
  padding: 12px 24px;
  border: none;
  border-radius: 8px;
  background: var(--color-surface, #1a1a1a);
  color: var(--color-text, #fff);
  cursor: pointer;
  user-select: none;
  transition: transform 160ms ease-out;
}

.delete-btn:active {
  transform: scale(0.97);
}

.btn-overlay {
  position: absolute;
  inset: 0;
  background: var(--color-danger, #ef4444);
  clip-path: inset(0 100% 0 0);
  /* Release: fast snap back */
  transition: clip-path 200ms cubic-bezier(0.23, 1, 0.32, 1);
  pointer-events: none;
}

.delete-btn:active .btn-overlay {
  clip-path: inset(0 0% 0 0);
  /* Press: slow, deliberate fill */
  transition: clip-path 2s linear;
}

@media (prefers-reduced-motion: reduce) {
  .btn-overlay { display: none; }
}
```

### Image Reveal on Scroll (Inset Shrinks In)

Hidden from the bottom, revealed as element enters viewport. Use `once: true` — replaying the reveal is annoying.

```html
<div class="reveal-image">
  <img src="photo.jpg" alt="..." />
</div>
```

```css
.reveal-image {
  clip-path: inset(0 0 100% 0);
  transition: clip-path 700ms cubic-bezier(0.23, 1, 0.32, 1);
}

.reveal-image.is-visible {
  clip-path: inset(0 0 0% 0);
}

@media (prefers-reduced-motion: reduce) {
  .reveal-image { clip-path: none; }
}
```

```js
const images = document.querySelectorAll('.reveal-image');

const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('is-visible');
      observer.unobserve(entry.target); // once: true
    }
  });
}, { rootMargin: '-100px' });

images.forEach(img => observer.observe(img));
```

### Comparison Slider (Two Images, One clip-path)

No extra DOM. Clip the top image, adjust right inset on pointer drag. Fully GPU-accelerated.

```html
<div class="comparison">
  <img class="comparison__before" src="before.jpg" alt="Before" />
  <img class="comparison__after" src="after.jpg" alt="After" />
  <div class="comparison__handle"></div>
</div>
```

```css
.comparison {
  position: relative;
  width: 600px;
  height: 400px;
  overflow: hidden;
  cursor: ew-resize;
  border-radius: 12px;
}

.comparison__before,
.comparison__after {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  pointer-events: none;
}

.comparison__after {
  clip-path: inset(0 50% 0 0);
  transition: none; /* No transition during drag — direct control */
}

.comparison__handle {
  position: absolute;
  top: 0; bottom: 0;
  left: 50%;
  width: 2px;
  background: #fff;
  cursor: ew-resize;
}

.comparison__handle::before {
  content: '';
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: #fff;
}
```

```js
const container = document.querySelector('.comparison');
const after = container.querySelector('.comparison__after');
const handle = container.querySelector('.comparison__handle');
let isDragging = false;

function setPosition(x) {
  const rect = container.getBoundingClientRect();
  const pct = Math.max(0, Math.min(100, ((x - rect.left) / rect.width) * 100));
  after.style.clipPath = `inset(0 ${100 - pct}% 0 0)`;
  handle.style.left = `${pct}%`;
}

container.addEventListener('pointerdown', e => {
  isDragging = true;
  container.setPointerCapture(e.pointerId);
  setPosition(e.clientX);
});

container.addEventListener('pointermove', e => {
  if (!isDragging) return;
  setPosition(e.clientX);
});

container.addEventListener('pointerup', () => { isDragging = false; });
```

### Tabs with Color Morph (Duplicate + Clip Technique)

Two tab lists stacked. The bottom is "inactive" style, the top is "active" style clipped to only show the selected tab. Animating `clip-path` creates a seamless color transition that's impossible with individual `color` transitions.

```html
<div class="tabs">
  <!-- Inactive layer (always visible) -->
  <ul class="tabs__list tabs__list--inactive">
    <li data-tab="0">Design</li>
    <li data-tab="1">Code</li>
    <li data-tab="2">Preview</li>
  </ul>
  <!-- Active layer (clipped to selected tab) -->
  <ul class="tabs__list tabs__list--active" aria-hidden="true">
    <li>Design</li>
    <li>Code</li>
    <li>Preview</li>
  </ul>
</div>
```

```css
.tabs { position: relative; display: flex; }

.tabs__list {
  display: flex;
  list-style: none;
  margin: 0; padding: 4px;
  gap: 4px;
}

.tabs__list--active {
  position: absolute;
  inset: 0;
  background: var(--color-primary, #6366f1);
  border-radius: 8px;
  clip-path: inset(4px calc(100% - 80px) 4px 4px round 6px);
  transition: clip-path 250ms cubic-bezier(0.23, 1, 0.32, 1);
  color: #fff;
  pointer-events: none;
}

.tabs__list--inactive li,
.tabs__list--active li {
  padding: 8px 20px;
  border-radius: 6px;
  cursor: pointer;
  white-space: nowrap;
}
```

```js
const tabs = document.querySelectorAll('.tabs__list--inactive li');
const activeList = document.querySelector('.tabs__list--active');

function updateClip(index) {
  const tab = tabs[index];
  const parent = tab.closest('.tabs');
  const rect = tab.getBoundingClientRect();
  const parentRect = parent.getBoundingClientRect();
  const left = rect.left - parentRect.left;
  const right = parentRect.width - (rect.right - parentRect.left);
  activeList.style.clipPath = `inset(4px ${right}px 4px ${left}px round 6px)`;
}

tabs.forEach((tab, i) => {
  tab.addEventListener('click', () => updateClip(i));
});

updateClip(0); // Initialize
```

---

## 2. Gesture/Drag Interactions

### Momentum-Based Dismissal

Don't require dragging past a distance threshold alone — calculate velocity. A quick flick should always dismiss regardless of distance.

```js
class SwipeDismiss {
  constructor(element, onDismiss) {
    this.el = element;
    this.onDismiss = onDismiss;
    this.startX = 0;
    this.startTime = null;
    this.isDragging = false;
    this.DISTANCE_THRESHOLD = 100; // px
    this.VELOCITY_THRESHOLD = 0.11; // px/ms

    this.el.addEventListener('pointerdown', this.onPointerDown.bind(this));
    this.el.addEventListener('pointermove', this.onPointerMove.bind(this));
    this.el.addEventListener('pointerup', this.onPointerUp.bind(this));
    this.el.addEventListener('pointercancel', this.onPointerUp.bind(this));
  }

  onPointerDown(e) {
    if (this.isDragging) return; // Multi-touch protection
    this.isDragging = true;
    this.startX = e.clientX;
    this.startTime = Date.now();
    this.el.setPointerCapture(e.pointerId); // Capture: drag outside element works
    this.el.style.transition = 'none'; // Direct control during drag
  }

  onPointerMove(e) {
    if (!this.isDragging) return;
    const delta = e.clientX - this.startX;
    // Boundary damping: harder to drag past 0 (back from edge)
    const damped = delta > 0 ? delta : delta * 0.2;
    this.el.style.transform = `translateX(${damped}px)`;
    this.el.style.opacity = 1 - Math.abs(damped) / 300;
  }

  onPointerUp(e) {
    if (!this.isDragging) return;
    this.isDragging = false;

    const delta = e.clientX - this.startX;
    const elapsed = Date.now() - this.startTime;
    const velocity = Math.abs(delta) / elapsed;

    if (Math.abs(delta) >= this.DISTANCE_THRESHOLD || velocity > this.VELOCITY_THRESHOLD) {
      this.dismiss(delta);
    } else {
      this.snapBack();
    }
  }

  dismiss(direction) {
    const target = direction > 0 ? '150%' : '-150%';
    this.el.style.transition = 'transform 300ms cubic-bezier(0.23, 1, 0.32, 1), opacity 300ms ease';
    this.el.style.transform = `translateX(${target})`;
    this.el.style.opacity = '0';
    this.el.addEventListener('transitionend', () => this.onDismiss(), { once: true });
  }

  snapBack() {
    this.el.style.transition = 'transform 400ms cubic-bezier(0.34, 1.56, 0.64, 1), opacity 300ms ease';
    this.el.style.transform = 'translateX(0)';
    this.el.style.opacity = '1';
  }
}

// Usage
const card = document.querySelector('.swipeable-card');
new SwipeDismiss(card, () => card.remove());
```

### Boundary Damping (Drawer / Sheet)

When dragging past the natural boundary, apply progressive resistance — not a hard stop. The further past the edge, the less the element moves.

```js
function applyDamping(rawDelta, boundary = 0) {
  if (rawDelta <= boundary) return rawDelta; // Normal range — no damping
  const excess = rawDelta - boundary;
  // Logarithmic resistance: feels natural, never hard stops
  return boundary + Math.log1p(excess) * 20;
}

// In pointermove handler:
const rawDelta = currentY - startY;
const dampedDelta = applyDamping(rawDelta, 0); // 0 = can't drag up past top
element.style.transform = `translateY(${dampedDelta}px)`;
```

---

## 3. @starting-style — Modern Enter Animations (No JS Mount State)

Browser support: Chrome 117+, Safari 17.5+, Firefox 129+. Eliminates the `useEffect` + `mounted` state pattern.

```html
<dialog id="my-dialog">
  <h2>Hello</h2>
  <button onclick="this.closest('dialog').close()">Close</button>
</dialog>
<button onclick="document.getElementById('my-dialog').showModal()">Open</button>
```

```css
dialog {
  opacity: 1;
  transform: scale(1) translateY(0);
  transition: opacity 250ms ease-out, transform 250ms cubic-bezier(0.23, 1, 0.32, 1),
              overlay 250ms allow-discrete, display 250ms allow-discrete;

  /* Exit state */
  &[closing] {
    opacity: 0;
    transform: scale(0.95) translateY(8px);
  }

  /* Enter state — @starting-style replaces JS mounted: true */
  @starting-style {
    opacity: 0;
    transform: scale(0.95) translateY(8px);
  }
}

/* Backdrop animation */
dialog::backdrop {
  background: rgba(0, 0, 0, 0.5);
  transition: opacity 250ms ease, overlay 250ms allow-discrete, display 250ms allow-discrete;

  @starting-style {
    opacity: 0;
  }
}

@media (prefers-reduced-motion: reduce) {
  dialog, dialog::backdrop {
    transition-duration: 0.01ms !important;
  }
}
```

```js
// For exit animation, add [closing] before close():
function closeDialog(dialog) {
  dialog.setAttribute('closing', '');
  dialog.addEventListener('animationend', () => {
    dialog.removeAttribute('closing');
    dialog.close();
  }, { once: true });
}
```

### Popover with @starting-style

```css
[popover] {
  opacity: 1;
  transform: scale(1);
  transform-origin: var(--transform-origin, top center);
  transition: opacity 150ms ease-out, transform 150ms cubic-bezier(0.23, 1, 0.32, 1),
              overlay 150ms allow-discrete, display 150ms allow-discrete;

  &:not(:popover-open) {
    opacity: 0;
    transform: scale(0.95);
  }

  @starting-style {
    &:popover-open {
      opacity: 0;
      transform: scale(0.95);
    }
  }
}
```

---

## 4. Blur Masking During Crossfades

When two states crossfade and look like two overlapping objects instead of one smooth transition, add blur. The eye perceives blur as "in motion" — it bridges the visual gap.

```html
<button class="morphing-btn" data-state="idle">
  <span class="btn-content">Save</span>
</button>
```

```css
.morphing-btn {
  position: relative;
  overflow: hidden;
  transition: transform 160ms ease-out;
}

.morphing-btn:active {
  transform: scale(0.97);
}

.btn-content {
  display: block;
  transition: filter 200ms ease, opacity 200ms ease;
}

.morphing-btn[data-state="loading"] .btn-content {
  filter: blur(4px);
  opacity: 0.5;
}

/* Crossfade between states: blur hides the overlap */
.btn-state {
  position: absolute;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: filter 200ms ease, opacity 200ms ease;
  opacity: 0;
  filter: blur(4px);
}

.btn-state.active {
  opacity: 1;
  filter: blur(0);
}
```

**Rule:** Keep blur under 20px. Heavy blur is expensive in Safari. `filter: blur(2px)` is usually enough to smooth the seam.

---

## 5. CSS Transform Mastery

### translateY(%) is Relative to Own Dimensions

```css
/* Drawer: hides below viewport regardless of content height */
.drawer { transform: translateY(100%); }

/* Toast: stacks above previous regardless of height */
.toast-enter { transform: translateY(-100%); }
```

### scale() Scales Children — Use It

```css
/* Press: button + its label + icon all scale together proportionally */
.card:active { transform: scale(0.97); }
```

### 3D Depth Effects with preserve-3d

```css
.scene {
  perspective: 800px;
}

.card {
  transform-style: preserve-3d;
  transition: transform 400ms cubic-bezier(0.23, 1, 0.32, 1);
}

.card:hover {
  transform: rotateY(8deg) rotateX(-4deg);
}

/* Orbiting element */
@keyframes orbit {
  from { transform: translate(-50%, -50%) rotateY(0deg) translateZ(72px) rotateY(0deg); }
  to   { transform: translate(-50%, -50%) rotateY(360deg) translateZ(72px) rotateY(-360deg); }
}
```

### transform-origin Tricks

```css
/* Popover scales from trigger (Radix UI) */
.popover { transform-origin: var(--radix-popover-content-transform-origin); }

/* Dropdown scales from top */
.dropdown { transform-origin: top center; }

/* Context menu scales from click point */
.context-menu { transform-origin: var(--menu-origin, top left); }

/* Modal: KEEP center — not anchored to a trigger */
.modal { transform-origin: center; }
```

---

## 6. Tooltip Skip-Delay

First tooltip has a 300ms delay to prevent accidental activation. Once any tooltip is open, subsequent ones appear instantly. Timer resets 500ms after all tooltips close.

```html
<div class="toolbar">
  <button class="has-tooltip" data-tip="Bold"><b>B</b></button>
  <button class="has-tooltip" data-tip="Italic"><i>I</i></button>
  <button class="has-tooltip" data-tip="Underline"><u>U</u></button>
</div>
```

```css
.tooltip {
  position: absolute;
  bottom: calc(100% + 8px);
  left: 50%;
  transform: translateX(-50%) scale(0.97);
  background: var(--color-surface, #1a1a1a);
  color: var(--color-text, #fff);
  padding: 4px 8px;
  border-radius: 4px;
  font-size: 12px;
  white-space: nowrap;
  pointer-events: none;
  opacity: 0;
  transition: opacity 125ms ease-out, transform 125ms cubic-bezier(0.23, 1, 0.32, 1);
  transform-origin: bottom center;
}

.tooltip.visible {
  opacity: 1;
  transform: translateX(-50%) scale(1);
}

/* Skip animation entirely when in "instant" mode */
.tooltip.instant {
  transition-duration: 0ms;
}
```

```js
let tooltipOpenCount = 0;
let resetTimer = null;

const triggers = document.querySelectorAll('.has-tooltip');

triggers.forEach(trigger => {
  const tip = document.createElement('span');
  tip.className = 'tooltip';
  tip.textContent = trigger.dataset.tip;
  trigger.style.position = 'relative';
  trigger.appendChild(tip);

  let showTimer = null;

  trigger.addEventListener('mouseenter', () => {
    clearTimeout(resetTimer);
    const delay = tooltipOpenCount > 0 ? 0 : 300;

    showTimer = setTimeout(() => {
      if (tooltipOpenCount > 0) tip.classList.add('instant');
      tip.classList.add('visible');
      tooltipOpenCount++;
    }, delay);
  });

  trigger.addEventListener('mouseleave', () => {
    clearTimeout(showTimer);
    tip.classList.remove('visible', 'instant');
    tooltipOpenCount = Math.max(0, tooltipOpenCount - 1);

    if (tooltipOpenCount === 0) {
      resetTimer = setTimeout(() => {
        tooltipOpenCount = 0; // Full reset
      }, 500);
    }
  });
});
```

---

## 7. Sonner/Toast Principles

### Pause Timer on Hidden Tab

```js
class Toast {
  constructor(duration = 5000) {
    this.duration = duration;
    this.remaining = duration;
    this.startTime = null;
    this.timer = null;

    document.addEventListener('visibilitychange', () => {
      if (document.hidden) {
        this.pause();
      } else {
        this.resume();
      }
    });
  }

  start(onExpire) {
    this.onExpire = onExpire;
    this.resume();
  }

  pause() {
    if (!this.timer) return;
    clearTimeout(this.timer);
    this.remaining -= Date.now() - this.startTime;
    this.timer = null;
  }

  resume() {
    if (this.timer) return;
    this.startTime = Date.now();
    this.timer = setTimeout(() => this.onExpire?.(), this.remaining);
  }
}
```

### Fill Gaps Between Stacked Toasts (No Hover Gaps)

Sonner uses a pseudo-element to bridge the visual gap between stacked toasts so hover state doesn't break when moving the cursor between them.

```css
/* Toast stack container */
.toast-item {
  position: relative;
  transition: transform 400ms ease;
}

/* Fill the gap above each toast to maintain hover continuity */
.toast-item::after {
  content: '';
  position: absolute;
  bottom: 100%;
  left: 0; right: 0;
  height: 16px; /* gap size */
  background: transparent;
}
```

### Pointer Capture During Drag

```js
toastEl.addEventListener('pointerdown', (e) => {
  toastEl.setPointerCapture(e.pointerId);
  // Now pointermove fires on toastEl even if pointer leaves it
  // Prevents text selection during drag
});
```

### Use CSS Transitions, Not Keyframes

Toasts are added rapidly. `@keyframes` restarts from zero on interruption. Transitions retarget smoothly.

```css
/* Good: interruptible */
.toast { transition: transform 400ms ease, opacity 300ms ease; }

/* Bad: restarts from zero when new toast interrupts */
/* @keyframes slideIn { ... } */
```

---

## 8. Web Animations API (WAAPI)

JavaScript control with CSS performance. Hardware-accelerated. No library required.

```js
// Basic usage
const animation = element.animate(
  [
    { clipPath: 'inset(0 0 100% 0)', opacity: 0 },
    { clipPath: 'inset(0 0 0% 0)', opacity: 1 }
  ],
  {
    duration: 600,
    easing: 'cubic-bezier(0.23, 1, 0.32, 1)',
    fill: 'forwards'
  }
);

// Cancel mid-animation (spring-like interruption)
button.addEventListener('click', () => animation.cancel());

// Reverse
animation.reverse();

// Chain animations
animation.finished.then(() => {
  element.animate([{ opacity: 1 }, { opacity: 0 }], { duration: 200 });
});

// Scroll-driven: image reveal
const revealAnimation = img.animate(
  [{ clipPath: 'inset(0 0 100% 0)' }, { clipPath: 'inset(0 0 0% 0)' }],
  {
    fill: 'both',
    timeline: new ViewTimeline({ subject: img }),
    rangeStart: 'entry 0%',
    rangeEnd: 'entry 100%'
  }
);
```

---

## 9. Spring Physics Configs

Springs feel more natural than duration-based because they simulate real inertia. Use them for interactions that can be interrupted mid-motion.

| Preset | cubic-bezier | Feel | Use When |
|--------|-------------|------|----------|
| Snappy | `cubic-bezier(0.34, 1.56, 0.64, 1)` | Light bounce, confident | Drag release, modals, cards |
| Bouncy | `cubic-bezier(0.68, -0.55, 0.27, 1.55)` | Elastic overshoot | Playful UIs, empty states, celebrations |
| Gentle | `cubic-bezier(0.25, 0.1, 0.25, 1)` | Standard ease | Hover states, subtle transitions |
| Drawer | `cubic-bezier(0.32, 0.72, 0, 1)` | iOS-like slide | Drawers, sheets, panels |
| Strong | `cubic-bezier(0.23, 1, 0.32, 1)` | Fast exit, no overshoot | Dropdowns, tooltips, UI elements |

```css
:root {
  --spring-snappy:  cubic-bezier(0.34, 1.56, 0.64, 1);
  --spring-bouncy:  cubic-bezier(0.68, -0.55, 0.27, 1.55);
  --spring-gentle:  cubic-bezier(0.25, 0.1, 0.25, 1);
  --spring-drawer:  cubic-bezier(0.32, 0.72, 0, 1);
  --ease-strong:    cubic-bezier(0.23, 1, 0.32, 1);
  --ease-in-out:    cubic-bezier(0.77, 0, 0.175, 1);
}

/* Snappy: modal appears with slight overshoot */
.modal {
  transform: scale(0.95);
  opacity: 0;
  transition: transform 300ms var(--spring-snappy), opacity 200ms ease-out;
}
.modal.open {
  transform: scale(1);
  opacity: 1;
}

/* Drawer: iOS-like slide up */
.drawer {
  transform: translateY(100%);
  transition: transform 400ms var(--spring-drawer);
}
.drawer.open {
  transform: translateY(0);
}
```

**Rule:** Keep `bounce` (overshoot) at 0.1–0.3 for UI. High bounce is reserved for decorative/playful interactions only. Never use bouncy springs on functional navigation or forms.

---

## 10. Perpetual Micro-Interactions (Infinite Loops)

```css
/* Pulse — attention getter */
@keyframes pulse {
  0%, 100% { transform: scale(1); opacity: 1; }
  50% { transform: scale(1.05); opacity: 0.8; }
}
.pulse { animation: pulse 2s ease-in-out infinite; }

/* Typewriter — text reveal */
@keyframes typewriter {
  from { clip-path: inset(0 100% 0 0); }
  to   { clip-path: inset(0 0% 0 0); }
}
@keyframes blink-cursor {
  50% { opacity: 0; }
}
.typewriter {
  display: inline-block;
  animation: typewriter 2s steps(30) infinite alternate;
  border-right: 2px solid currentColor;
}
.typewriter::after {
  animation: blink-cursor 0.75s step-end infinite;
}

/* Float — empty state illustration */
@keyframes float {
  0%, 100% { transform: translateY(0); }
  50%       { transform: translateY(-12px); }
}
.floating-icon {
  animation: float 3s ease-in-out infinite;
}

/* Shimmer — skeleton loading */
@keyframes shimmer {
  from { background-position: -200% 0; }
  to   { background-position: 200% 0; }
}
.skeleton {
  background: linear-gradient(
    90deg,
    var(--color-skeleton-base, #e0e0e0) 25%,
    var(--color-skeleton-shine, #f0f0f0) 50%,
    var(--color-skeleton-base, #e0e0e0) 75%
  );
  background-size: 200% 100%;
  animation: shimmer 1.5s linear infinite;
  border-radius: 4px;
}

/* Carousel — automatic scroll */
@keyframes carousel {
  from { transform: translateX(0); }
  to   { transform: translateX(-50%); } /* Content is doubled for seamless loop */
}
.carousel-track {
  display: flex;
  width: max-content;
  animation: carousel 20s linear infinite;
}
.carousel-track:hover { animation-play-state: paused; }

@media (prefers-reduced-motion: reduce) {
  .pulse, .floating-icon, .carousel-track { animation: none; }
  .skeleton { animation: none; background: var(--color-skeleton-base, #e0e0e0); }
  .typewriter { animation: none; clip-path: none; border-right: none; }
}
```

---

## 11. Animation Decision Framework

**The decision tree — work through this in order before writing any animation code:**

```
1. How often will users see this?
   ├─ 100+/day (keyboard shortcut, command palette) → NO ANIMATION. Period.
   ├─ Tens/day (hover effects, nav) → Remove or drastically reduce
   ├─ Occasional (modals, drawers, toasts) → Standard animation
   └─ Rare/first-time (onboarding, celebrations) → Can add delight

2. Does the animation have a clear purpose?
   ├─ Spatial consistency (enter/exit from same direction) → YES
   ├─ State change feedback (button press, form submit) → YES
   ├─ Explanation (how a feature works, marketing) → YES
   ├─ Preventing jarring changes → YES
   └─ "It looks cool" + user sees it often → NO

3. Pick the tool:
   ├─ Simple state change → CSS transition
   ├─ Complex sequence (steps, keyframes) → CSS @keyframes
   ├─ Needs JS control (cancel, reverse, dynamic values) → Web Animations API
   ├─ Can be interrupted by user → CSS transition or spring (NOT @keyframes)
   ├─ Physics/momentum (drag, gesture) → Spring (Framer Motion / custom)
   └─ Runs on heavy page (data loading, lots of JS) → CSS animation (off main thread)

4. Easing:
   ├─ Entering viewport/screen → ease-out (starts fast, instant feedback)
   ├─ Moving across screen → ease-in-out (natural arc)
   ├─ Hover/color change → ease (symmetric)
   ├─ Constant motion (marquee, spinner) → linear
   └─ Drag release / "alive" feeling → spring

5. Duration:
   ├─ Button press → 100–160ms
   ├─ Tooltip, small popover → 125–200ms
   ├─ Dropdown, select → 150–250ms
   ├─ Modal, drawer → 200–500ms
   └─ Marketing/explanatory → unlimited
   RULE: UI animations ≤ 300ms. Exit faster than enter (~75% of enter duration).
```

| Use Case | Tool | Why |
|----------|------|-----|
| Button hover/active | CSS transition | Fast, interruptible, no JS overhead |
| Toast appear/disappear | CSS transition | Interruptible when multiple toasts stack |
| Modal enter | CSS transition + @starting-style | Origin-aware, modern |
| Scroll reveal | CSS animation + IntersectionObserver | Runs off main thread |
| Drag and drop | requestAnimationFrame or spring | Dynamic values, interruptible |
| Page load choreography | CSS @keyframes with stagger | Predetermined, off main thread |
| Number counter | Web Animations API or @property | JS precision + CSS performance |
| Gesture dismiss | Spring (Framer Motion) | Maintains velocity on interrupt |
