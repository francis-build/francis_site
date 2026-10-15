---
target: francis_site landing page
total_score: 24
max_score: 32
na_heuristics: 7,10
p0_count: 0
p1_count: 3
target_identity: "file:/Users/filipecabaco/Documents/workspace/francis_site/priv/templates/index.html.eex"
target_fingerprint: "sha256:006faa9444635d22086380da86f4b43426c27d53230597598a6a41905614d85e"
target_path: /Users/filipecabaco/Documents/workspace/francis_site/priv/templates/index.html.eex
timestamp: 2026-10-15T15-13-21Z
slug: priv-templates-index-html-eex
---
# Critique: francis_site landing page (priv/templates/index.html.eex)

Method: dual-agent (A: design review · B: detector + browser evidence). Mode: Persuade. Scope: review only, design kept as is.

## Design Health Score
| # | Heuristic | Score | Key Issue |
|---|---|---|---|
| 1 | Visibility of System Status | 2 | Copy button always says "copied" (no failure path, no aria-live); version pill renders as an empty capsule until hex.pm answers |
| 2 | Match System / Real World | 4 | Real mix commands, idiomatic Elixir |
| 3 | User Control and Freedom | 3 | Every external link opens a new tab unannounced |
| 4 | Consistency and Standards | 3 | Only "Read the docs" carries the external-link arrow |
| 5 | Error Prevention | 3 | One copy button covers two separate steps |
| 6 | Recognition Rather Than Recall | 4 | Everything visible, nothing hidden |
| 7 | Flexibility and Efficiency | n/a | Single-page pitch, no expert paths needed |
| 8 | Aesthetic and Minimalist Design | 4 | No filler |
| 9 | Error Recovery | 1 | No fallback when clipboard or the hex.pm fetch fails |
| 10 | Help and Documentation | n/a | Correctly defers to hexdocs |
| **Total** | | **24/32** | **Good (75%)** |

## Design Specificity Verdict
Mostly authored. "Honest about scope", the ~30 sec / ~2 min timings and the code-first primitives ledger are unmistakably Francis. The hero is the interchangeable part: mono wordmark + Nunito headline + two links; the hat appears once at 2rem and the slate tint lives only in the hero band.
Deterministic scan: CLI detector skips .eex (exit 0, no output); on an .html copy it reported one false positive (flat-type-hierarchy, caused by the unresolved EEx stylesheet). Browser overlay: 7 findings: tight-leading on the 36px hero line (false positive for display text), line-length ~109 cpl on the 12px primitive notes (x5, real but low impact) and ~106 cpl on the scope paragraph (real).

## Priority Issues
- [P1] Primitive notes fail the page's own WCAG AAA target: .primitive-note is gray-500 at 12px, 4.84:1 (AAA needs 7:1); hljs comments ~4.8:1. Fix: text-gray-700 + text-sm, override .hljs-comment ~#4b5563. Command: audit, typeset.
- [P1] highlight.js github theme beats the app.css .hljs reset: double panel everywhere; on mobile 4/8 code blocks clip (e.g. 472px in 342px) with no scroll cue. Fix: target `pre code.hljs` in app.css or load the theme before Tailwind; shorten/wrap long lines. Command: polish, adapt.
- [P1] The site advertises Francis.Plug.SecureHeaders and CSP but serves neither (no CSP, X-Content-Type-Options, X-Frame-Options, Referrer-Policy, HSTS). Fix: add both plugs with a CSP allowing self, fonts.googleapis/gstatic, cdnjs and connect-src hex.pm. Command: harden.
- [P2] Copy buttons claim success unconditionally, are 45x24 (under 44px), overlap the first command on mobile, and are dead without JS. Fix: then/catch with honest message, aria-live status, 44px hit area, right padding on the pre. Command: harden.
- [P2] Third-party fragility and weight: empty version pill on slow/blocked hex.pm, render-blocking Google Fonts + cdnjs, 77.5 KB hat PNG shown at ~40px (largest asset). Fix: render version server-side or keep pill hidden until filled, self-host Nunito 400/700 and highlight.js, ship the hat as SVG/WebP. Command: optimize.

## Persona Red Flags
- Jordan (new to Elixir): "DSL", "Bandit", "Plug" before any explanation; no "needs Elixir installed" hint; the explanatory notes are the least readable text.
- Riley (stress tester): no JS = dead copy buttons + empty pill; "copied" can be false; mobile code silently clipped.
- Casey (mobile, slow): four cross-origin render-blocking assets, 24px copy target, pill flash, 77 KB icon.
- Experienced Elixir dev (<2 min decision): served well, but no complete runnable app anywhere, only fragments.

## Minor Observations
- h1 is just "Francis"; the pitch is a <p>, so outlines get a name, not the value.
- Scope paragraph runs ~106 cpl; cap with max-w-prose.
- No skip link; 8 focusable <pre> before the Phoenix link. Default focus rings only.
- Colour transitions have no prefers-reduced-motion guard (PRODUCT.md asks for it).
- "Nothing more than you need." in gray-700 reads weaker than the first clause.
- SSE example mirrors WS so closely it hides that SSE is server-push only.
- Read-the-docs arrow SVG lacks aria-hidden; Nunito 500/600 downloaded but unused.

## Questions to Consider
- If code is the argument, why is there no complete 6-line app on the page?
- Should the hat appear more than once on a page about personality through restraint?
- Would "3 primitives, plus everything Plug gives you" be the more honest framing than "6 primitives"?
