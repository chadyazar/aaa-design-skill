# CSS Mermaid Patterns
> Mermaid container centering (required), scaling small diagrams, zoom controls with full JS.
> CSS overrides on Mermaid SVG elements. Connectors: CSS arrows and SVG curved paths.
> Always wrap Mermaid in .mermaid-container with overflow handling.

## Mermaid Containers

Mermaid diagrams have two common layout issues: they render too small to read, and they left-align in their container leaving awkward dead space (especially for narrow vertical flowcharts).

### Centering (Required)

Mermaid SVGs render at a fixed size based on content. Without explicit centering, they default to top-left alignment. **Always center Mermaid diagrams** — narrow vertical flowcharts look particularly bad when left-aligned in a wide container.

```css
/* WRONG — diagram hugs left edge */
.mermaid-container {
  padding: 24px;
  border: 1px solid var(--border);
}

/* RIGHT — diagram centers in container */
.mermaid-wrap {
  display: flex;
  justify-content: center;
  align-items: flex-start;  /* or center for shorter diagrams */
  padding: 24px;
  border: 1px solid var(--border);
}
```

### Scaling Small Diagrams

Mermaid sizes diagrams based on content, not container. Complex diagrams with many nodes render small to fit everything, leaving the text nearly unreadable. Three fixes:

**1. Increase fontSize in themeVariables** (most effective):
```javascript
mermaid.initialize({
  theme: 'base',
  themeVariables: {
    fontSize: '18px',  // default is 16px, bump to 18-20px for complex diagrams
  }
});
```

**2. CSS zoom** for diagrams that still render too small:
```css
.mermaid-wrap--scaled .mermaid {
  zoom: 1.3;
}
```

**3. Constrain container width** so the diagram doesn't float in dead space:
```css
.mermaid-wrap--constrained {
  max-width: 800px;
  margin: 0 auto;
}
```

**Rule of thumb:** If the diagram has 10+ nodes or the text is smaller than 12px rendered, increase fontSize to 18-20px or apply CSS zoom.

### Zoom Controls

Add zoom controls to every `.mermaid-wrap` container for complex diagrams.

**Small diagrams in slides.** If a diagram has fewer than ~7 nodes with no branching, it will render tiny in a full-viewport slide container. For simple linear flows (A → B → C → D), use CSS pipeline cards instead of Mermaid — see `slide-patterns.md` "CSS Pipeline Slide." Reserve Mermaid for complex graphs where automatic edge routing is actually needed.

### Full Pattern

```css
.mermaid-wrap {
  position: relative;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 12px;
  padding: 32px 24px;
  overflow: auto;
  /* CRITICAL: center the diagram both horizontally and vertically */
  display: flex;
  justify-content: center;
  align-items: center;
  /* Prevent vertical flowcharts from compressing into unreadable thumbnails */
  min-height: 400px;
  scrollbar-width: thin;
  scrollbar-color: var(--border) transparent;
}
.mermaid-wrap::-webkit-scrollbar { width: 6px; height: 6px; }
.mermaid-wrap::-webkit-scrollbar-track { background: transparent; }
.mermaid-wrap::-webkit-scrollbar-thumb { background: var(--border); border-radius: 3px; }
.mermaid-wrap::-webkit-scrollbar-thumb:hover { background: var(--text-dim); }

/* For shorter diagrams that don't need the full height */
.mermaid-wrap--compact { min-height: 200px; }

/* For very tall vertical flowcharts */
.mermaid-wrap--tall { min-height: 600px; }

.mermaid-wrap .mermaid {
  /* Use CSS zoom instead of transform: scale().
     Zoom changes actual layout size, so overflow scrolls normally in all directions.
     Transform only changes visual appearance — content expanding upward/leftward
     goes into negative space which can't be scrolled to.
     Supported in all browsers (Firefox added support in v126, June 2024).
     Note: zoom is not animatable, so no transition. */
  /* Optional: start at >1 for complex diagrams that render too small.
     The diagram stays centered, renders larger, and zoom controls still work. */
  zoom: 1.4;
}

.zoom-controls {
  position: absolute;
  top: 8px;
  right: 8px;
  display: flex;
  gap: 2px;
  z-index: 10;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 6px;
  padding: 2px;
}

.zoom-controls button {
  width: 28px;
  height: 28px;
  border: none;
  background: transparent;
  color: var(--text-dim);
  font-family: var(--font-mono);
  font-size: 14px;
  cursor: pointer;
  border-radius: 4px;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: background 0.15s ease, color 0.15s ease;
}

.zoom-controls button:hover {
  background: var(--border);
  color: var(--text);
}

.mermaid-wrap { cursor: grab; }
.mermaid-wrap.is-panning { cursor: grabbing; user-select: none; }
```

**Why zoom instead of transform?**

CSS `transform: scale()` only changes visual appearance — the element's layout box stays the same size. When you scale from `center center`, content expands upward and leftward into negative coordinate space. Scroll containers can't scroll to negative positions, so the top and left of the zoomed content get clipped.

CSS `zoom` actually changes the element's layout size. The content grows downward and rightward like any other growing element, staying fully scrollable.

