# Wow Patterns — Creative Arsenal
> 10 production-ready effects with full HTML + CSS + JS code. Copy-paste ready.
> Spotlight border (mouse-tracking glow), parallax tilt, scroll-triggered reveal, bento hover expansion.
> Text scramble, magnetic button, gradient mesh, number counter, kinetic marquee, sticky scroll stack.

---

## 1. Spotlight Border

Mouse-tracking glow effect on cards. `mousemove` updates a CSS custom property for a radial-gradient that creates a lit-up border following the cursor. Works on a grid of cards simultaneously.

**When to use:** Feature grids, pricing cards, dashboard widgets — anywhere cards need to feel interactive and premium.

```html
<div class="spotlight-grid">
  <div class="spotlight-card">
    <h3>Feature One</h3>
    <p>Description text here.</p>
  </div>
  <div class="spotlight-card">
    <h3>Feature Two</h3>
    <p>Description text here.</p>
  </div>
  <div class="spotlight-card">
    <h3>Feature Three</h3>
    <p>Description text here.</p>
  </div>
</div>
```

```css
.spotlight-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 1px;
  background: var(--color-border, #2a2a2a);
  border-radius: 12px;
  overflow: hidden;
}

.spotlight-card {
  position: relative;
  padding: 32px;
  background: var(--color-surface, #111);
  overflow: hidden;
}

/* The spotlight glow — follows mouse via CSS vars */
.spotlight-card::before {
  content: '';
  position: absolute;
  inset: -1px;
  background: radial-gradient(
    600px circle at var(--spotlight-x, 50%) var(--spotlight-y, 50%),
    var(--spotlight-color, rgba(99, 102, 241, 0.6)),
    transparent 40%
  );
  opacity: 0;
  transition: opacity 400ms ease;
  border-radius: inherit;
  z-index: 0;
  pointer-events: none;
}

.spotlight-card:hover::before {
  opacity: 1;
}

.spotlight-card > * {
  position: relative;
  z-index: 1;
}

@media (prefers-reduced-motion: reduce) {
  .spotlight-card::before { display: none; }
}
```

```js
const grid = document.querySelector('.spotlight-grid');
const cards = grid.querySelectorAll('.spotlight-card');

grid.addEventListener('mousemove', (e) => {
  cards.forEach(card => {
    const rect = card.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const y = e.clientY - rect.top;
    card.style.setProperty('--spotlight-x', `${x}px`);
    card.style.setProperty('--spotlight-y', `${y}px`);
  });
});
```

---

## 2. Parallax Tilt Card

CSS + JS 3D perspective tilt that follows cursor position. Uses `rotateX`/`rotateY` transforms with `perspective`. Feels alive without a library.

**When to use:** Product showcases, hero cards, portfolio items, pricing highlights.

```html
<div class="tilt-wrapper">
  <div class="tilt-card">
    <div class="tilt-card__shine"></div>
    <div class="tilt-card__content">
      <h3>Premium Plan</h3>
      <p class="tilt-card__price">$49/mo</p>
    </div>
  </div>
</div>
```

```css
.tilt-wrapper {
  perspective: 1000px;
  display: inline-block;
}

.tilt-card {
  position: relative;
  width: 320px;
  padding: 40px;
  background: linear-gradient(135deg, var(--color-primary, #6366f1), var(--color-secondary, #8b5cf6));
  border-radius: 16px;
  transform-style: preserve-3d;
  transform: rotateX(0) rotateY(0);
  transition: transform 400ms cubic-bezier(0.23, 1, 0.32, 1), box-shadow 400ms ease;
  cursor: pointer;
  box-shadow: 0 20px 60px rgba(0,0,0,0.3);
}

.tilt-card__shine {
  position: absolute;
  inset: 0;
  border-radius: 16px;
  background: radial-gradient(
    circle at 30% 30%,
    rgba(255,255,255,0.15),
    transparent 60%
  );
  opacity: 0;
  transition: opacity 300ms ease;
  pointer-events: none;
}

.tilt-card:hover {
  box-shadow: 0 40px 80px rgba(0,0,0,0.4);
}

.tilt-card:hover .tilt-card__shine {
  opacity: 1;
}

.tilt-card__content {
  transform: translateZ(40px);
  position: relative;
  z-index: 1;
}

.tilt-card__price {
  font-size: 2.5rem;
  font-weight: 700;
  margin: 8px 0 0;
  color: #fff;
}

@media (prefers-reduced-motion: reduce) {
  .tilt-card { transition: none; transform: none !important; }
  .tilt-card__shine { display: none; }
}
```

