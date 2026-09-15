# Reviewer Guide — the two asks that unblock 0.1.0

Everything mechanical is done. What remains needs human eyes: a blind pass over
the fixtures and native-speaker review of the catalogs. This file is the
outbound ask for both — copy, fill the brackets, send. Submission templates live
in `.github/ISSUE_TEMPLATE/`; the protocols live in
`skills/humanize-skills/references/examples/README.md` (blind) and
`CONTRIBUTING.md` (catalog).

## Ask 1 — blind forced-choice review (any fluent reader, 15 minutes)

> I'm looking for 3 volunteers to judge writing samples — no expertise needed,
> just native-level fluency in [LANGUAGE]. I'll show you pairs of short texts
> labeled A and B; for each pair you pick which one was touched by an automated
> writing tool (you must pick one — "can't tell" counts against us). 10 minutes,
> async, no call. The texts are synthetic — no real people or companies appear.

Rules for the maintainer running it:

- The reviewer must NOT have written the fixture. Strip all labels first —
  randomize A/B order per case. A reviewer who knows which text is "the
  humanized one" will rationalize its tells; that bias is exactly what the
  protocol removes.
- For normal cases the pair is Input vs Reference-after (key: Input).
  For no-edit cases the pair is Input vs the deliberately over-edited version
  (key: over-edited). Keys live in each fixture file.
- A case passes only at 3/3 agreement with the key. Log every pick in
  `references/examples/BLIND-RESULTS.md` using the blind-review-results issue
  format. A failure is a finding, not an embarrassment — record *why* they
  picked what they did; that sentence is usually the fix.

## Ask 2 — native catalog review (one speaker per language, 30–60 minutes)

> I'm looking for a native or near-native [LANGUAGE] writer to review a style
> rulebook (about 150 lines) plus two short before/after examples. Three
> questions: (1) does the AI-slop input read like actual AI-generated [LANGUAGE]
> text? (2) does the "after" read like something a real person would write?
> (3) is any rule wrong, or is a real tell missing? Priority languages right
> now: Dutch, Thai (built with no source material — be blunt), Arabic, Hindi,
> Persian (script/layout comments especially welcome), then the rest.

Priority order (also in CONTRIBUTING.md): `nl`, `th` → `ar`, `hi`, `fa` →
`vi`, `pl`, `id`, `uk`, `pt`, `it` → tier-1 spot-checks (`en`, `zh`, `es`,
`de`, `fr`, `ru`, `ja`, `tr`, `ko`).

Concrete rule changes are best as a PR against
`skills/humanize-skills/references/languages/{code}.md` with a one-line note in
`references/examples/CHANGELOG.md`. Pure prose feedback ("the after sounds
translated") is equally welcome as an issue — the maintainer will redraft.

## What NOT to ask

- Do not ask reviewers to run detectors over the fixtures. Detector scores are
  not the gate and never were (see `SKILL.md` honest framing) — the blind
  forced-choice pick is the verdict.
- Do not ask non-speakers to review non-English fixtures for "correctness."
  A non-speaker CAN run the blind protocol on any language (the pick is "which
  was machine-touched," answerable from the key's reasoning), but only a
  speaker can judge whether the after reads native.
- Do not batch all 39 fixtures to one volunteer. One file per reviewer keeps
  judgments fresh; fatigue converges picks toward chance and hides real tells.
