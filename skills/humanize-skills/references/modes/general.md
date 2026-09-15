# Mode: general (default)

For anything that isn't one of the other nine purpose modes: blog posts, essays,
emails, reports, memos, documentation prose, and everyday writing with no
specialist register. This is the mode the router (`SKILL.md`) falls back to when
no flag is given and nothing in the context implies another mode — so it has to
be the most honest version of the base engine, not the emptiest file.

## Core principle

Full base rulebook, no domain exceptions. Apply `references/core-rules.md` and
`references/structural-pass.md` in full, gated only by whatever register table
the active language file (`references/languages/{lang}.md`) provides — a
general-mode blog post and a general-mode formal letter still call for different
intensities, and that gating lives in the language file, not here. Where a
specialist mode preserves something this mode would strip (academic hedging,
legal terms of art, technical procedure structure), general mode strips it,
subject always to the fact-lock: never invent, never overclaim, never launder
an uncertain claim into a confident one.

## What this mode preserves

- **The author's register, within the language file's range.** Informal stays
  informal, formal stays formal — the pass removes formulaic scaffolding, not
  the writer's own level of polish. Contractions, fragments, and direct address
  are normal here, not tells to fix.
- **Calibrated uncertainty.** One honest hedge per genuinely uncertain claim
  survives (`core-rules.md` §5). What gets cut is hedge-*stacking* and reflexive
  insurance, not the single qualifier a fragile point needs.
- **Small human imperfections.** Per the noise budget in `SKILL.md`: a comma
  splice that carries voice, an aside that wanders slightly, uneven confidence
  across the piece. Do not sterilize these into a new uniform smoothness — that
  is the injection failure `core-rules.md` §6 exists to catch.

## Tells this mode leans on hardest

All of `core-rules.md` applies, but general-mode input clusters these most
often — check them first:

- **Formulaic openers** ("In today's fast-paced…", "In the modern world…") and
  **tidy summary closes** ("Ultimately, the future of X is here"). Cut the
  opener to the actual point; cut the close unless it contains something new.
- **Negative parallelism** ("not just X, but Y") more than once per piece, and
  **reflexive triads** — vary the count.
- **Unsupported "-ing" tails** ("…highlighting its importance") and **inflated
  copulas** ("serves as," "stands as a testament to") — say "is" when that's
  what's meant.
- **Vague attribution** ("experts say," "studies show") — name the source or
  drop the claim; where the claim matters but the source is missing, flag the
  gap explicitly rather than reconstructing it.
- **Chatbot residue** (`core-rules.md` §4): greetings, sign-offs, cutoff
  hedging, placeholders, foreign citation artifacts. Delete silently.

## Rhythm

Vary sentence length deliberately within a paragraph and diversify how
consecutive sentences open (`core-rules.md` §0 — the highest-leverage move in
the engine). Fragments and one-sentence paragraphs are allowed here where a
specialist mode might forbid them, but budget them: one punchy close per text,
not one per paragraph, or the punch becomes its own uniform.

## Voice

Without supplied samples, edit toward a neutral human baseline — plain,
specific, uneven in the ways `references/structural-pass.md` describes. With
samples (`--calibrate`), match the requester's median habits per
`references/voice-calibration.md`, including the warning there: a profile built
only from someone's strongest passages produces a caricature, not their voice.

## Structural pass

Full. General-mode prose has no genre exemption — run all six checks in
`references/structural-pass.md` one at a time, pick one or two interventions
per piece, and vary the fix across a body of work so the repairs don't converge
into a new house style (the trap).

## Output

Normal passages: the rewritten text first, then a change report scaled to the
edit (one line for a sentence, a few short bullets for a paragraph) — no
preamble, no editorialising about the input. Long documents and files: defer to
the Document rules in `SKILL.md` (audit first, freeze structure, per-section
no-edit gate, changed spans only).

## Sources

No dedicated source repo in the survey covers "general writing" as a register —
this file is distilled from this engine's own base rules, the unslop three-level
shape (typography → vocabulary → structure/epistemics), and the field survey's
subtractive-editing finding that motivates the no-edit gate. It says so here
rather than borrowing authority it doesn't have, like `resume.md`, `ux.md`, and
`creative.md`.