```js
const wrapper = document.querySelector('.tilt-wrapper');
const card = document.querySelector('.tilt-card');
const shine = card.querySelector('.tilt-card__shine');

const prefersReduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

if (!prefersReduced) {
  wrapper.addEventListener('mousemove', (e) => {
    const rect = card.getBoundingClientRect();
    const x = (e.clientX - rect.left) / rect.width - 0.5;
    const y = (e.clientY - rect.top) / rect.height - 0.5;

    card.style.transform = `rotateY(${x * 15}deg) rotateX(${-y * 15}deg)`;
    shine.style.background = `radial-gradient(circle at ${(x + 0.5) * 100}% ${(y + 0.5) * 100}%, rgba(255,255,255,0.2), transparent 60%)`;
  });

  wrapper.addEventListener('mouseleave', () => {
    card.style.transform = 'rotateX(0) rotateY(0)';
  });
}
```

---

## 3. Scroll-Triggered Reveal

`IntersectionObserver` + `translateY(30px) → 0` + `opacity 0 → 1` with per-element stagger delay. Clean, accessible, single reusable setup.

**When to use:** Marketing pages, landing pages, any content that should animate in as user scrolls down.

```html
<section class="reveal-section">
  <div class="reveal" data-delay="0">First card</div>
  <div class="reveal" data-delay="1">Second card (50ms later)</div>
  <div class="reveal" data-delay="2">Third card (100ms later)</div>
</section>
```

```css
.reveal {
  opacity: 0;
  transform: translateY(30px);
  transition: opacity 600ms cubic-bezier(0.23, 1, 0.32, 1),
              transform 600ms cubic-bezier(0.23, 1, 0.32, 1);
}

.reveal.is-revealed {
  opacity: 1;
  transform: translateY(0);
}

.reveal[data-delay="1"] { transition-delay: 50ms; }
.reveal[data-delay="2"] { transition-delay: 100ms; }
.reveal[data-delay="3"] { transition-delay: 150ms; }
.reveal[data-delay="4"] { transition-delay: 200ms; }

@media (prefers-reduced-motion: reduce) {
  .reveal {
    opacity: 1;
    transform: none;
    transition: none;
  }
}
```

```js
const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

if (!prefersReducedMotion) {
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('is-revealed');
          observer.unobserve(entry.target); // Animate once only
        }
      });
    },
    { rootMargin: '-80px 0px', threshold: 0.1 }
  );

  document.querySelectorAll('.reveal').forEach(el => observer.observe(el));
} else {
  document.querySelectorAll('.reveal').forEach(el => el.classList.add('is-revealed'));
}
```

---

## 4. Bento Grid with Hover Expansion

CSS Grid item grows on hover while siblings compress proportionally. No JS — pure CSS `grid-template-columns` transitions via `:has()`.

**When to use:** Feature showcases, case study grids, dashboard layouts, "what we do" sections.

```html
<div class="bento-grid">
  <div class="bento-item">
    <span class="bento-label">Primary feature</span>
  </div>
  <div class="bento-item">
    <span class="bento-label">Feature A</span>
  </div>
  <div class="bento-item">
    <span class="bento-label">Feature B</span>
  </div>
  <div class="bento-item">
    <span class="bento-label">Feature C</span>
  </div>
</div>
```

