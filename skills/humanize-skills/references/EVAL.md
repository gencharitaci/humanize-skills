# EVAL — Independent Output Evaluation

The human blind forced-choice check (`examples/README.md`) is the gold standard
and the gate for `0.1.0`. This file is its complement, not its replacement: an
LLM-as-judge rubric for scoring a (original, humanized-output) pair when no
human reviewer is at hand — after a rule change, during development, or as a
second opinion alongside a blind run.

## Anti-bias rules

- Run this in a **separate call** from the one that produced the output, with
  the output pasted in — never let the evaluator grade its own rewrite.
- The evaluator loads the same rule files the rewrite used (`core-rules.md`,
  `structural-pass.md`, the one language file, the one mode file). A judge
  without the rules is just vibes.
- Triangulate: EVAL score + human blind pick + (optionally) an external
  detector score. If EVAL says 95 and the blind judge picks the reference-after
  as machine-touched, the blind judge wins — investigate the injected tell.

## Metrics (5 dimensions, 0–10 each)

### 1. Marker removal (MR)

How many documented tells present in the original remain in the output? Count
per pre-flight category (opener, banned vocab, repeated transitions, hedge
stacking, summary close, symmetrical paragraphs, pileups, padding/residue).
10 = all cleared; −2 per surviving category (floor 0).

### 2. Fact-lock compliance (FL)

The non-negotiable, scored heaviest by convention: no invented name, number,
date, quote, citation, or example; every number/citation/equation byte-identical
unless the request explicitly scoped it; claim strength never exceeds evidence;
missing specifics flagged, never reconstructed. 10 = clean; any single invented
specific = 0 outright, fail the whole EVAL regardless of the other four.

### 3. Rhythm compliance (RC)

`core-rules.md` §0 as a checklist: no three consecutive sentences in one length
category; no three with one clause count; no sentence over 3 clauses (one
~300-word exception allowed); no three same-weight paragraphs; no three
identical opener types. 10 = zero violations; −2 per violation (floor 0).
Short texts (under ~60 words): one same-category triplet permitted — hooks live
there, and social/short-form registers run short by design. Score 10 if that
triplet is the only violation.

### 4. Clean-slop scan (CS)

`core-rules.md` §6 as a checklist: no replacement tic carried across the edit;
≤1 aphoristic paragraph-close; at least one slack sentence in texts over ~300
words; outline test passes (first sentences don't form a tidy summary, unless
exempt format); plain verbs and honest qualifiers preserved, not sanded off.
10 = clean; −2 per miss (floor 0).

### 5. Gate judgment (GJ)

Was editing warranted at all, and did the output match that call? Normal case:
edit warranted and delivered at the requested volume. No-edit case: output is
"no change" (a deliberately over-edited foil must read as tampered next to the
input). Document mode: per-section calls correct (clean sections reported "no
change" and skipped). 10 = right call everywhere; 5 = right call, wrong volume;
0 = edited what should have stood, or stood what needed editing.

## Composite

```
COMPOSITE = MR + FL + RC + CS + GJ   (max 50; FL=0 fails outright)
```

| Score | Rating | Action |
|---|---|---|
| 45–50 | Excellent | Ship it |
| 38–44 | Good | Note the deductions, acceptable |
| 30–37 | Fair | Re-run the failing dimension's stage |
| 0–29 or FL=0 | Fail | Do not ship; fix and re-evaluate |

## Output format

```
[EVAL REPORT]
Input: {what it was} | Mode: {mode} | Language: {lang} | Volume: {volume}
MR: {n}/10 — {one line}
FL: {n}/10 — {one line, or the invented specific}
RC: {n}/10 — {one line}
CS: {n}/10 — {one line}
GJ: {n}/10 — {one line}
COMPOSITE: {n}/50 — {rating}
[ISSUES] {bullets, only for deductions}
```

## Usage

```
Evaluate this humanized output against its original per references/EVAL.md.
Rules used: {core + structural + {lang}.md + {mode}.md}.

ORIGINAL:
{original}

OUTPUT:
{the skill's output}
```
