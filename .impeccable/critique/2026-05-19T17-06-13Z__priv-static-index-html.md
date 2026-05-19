---
target: priv/static/index.html
total_score: 29
p0_count: 1
p1_count: 2
timestamp: 2026-05-19T17-06-13Z
slug: priv-static-index-html
---
## Design Health Score

| # | Heuristic | Score | Key Issue |
|---|-----------|-------|-----------|
| 1 | Visibility of System Status | 3/4 | Static page; nothing async to fail, but the page communicates its purpose clearly |
| 2 | Match System / Real World | 3/4 | "DSL" in the tagline is unexplained jargon for the secondary audience (Elixir newcomers) |
| 3 | User Control and Freedom | 4/4 | Links open in new tabs, no traps, static surface |
| 4 | Consistency and Standards | 3/4 | Section header labels and feature card labels share identical styles despite different hierarchy roles |
| 5 | Error Prevention | 3/4 | Static page; copy-only risk is mis-typing commands, mitigated by the pre blocks |
| 6 | Recognition Rather Than Recall | 3/4 | Everything on one page; nothing hidden |
| 7 | Flexibility and Efficiency | 2/4 | No copy buttons on code blocks; no anchor links; developer audience expects one-click copy |
| 8 | Aesthetic and Minimalist Design | 2/4 | Identical card grid, zero color identity, two explicit brand bans triggered |
| 9 | Help Users Recover from Errors | 3/4 | Static; N/A mostly; external links are clearly labeled |
| 10 | Help and Documentation | 3/4 | hexdocs linked; could surface it higher and earlier |
| **Total** | | **29/40** | **Good — address weak areas, solid foundation** |

## Anti-Patterns Verdict

**LLM assessment:** Partially AI-looking. The layout avoids the worst offenders but fails the second-order slop test. "Minimal dev tool landing page, monospace font, gray-on-white, tiny uppercase section labels, four bordered cards" is saturated enough to read as template. Two explicit brand-register bans triggered: (1) monospace as costume applied to the full body, (2) repeated tiny uppercase tracked labels on every single section — seven instances across a 100-line page.

**Deterministic scan:** CLI detector binary unavailable. Manual HTML scan: no tabindex="0" on scrollable pre elements, no copy affordance on code blocks, "this site" footer anchor is ambiguous.

**Visual overlays:** Browser automation not available. No overlay injection attempted.

## Overall Impression

The bones are right: honest content, real code, focused structure. But the design has no identity. It's a generic developer landing page wearing a monospace font as a costume. The biggest single opportunity is color: this page has none, and brand surfaces require a committed strategy.

## What's Working

1. **Content discipline.** Four sections, no fluff, scannable in under 30 seconds.
2. **Code example quality.** Real, concise Elixir directly delivers "show, don't tell."
3. **Structural restraint.** No hero CTA, no email capture, no social proof padding.

## Priority Issues

**[P0] WCAG AAA contrast failures across multiple elements**
- text-gray-400 on white is ~2.9:1. Fails AA, fails AAA (7:1 required). Feature card labels use text-xs text-gray-400 — smallest text at lowest contrast.
- Fix: Replace text-gray-400 labels with text-gray-700 minimum. Replace text-gray-500 with text-gray-700.
- Command: /impeccable audit

**[P1] Zero brand color on a brand surface**
- Entire page is white + five gray values. No hue anywhere. No visual identity.
- Fix: Extract dominant hue from icon. Apply Committed color strategy to hero area or code block backgrounds.
- Command: /impeccable colorize

**[P1] Two brand-register bans triggered simultaneously**
- (a) Monospace as full-body font. (b) Repeated tiny uppercase tracked labels on every section — 7 instances.
- Fix: Reserve font-mono for code blocks. Use a sans for body/tagline. Pick one place for the uppercase label pattern; drop it everywhere else.
- Command: /impeccable typeset

**[P2] Identical card grid in features section**
- Four cards: same border, same padding, same label style. Completely undifferentiated. Treats HTTP Actions and Static Files as equally interesting.
- Fix: Break identical grid. Give HTTP Actions visual prominence. Consider removing card borders entirely.
- Command: /impeccable layout

**[P2] Information sequence fails newcomer audience**
- Install commands appear before feature context. Newcomers are asked to act before understanding.
- Fix: Add one sentence of context before "Get started," or reorder features before commands.
- Command: /impeccable craft

## Persona Red Flags

**Jordan (First-Timer):** "DSL" jargon unexplained. No prerequisites context for install commands. No reassurance moment. Tagline doesn't answer "is this for me?"

**Casey (Mobile User):** text-xs text-gray-400 labels functionally invisible on phone screens. Multi-line pre blocks require horizontal scroll on mobile. No copy-to-clipboard on install/deploy commands.

**The Elixir Evaluator (project-specific):** No version or maturity signal. No comparison against raw Plug.Router. "this site" footer link reads as in-joke noise.

## Minor Observations

- br inside tagline paragraph creates forced line break awkward on wider screens.
- alt="Francis" on icon restates product name; should be "Francis logo" or empty if decorative.
- "this site" footer link only meaningful to existing Francis users; noise for everyone else.
- No scroll-linked behavior — fine, but worth a conscious decision.