```css
.bento-grid {
  display: grid;
  grid-template-columns: 2fr 1fr 1fr 1fr;
  gap: 12px;
  height: 300px;
  transition: grid-template-columns 400ms cubic-bezier(0.23, 1, 0.32, 1);
}

/* When any item is hovered, reconfigure columns */
.bento-grid:has(.bento-item:nth-child(1):hover) {
  grid-template-columns: 3fr 0.7fr 0.7fr 0.7fr;
}
.bento-grid:has(.bento-item:nth-child(2):hover) {
  grid-template-columns: 1fr 2.5fr 0.7fr 0.7fr;
}
.bento-grid:has(.bento-item:nth-child(3):hover) {
  grid-template-columns: 1fr 0.7fr 2.5fr 0.7fr;
}
.bento-grid:has(.bento-item:nth-child(4):hover) {
  grid-template-columns: 1fr 0.7fr 0.7fr 2.5fr;
}

.bento-item {
  border-radius: 12px;
  background: var(--color-surface, #1a1a1a);
  border: 1px solid var(--color-border, #2a2a2a);
  display: flex;
  align-items: flex-end;
  padding: 20px;
  overflow: hidden;
  cursor: pointer;
  transition: background 200ms ease, border-color 200ms ease;
}

.bento-item:hover {
  background: var(--color-surface-hover, #222);
  border-color: var(--color-primary, #6366f1);
}

.bento-label {
  font-size: 14px;
  color: var(--color-text, #fff);
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

@media (prefers-reduced-motion: reduce) {
  .bento-grid { transition: none; }
}

@media (hover: none) {
  .bento-grid { grid-template-columns: 1fr 1fr; }
  .bento-item { min-height: 120px; }
}
```

---

## 5. Text Scramble

Matrix-style character cycling. Each character cycles through random ASCII before settling on its final value. Uses DOM text nodes — no innerHTML.

**When to use:** Hero headings, loading states, terminal-style UIs, code-aesthetic products.

```html
<h1 class="scramble">Design Engineering</h1>
<button onclick="scramble()">Scramble</button>
```

```css
.scramble {
  font-family: 'JetBrains Mono', 'Fira Code', monospace;
  font-size: 3rem;
  color: var(--color-text, #fff);
  min-height: 1.2em;
}
```

```js
class TextScramble {
  constructor(el) {
    this.el = el;
    this.chars = '!<>-_\\/[]{}=+*^?#abcdefghijklmnopqrstuvwxyz0123456789';
    this.frame = 0;
    this.frameRequest = null;
    this.queue = [];
    this.update = this.update.bind(this);
  }

  setText(newText) {
    const prefersReduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
    if (prefersReduced) {
      this.el.textContent = newText;
      return Promise.resolve();
    }

    const oldText = this.el.textContent;
    const length = Math.max(oldText.length, newText.length);
    const promise = new Promise(resolve => { this.resolve = resolve; });

    this.queue = [];
    for (let i = 0; i < length; i++) {
      this.queue.push({
        from: oldText[i] || '',
        to: newText[i] || '',
        start: Math.floor(Math.random() * 30),
        end: Math.floor(Math.random() * 30) + 30,
        char: ''
      });
    }

    cancelAnimationFrame(this.frameRequest);
    this.frame = 0;
    this.update();
    return promise;
  }

  update() {
    // Build output as plain text fragments — no HTML injection
    const fragment = document.createDocumentFragment();
    let complete = 0;

    for (let i = 0; i < this.queue.length; i++) {
      const item = this.queue[i];

      if (this.frame >= item.end) {
        complete++;
        const node = document.createTextNode(item.to);
        fragment.appendChild(node);
      } else if (this.frame >= item.start) {
        if (!item.char || Math.random() < 0.28) {
          item.char = this.chars[Math.floor(Math.random() * this.chars.length)];
        }
        // Scrambled char in a span — created safely via DOM API
        const span = document.createElement('span');
        span.style.opacity = '0.4';
        span.style.color = 'var(--color-primary, #6366f1)';
        span.textContent = item.char; // textContent — no XSS risk
        fragment.appendChild(span);
      } else {
        const node = document.createTextNode(item.from);
        fragment.appendChild(node);
      }
    }

    // Replace all children at once
    this.el.replaceChildren(fragment);

    if (complete === this.queue.length) {
      this.resolve();
    } else {
      this.frameRequest = requestAnimationFrame(this.update);
      this.frame++;
    }
  }
}

// Usage
const el = document.querySelector('.scramble');
const fx = new TextScramble(el);
const phrases = ['Design Engineering', 'Craft + Code', 'Invisible Details'];
let counter = 0;

function scramble() {
  fx.setText(phrases[counter % phrases.length]);
  counter++;
}

scramble(); // Run on load
```

