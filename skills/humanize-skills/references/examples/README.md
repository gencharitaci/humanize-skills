# Golden fixtures

Frozen before/after pairs, one file per `{lang}-{mode}`, each holding one or more
numbered **cases**. They exist for one reason: a change to any rule file
(`core-rules.md`, `structural-pass.md`, a language catalog, a mode overlay) can be
checked against these to see whether it still produces the intended edit — and,
just as important, whether it now over-edits something it used to leave alone.

There is no scanner in this project, so these fixtures *are* the regression suite.
They are reviewed by hand, using the protocol below, not by diffing text.

They are **regression tripwires, not a coverage guarantee.** Two cases in `en-legal`
do not mean `legal.md` is covered — they mean a change that breaks *those two* gets
noticed. A green suite says "nothing we pinned regressed," never "the skill is correct."

## Validation status

**Every fixture currently in this directory is model-authored and unreviewed.** They
were written by the same model that maintains the skill, from the rule files — not
from a fresh reading of real AI output, not checked by the three-reviewer blind
protocol below, and (for non-English files) not checked by a native speaker. Two
consequences:

- The "Blind forced-choice answer key" in each case is a *prediction* of what a human
  judge would pick, not a recorded result. Until the protocol below is actually run,
  the suite mostly tests "does the model still agree with past-model."
- The `Reference "after"` texts may themselves carry mild tells, and the non-English
  ones may read slightly off to a native speaker. Treat them as a plausible target,
  not a gold standard.

Batches 2–3 (non-English) double as **native-reviewer bait**: the fastest way to
improve them is to hand each file to a native speaker and ask "is the input realistic
AI slop, and is the reference-after something a person would actually write?"

Change-magnitude percentages are eyeballed, not measured — the project has no scanner
by design, so a number that can't be checked is an estimate, flagged as such.

## What a fixture is not

- Not a promise that the model will reproduce the "after" verbatim. Two good humanized
  versions of the same input can differ. The fixture pins the **decisions** — which
  tells were removed, which content was preserved, whether an edit was warranted at
  all — not the exact wording.
- Not a training set. Nothing here is concatenated into the skill at runtime. The
  language and mode files carry their own short worked examples for that.
- Not real. Every input is synthetic. No real person, company, product, study, or
  quote appears in any fixture.

## File format

```markdown
# {lang}-{mode} — golden fixtures

## Case 1 — <one-line scenario>

**Setup:** what the requester asked for, and any flags (`--strict`, `--audit`, …).

**Input:**
> <the draft, quoted>

**Expected decisions:**
- <tell removed> — <which rule catches it: core-rules §N / structural check N /
  {lang}.md / {mode}.md>
- <content preserved and why>
- Change magnitude: <eyeballed %, not measured> — <in range for this mode/depth? y/n>
- No-edit gate: <passed — edit warranted / triggered — correct output is "no edit">

**Reference "after":**
> <one acceptable humanized version — it must itself obey the fact-lock: no invented
> example, mechanism, number, name, backstory, or generic-but-unsourced claim added
> "to make it concrete." Where the input is pure inflation with no substance under it,
> the correct reference-after is *inflation removed plus an explicit gap flag*, not a
> plausible reconstruction. A reference-after that invents is a fixture bug.>

**Blind forced-choice answer key:** <which of {input, reference-after} a blind judge
should pick as "machine-touched," and the one-sentence reason. For a no-edit case,
the answer is that the *edited* version reads as tampered and the input does not.>

**A regression here looks like:** <the specific wrong behaviour this case guards
against — e.g. "the em dash survives", "the defined term gets simplified", "a clean
input gets a 15% rewrite".>
```

## The blind forced-choice check (the review protocol)

This is the method a field-wide survey of 68 humanizer skills found actually catches
the two failure modes an eyeball diff misses — subtractive over-editing of text that
was already human, and voice-calibration caricature.

