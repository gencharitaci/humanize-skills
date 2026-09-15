# en-general — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Any
> change-magnitude percentage below is a rough eyeball estimate, not measured (no scanner).


Default mode. Full `core-rules.md` + `structural-pass.md`, no purpose overrides.

---

## Case 1 — AI-slop blog paragraph, edit warranted

**Setup:** "Make this sound less like ChatGPT." No flags. General mode, English.

**Input:**
> In today's fast-paced digital landscape, remote work has fundamentally transformed
> how teams collaborate. It's not just a trend — it's a revolution. Companies that
> embrace this shift are unlocking unprecedented levels of productivity, while those
> that resist risk being left behind. Studies show that remote employees are often
> more engaged and satisfied. Ultimately, the future of work is here, and it's
> flexible, dynamic, and full of possibility.

**Expected decisions:**
- "In today's fast-paced digital landscape" — formulaic opener, `core-rules.md` §2 /
  §1. Cut or replace with the actual point.
- "It's not just a trend — it's a revolution" — negative parallelism + em-dash reveal,
  `core-rules.md` §2. Remove.
- "unlocking unprecedented levels of", "dynamic, and full of possibility" — significance
  inflation / AI vocabulary, `core-rules.md` §1.
- "those that resist risk being left behind" — manufactured stakes, `core-rules.md` §1.
- "Studies show that" — vague unsourced attribution, `core-rules.md` §1.2. Name a
  source or cut the claim.
- "Ultimately, the future of work is here" — stated-thesis close, `structural-pass.md`
  check 1. Cut.
- Preserve: the one real proposition (remote work changed how teams collaborate).
  The dropped "Studies show" claim is carried by the "isn't really settled" ending,
  which flags the evidential gap instead of reconstructing it (fact-lock).
- Change magnitude: ~70% — high, but the input is near-pure filler, so warranted.
- No-edit gate: passed — dense tell cluster, edit is the right call.

**Reference "after":**
> Remote work has changed how teams coordinate day to day: more written updates,
> fewer people in a room, more scheduling around time-zone overlap. Whether that nets
> out to higher productivity depends a lot on the team and the kind of work, and it
> isn't really settled either way.

**Blind forced-choice answer key:** a judge picks the **Input** — the opener, the
"not just X, it's Y", and the tidy "the future is here" close are all recognizable
machine scaffolding. The reference-after ends on an unresolved point, which reads human.

**A regression here looks like:** the reference-after keeps a formulaic opener; or the
"still unsettled" ending gets rounded off into a confident claim; or "Studies show"
survives without a source.

---

## Case 2 — already-human text, NO EDIT is the correct output

**Setup:** "Can you humanize this?" No flags. The text is a real diary-style paragraph.

**Input:**
> We got to the cabin late, maybe eleven, and the key wasn't under the mat where
> Dad said it would be. Ended up climbing in through the bathroom window, which I'm
> too old for. The heater took an hour to do anything. I don't remember the lake
> being that loud at night.

**Expected decisions:**
- Specific, checkable detail (eleven, the mat, the bathroom window, an hour). No AI
  vocabulary. Uneven sentence length. A dropped subject ("Ended up climbing in").
  An unresolved observation at the end.
- No-edit gate: **triggered.** Correct output is no rewrite. At most, note that nothing
  needs changing; do not "tighten," do not fix "Ended up climbing in" into a full
  sentence, do not smooth the last line into a conclusion.
- Change magnitude: 0%.

**Reference "after":**
> (no change) — This already reads as a specific person's own writing: concrete
> details, uneven rhythm, an observation left hanging. Editing it would remove those,
> not improve it.

**Deliberately over-edited version (for the blind pair):**
> We arrived at the cabin late in the evening, at approximately 11 p.m., only to
> discover that the key was not in its expected location under the mat. As a result, we
> were forced to enter through the bathroom window. The heater took roughly an hour to
> warm the space. Interestingly, the lake seemed louder at night than I remembered.

**Blind forced-choice answer key:** a judge picks the **over-edited version** — "only
to discover," "As a result," "Interestingly," and the flattened uniform rhythm are the
tells. The input reads as untouched human writing, which is the whole point.

**A regression here looks like:** the skill produces anything other than "no change"
— any edit at all here is the exact subtractive-over-editing failure the no-edit gate
exists to prevent.