---

## 6. Magnetic Button

Cursor proximity pulls the button toward the cursor. Creates a "gravity" effect. Spring-back on `mouseleave`. Pure vanilla JS, no library.

**When to use:** CTAs, hero buttons, "Get Started" / "Contact Us" — anywhere you want users to feel pulled toward the action.

```html
<div class="magnetic-wrapper">
  <button class="magnetic-btn">
    <span class="magnetic-btn__text">Get Started</span>
  </button>
</div>
```

```css
.magnetic-wrapper {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 40px;
}

.magnetic-btn {
  position: relative;
  padding: 16px 40px;
  background: var(--color-primary, #6366f1);
  color: #fff;
  border: none;
  border-radius: 100px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  transition: transform 400ms cubic-bezier(0.34, 1.56, 0.64, 1),
              box-shadow 300ms ease;
  will-change: transform;
}

.magnetic-btn:hover {
  box-shadow: 0 20px 40px rgba(99, 102, 241, 0.4);
}

.magnetic-btn__text {
  display: block;
  transition: transform 400ms cubic-bezier(0.34, 1.56, 0.64, 1);
}

@media (prefers-reduced-motion: reduce) {
  .magnetic-btn, .magnetic-btn__text {
    transition: none !important;
    transform: none !important;
  }
}
```

```js
const wrapper = document.querySelector('.magnetic-wrapper');
const btn = document.querySelector('.magnetic-btn');
const text = btn.querySelector('.magnetic-btn__text');

const STRENGTH = 0.4;      // Button pull strength (0–1)
const TEXT_STRENGTH = 0.2; // Inner text moves less

const prefersReduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

if (!prefersReduced) {
  wrapper.addEventListener('mousemove', (e) => {
    const rect = btn.getBoundingClientRect();
    const centerX = rect.left + rect.width / 2;
    const centerY = rect.top + rect.height / 2;
    const deltaX = e.clientX - centerX;
    const deltaY = e.clientY - centerY;

    btn.style.transform = `translate(${deltaX * STRENGTH}px, ${deltaY * STRENGTH}px)`;
    text.style.transform = `translate(${deltaX * TEXT_STRENGTH}px, ${deltaY * TEXT_STRENGTH}px)`;
  });

  wrapper.addEventListener('mouseleave', () => {
    btn.style.transform = 'translate(0, 0)';
    text.style.transform = 'translate(0, 0)';
  });
}
```

---

## 7. Animated Gradient Mesh

Multiple radial-gradient orbs with CSS `@keyframes` animating their positions. Creates an organic, living background with zero JS.

**When to use:** Hero backgrounds, loading screens, about sections, premium landing pages. Pairs well with dark themes.

```html
<div class="gradient-mesh">
  <div class="gradient-mesh__orb gradient-mesh__orb--3"></div>
  <div class="gradient-mesh__content">
    <h1>Your Headline</h1>
  </div>
</div>
```