1. **Assemble pairs.** For each case, take the `Input` and the `Reference "after"`.
   For no-edit cases, the pair is the `Input` and a *deliberately over-edited* version.
2. **Strip labels.** A reviewer who did not write the fixture sees the two texts as
   "A" and "B", in random order, with no indication which is which.
3. **Forced choice.** The reviewer answers one question: *"Which of these two was
   touched by an automated writing tool?"* — they must pick one; "can't tell" is
   recorded as a coin-flip against us.
4. **Score against the answer key.**
   - Normal case: the reviewer should pick the `Input` (the AI-slop original). If they
     pick the `Reference "after"`, the humanized version is still tell-y, or the edit
     introduced a *new* tell (see `core-rules.md` §6, the injection check).
   - No-edit case: the reviewer should pick the *over-edited* version. If they pick the
     `Input`, the skill's edit would have damaged genuine human prose — the no-edit
     gate must hold.
5. **Three-of-three.** A fixture passes only if it survives three independent
   reviewers. Record every reviewer's pick in `BLIND-RESULTS.md`; when a fix follows
   from a failure, note it there and in `CHANGELOG.md`.

Do not skip step 2. A reviewer who knows which text is "the humanized one" will
rationalise its tells and miss injected ones — that is exactly the bias this protocol
removes.

## Coverage plan

Full grid is 20 languages × 10 modes = 200 cells. That is not the target — most cells
would duplicate decisions already pinned elsewhere. The plan:

| Batch | Cells | Status | Purpose |
|---|---|---|---|
| 1 | `en-{all 10 modes}` | **done** | Exercise every mode overlay against a fixed language |
| 2 | `{8 other tier-1 langs}-general` (en-general is in Batch 1) | **done** | Exercise every tier-1 catalog against a fixed mode |
| 3 | `{11 tier-2 langs}-general` | **done** | Same, tier-2 — doubles as native-review bait; `nl`/`th` flagged as hypothesis-on-hypothesis (no source catalog) |
| 4 | High-risk crossings | **done** | `tr-academic`, `zh-academic`, `de-legal`, `fr-academic`, `ja-technical`, `ko-business` — combos where the catalog and the mode pull in different directions; each has an AI-slop case + a "correct genre register, don't strip it" no-edit case |
| 5 | Extra crossings (pre-blind tripwires) | **done** | `es-social`, `ru-academic`, `ar-technical` — same tension shape as Batch 4 (incl. the honest-ask boundary in `es-social` Case 2 and the no-variance rule in `ar-technical`); `ar-technical` carries the RTL open-item note |
| 6 | Tone layer | **done** | `en-tone.md`: legal+warm cap holds, medical+human within discipline, social+social conformant — the first pins for `references/tones/` |
| next | **Run the blind protocol** | pending | The gating item — not more fixtures. Nothing above is validated until three reviewers have run step 1–5 on it. |
| later | Document mode / file output / report length | **done** (`en-document.md`: audit-first spans + per-section gate + freeze list; one-line report case; file-naming case incl. the binary span-list rule and its uniform-formatting exception) | `SKILL.md`'s Document output mode and report-length rule are now pinned. Cross-format writeback beyond this (`.tex` math edge cases, `.odt`/`.pages`) is untested. |

A cell is "done" when its file has at least one normal case and, where the mode is
prone to over-editing (`general`, `creative`, `academic`, `resume`), one no-edit case.

## Versioning & changelog

- The skill follows **semantic versioning** from here on. Version lives in
  `CHANGELOG.md`, not in frontmatter (skills have no version field).
- **MAJOR:** a change that alters what a fixture's expected decisions are — an
  intentional shift in what the skill removes or preserves.
- **MINOR:** a new language, a new mode, a new fixture batch, added rules that don't
  change existing fixtures' outcomes.
- **PATCH:** wording fixes, clarifications, a rule tightened without changing any
  fixture outcome.
- Every change that touches a rule file records, in `CHANGELOG.md`, which fixtures were
  re-run and whether they still pass the blind check.