### HTML

```html
<div class="mermaid-wrap">
  <div class="zoom-controls">
    <button onclick="zoomDiagram(this, 1.2)" title="Zoom in">+</button>
    <button onclick="zoomDiagram(this, 0.8)" title="Zoom out">&minus;</button>
    <button onclick="resetZoom(this)" title="Reset zoom">&#8634;</button>
    <button onclick="openDiagramFullscreen(this)" title="Open full size in new tab">&#x26F6;</button>
  </div>
  <pre class="mermaid">
    graph TD
      A --> B
  </pre>
</div>
```

**Click to expand.** Clicking anywhere on the diagram (without dragging) opens it full-size in a new tab. The expand button (⛶) in the zoom controls does the same thing.

### JavaScript

Add once at the end of the page. Handles button clicks and scroll-to-zoom on all `.mermaid-wrap` containers:

```javascript
// Match this to the CSS zoom value (or 1 if not set)
var INITIAL_ZOOM = 1.4;

function zoomDiagram(btn, factor) {
  var wrap = btn.closest('.mermaid-wrap');
  var target = wrap.querySelector('.mermaid');
  var current = parseFloat(target.dataset.zoom || INITIAL_ZOOM);
  var next = Math.min(Math.max(current * factor, 0.5), 5);
  target.dataset.zoom = next;
  target.style.zoom = next;
}

function resetZoom(btn) {
  var wrap = btn.closest('.mermaid-wrap');
  var target = wrap.querySelector('.mermaid');
  target.dataset.zoom = INITIAL_ZOOM;
  target.style.zoom = INITIAL_ZOOM;
}

function openDiagramFullscreen(btn) {
  var wrap = btn.closest('.mermaid-wrap');
  openMermaidInNewTab(wrap);
}

function openMermaidInNewTab(wrap) {
  var svg = wrap.querySelector('.mermaid svg');
  if (!svg) return;

  // Clone the SVG and remove any inline transforms from zoom
  var clone = svg.cloneNode(true);
  clone.style.zoom = '';
  clone.style.transform = '';

  // Get computed styles for theming
  var styles = getComputedStyle(document.documentElement);
  var bg = styles.getPropertyValue('--bg').trim() || '#ffffff';

  // Build standalone HTML page
  var html = '<!DOCTYPE html>' +
    '<html lang="en"><head><meta charset="UTF-8">' +
    '<meta name="viewport" content="width=device-width, initial-scale=1.0">' +
    '<title>Diagram</title>' +
    '<style>' +
    'body { margin: 0; min-height: 100vh; display: flex; align-items: center; justify-content: center; background: ' + bg + '; padding: 40px; box-sizing: border-box; }' +
    'svg { max-width: 100%; max-height: 90vh; height: auto; }' +
    '</style></head><body>' +
    clone.outerHTML +
    '</body></html>';

  var blob = new Blob([html], { type: 'text/html' });
  var url = URL.createObjectURL(blob);
  window.open(url, '_blank');
}

document.querySelectorAll('.mermaid-wrap').forEach(function(wrap) {
  // Ctrl/Cmd + scroll to zoom
  wrap.addEventListener('wheel', function(e) {
    if (!e.ctrlKey && !e.metaKey) return;
    e.preventDefault();
    var target = wrap.querySelector('.mermaid');
    var current = parseFloat(target.dataset.zoom || INITIAL_ZOOM);
    var factor = e.deltaY < 0 ? 1.1 : 0.9;
    var next = Math.min(Math.max(current * factor, 0.5), 5);
    target.dataset.zoom = next;
    target.style.zoom = next;
  }, { passive: false });

  // Click-and-drag to pan, click (without drag) to open full-size
  var startX, startY, scrollL, scrollT, startTime, didPan;
  wrap.addEventListener('mousedown', function(e) {
    if (e.target.closest('.zoom-controls')) return;
    wrap.classList.add('is-panning');
    startX = e.clientX;
    startY = e.clientY;
    scrollL = wrap.scrollLeft;
    scrollT = wrap.scrollTop;
    startTime = Date.now();
    didPan = false;
  });
  window.addEventListener('mousemove', function(e) {
    if (!wrap.classList.contains('is-panning')) return;
    var dx = e.clientX - startX;
    var dy = e.clientY - startY;
    if (Math.abs(dx) > 5 || Math.abs(dy) > 5) didPan = true;
    wrap.scrollLeft = scrollL - dx;
    wrap.scrollTop = scrollT - dy;
  });
  window.addEventListener('mouseup', function() {
    if (!wrap.classList.contains('is-panning')) return;
    wrap.classList.remove('is-panning');
    // If click was quick and didn't move much, open full-size
    var elapsed = Date.now() - startTime;
    if (!didPan && elapsed < 300) {
      openMermaidInNewTab(wrap);
    }
  });
});
```

Scroll-to-zoom requires Ctrl/Cmd+scroll to avoid hijacking normal page scroll. Cursor changes to `grab`/`grabbing` to signal pan mode. The zoom range is capped at 0.5x–5x. **Clicking without dragging opens the diagram full-size in a new browser tab.**