```css
.gradient-mesh {
  position: relative;
  min-height: 100vh;
  background-color: var(--color-bg, #050505);
  overflow: hidden;
  isolation: isolate;
}

/* Orb base styles */
.gradient-mesh::before,
.gradient-mesh::after,
.gradient-mesh__orb {
  position: absolute;
  border-radius: 50%;
  pointer-events: none;
}

/* Orb 1 */
.gradient-mesh::before {
  content: '';
  width: 600px;
  height: 600px;
  background: radial-gradient(circle, var(--orb-1, #6366f1), transparent 70%);
  filter: blur(80px);
  opacity: 0.6;
  mix-blend-mode: screen;
  top: -100px;
  left: -100px;
  animation: orb-move-1 8s ease-in-out infinite alternate;
}

/* Orb 2 */
.gradient-mesh::after {
  content: '';
  width: 500px;
  height: 500px;
  background: radial-gradient(circle, var(--orb-2, #8b5cf6), transparent 70%);
  filter: blur(80px);
  opacity: 0.6;
  mix-blend-mode: screen;
  bottom: -100px;
  right: -100px;
  animation: orb-move-2 10s ease-in-out infinite alternate;
}

/* Orb 3 */
.gradient-mesh__orb--3 {
  width: 400px;
  height: 400px;
  background: radial-gradient(circle, var(--orb-3, #ec4899), transparent 70%);
  filter: blur(60px);
  opacity: 0.4;
  mix-blend-mode: screen;
  top: 40%;
  left: 40%;
  animation: orb-move-3 12s ease-in-out infinite alternate;
}

.gradient-mesh__content {
  position: relative;
  z-index: 1;
  padding: 20vh 10vw;
}

@keyframes orb-move-1 {
  from { transform: translate(0, 0) scale(1); }
  33%  { transform: translate(200px, 100px) scale(1.1); }
  66%  { transform: translate(100px, 300px) scale(0.9); }
  to   { transform: translate(300px, 200px) scale(1.05); }
}

@keyframes orb-move-2 {
  from { transform: translate(0, 0) scale(1.1); }
  33%  { transform: translate(-150px, -200px) scale(0.9); }
  66%  { transform: translate(-300px, -100px) scale(1.15); }
  to   { transform: translate(-200px, -300px) scale(1); }
}

@keyframes orb-move-3 {
  from { transform: translate(0, 0) scale(1); }
  to   { transform: translate(-100px, 150px) scale(1.2); }
}

@media (prefers-reduced-motion: reduce) {
  .gradient-mesh::before,
  .gradient-mesh::after,
  .gradient-mesh__orb { animation: none; }
}
```

---

## 8. Number Counter

Two approaches: JS `requestAnimationFrame` (works everywhere, precise) and CSS `@property` (declarative, future-facing).

**When to use:** Stats sections ("10M+ users", "$2.4B processed"), dashboards, annual reports.

```html
<div class="stats-grid">
  <div class="stat">
    <span class="counter" data-target="10000000" data-prefix="" data-suffix="M+" data-divisor="1000000" data-decimals="1">0</span>
    <span class="stat-label">Users</span>
  </div>
  <div class="stat">
    <span class="counter" data-target="99.9" data-suffix="%" data-decimals="1">0</span>
    <span class="stat-label">Uptime</span>
  </div>
  <div class="stat">
    <span class="counter" data-target="2400" data-prefix="$" data-suffix="B" data-divisor="1000" data-decimals="1">0</span>
    <span class="stat-label">Processed</span>
  </div>
</div>
```

```css
.stats-grid {
  display: flex;
  gap: 48px;
  flex-wrap: wrap;
}

.stat {
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.counter {
  font-size: 3.5rem;
  font-weight: 800;
  color: var(--color-text, #fff);
  font-variant-numeric: tabular-nums;
  line-height: 1;
}

.stat-label {
  font-size: 14px;
  color: var(--color-text-muted, #888);
}
```

```js
function animateCounter(el) {
  const prefersReduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  const rawTarget = parseFloat(el.dataset.target);
  const divisor = parseFloat(el.dataset.divisor || '1');
  const target = rawTarget / divisor;
  const prefix = el.dataset.prefix || '';
  const suffix = el.dataset.suffix || '';
  const decimals = parseInt(el.dataset.decimals || '0');
  const duration = 2000;

  const format = (v) => `${prefix}${v.toFixed(decimals)}${suffix}`;

  if (prefersReduced) {
    el.textContent = format(target);
    return;
  }

  const startTime = performance.now();

  function easeOutQuart(t) {
    return 1 - Math.pow(1 - t, 4);
  }

  function tick(now) {
    const elapsed = now - startTime;
    const progress = Math.min(elapsed / duration, 1);
    const current = target * easeOutQuart(progress);
    el.textContent = format(current);

    if (progress < 1) {
      requestAnimationFrame(tick);
    } else {
      el.textContent = format(target);
    }
  }

  requestAnimationFrame(tick);
}

// Trigger on scroll into view
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      animateCounter(entry.target);
      observer.unobserve(entry.target);
    }
  });
}, { threshold: 0.5 });

document.querySelectorAll('.counter').forEach(el => observer.observe(el));
```

---

## 9. Kinetic Marquee

Infinite horizontal scroll. Reverses direction on hover. Content is duplicated for a seamless loop — no gap at the seam.

**When to use:** Social proof ("As seen in"), client logos, feature tags, testimonial quotes.

```html
<div class="marquee" aria-label="Featured in">
  <div class="marquee__track">
    <span class="marquee__item">TechCrunch</span>
    <span class="marquee__item">Product Hunt</span>
    <span class="marquee__item">Forbes</span>
    <span class="marquee__item">Wired</span>
    <span class="marquee__item">The Verge</span>
    <!-- Duplicate set for seamless loop — aria-hidden on clones -->
    <span class="marquee__item" aria-hidden="true">TechCrunch</span>
    <span class="marquee__item" aria-hidden="true">Product Hunt</span>
    <span class="marquee__item" aria-hidden="true">Forbes</span>
    <span class="marquee__item" aria-hidden="true">Wired</span>
    <span class="marquee__item" aria-hidden="true">The Verge</span>
  </div>
</div>
```

```css
.marquee {
  overflow: hidden;
  mask-image: linear-gradient(
    to right,
    transparent,
    black 10%,
    black 90%,
    transparent
  );
  -webkit-mask-image: linear-gradient(
    to right,
    transparent,
    black 10%,
    black 90%,
    transparent
  );
}

.marquee__track {
  display: flex;
  width: max-content;
  align-items: center;
  gap: 48px;
  animation: marquee-scroll 20s linear infinite;
}

.marquee:hover .marquee__track {
  animation-direction: reverse;
}

.marquee:focus-within .marquee__track {
  animation-play-state: paused;
}

.marquee__item {
  font-size: 18px;
  font-weight: 600;
  color: var(--color-text-muted, #666);
  white-space: nowrap;
  padding: 8px 0;
  transition: color 200ms ease;
}

.marquee__item:hover {
  color: var(--color-text, #fff);
}

@keyframes marquee-scroll {
  from { transform: translateX(0); }
  to   { transform: translateX(-50%); } /* Half = duplicate set */
}

@media (prefers-reduced-motion: reduce) {
  .marquee__track { animation: none; }
  .marquee { mask-image: none; -webkit-mask-image: none; }
}
```

```js
// Optional: speed up marquee when page is scrolling fast
let lastScrollY = window.scrollY;
const track = document.querySelector('.marquee__track');

const prefersReduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

if (!prefersReduced && track) {
  window.addEventListener('scroll', () => {
    const delta = Math.abs(window.scrollY - lastScrollY);
    lastScrollY = window.scrollY;

    const speed = Math.max(5, 20 - delta * 0.5);
    track.style.animationDuration = `${speed}s`;

    clearTimeout(window._marqueeReset);
    window._marqueeReset = setTimeout(() => {
      track.style.animationDuration = '20s';
    }, 200);
  }, { passive: true });
}
```

---

## 10. Sticky Scroll Stack

Cards layer on top of each other as you scroll. Each card is `position: sticky` with incrementing `top` values. Later cards stack over earlier ones with scale transforms for depth.

**When to use:** Feature walkthroughs, step-by-step explanations, case studies with progression, "how it works" sections.

```html
<section class="stack-section">
  <div class="stack-card" style="--i: 0; --bg: #6366f1">
    <div class="stack-card__inner">
      <span class="stack-card__step">01</span>
      <h3>Define the problem</h3>
      <p>Start with the user's real pain point, not the solution.</p>
    </div>
  </div>
  <div class="stack-card" style="--i: 1; --bg: #8b5cf6">
    <div class="stack-card__inner">
      <span class="stack-card__step">02</span>
      <h3>Map the journey</h3>
      <p>Understand every touchpoint from first impression to conversion.</p>
    </div>
  </div>
  <div class="stack-card" style="--i: 2; --bg: #ec4899">
    <div class="stack-card__inner">
      <span class="stack-card__step">03</span>
      <h3>Ship and measure</h3>
      <p>Launch fast, instrument everything, iterate based on data.</p>
    </div>
  </div>
  <div class="stack-card" style="--i: 3; --bg: #f59e0b">
    <div class="stack-card__inner">
      <span class="stack-card__step">04</span>
      <h3>Double down</h3>
      <p>Find what works and do more of it. Ruthlessly cut the rest.</p>
    </div>
  </div>
</section>
```

```css
.stack-section {
  padding-bottom: 30vh;
}

.stack-card {
  position: sticky;
  top: calc(80px + var(--i) * 20px);
  height: 400px;
  margin-bottom: 24px;
}

.stack-card__inner {
  height: 100%;
  padding: 48px;
  background: var(--bg, #6366f1);
  border-radius: 20px;
  color: #fff;
  /* Cards earlier in the stack appear slightly smaller */
  transform: scale(calc(1 - var(--i) * 0.02));
  transform-origin: top center;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
  transition: transform 400ms cubic-bezier(0.23, 1, 0.32, 1);
}

.stack-card__step {
  display: block;
  font-size: 13px;
  font-weight: 700;
  letter-spacing: 0.1em;
  opacity: 0.7;
  margin-bottom: 16px;
}

.stack-card__inner h3 {
  font-size: 2rem;
  font-weight: 700;
  margin: 0 0 12px;
}

.stack-card__inner p {
  font-size: 1.1rem;
  opacity: 0.85;
  max-width: 40ch;
  line-height: 1.6;
}

@media (prefers-reduced-motion: reduce) {
  .stack-card__inner {
    transform: none;
    transition: none;
  }
}
```

```js
// Optional: dynamically increase scale reduction as cards get buried
const cards = document.querySelectorAll('.stack-card');
const prefersReduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

if (!prefersReduced) {
  window.addEventListener('scroll', () => {
    cards.forEach((card) => {
      const index = parseInt(card.style.getPropertyValue('--i') || '0');
      const rect = card.getBoundingClientRect();
      const stickyTop = 80 + index * 20;
      const isStuck = rect.top <= stickyTop + 1;

      if (isStuck) {
        // Count cards currently stacked above this one
        const stackedAbove = Array.from(cards).slice(index + 1).filter(c => {
          const cTop = c.getBoundingClientRect().top;
          const cIndex = parseInt(c.style.getPropertyValue('--i') || '0');
          return cTop <= 80 + cIndex * 20 + 1;
        }).length;

        const scale = Math.max(0.85, 1 - (index * 0.02) - (stackedAbove * 0.01));
        card.querySelector('.stack-card__inner').style.transform = `scale(${scale})`;
      }
    });
  }, { passive: true });
}
```
