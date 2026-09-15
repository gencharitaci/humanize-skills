# Changelog

All notable changes to the humanize-skills engine. Format loosely follows
[Keep a Changelog](https://keepachangelog.com/); versioning is semantic
(see `examples/README.md` for what MAJOR/MINOR/PATCH mean here).

## [Unreleased]

### Added
- **Tone layer (`references/tones/`).** Third axis beside mode and language:
  `profiles.md` (7 profiles — expert/biz/human/social/landing/article/case —
  with rhythm targets and per-tone rules) and `cultural-matrix.md` (all 20
  languages: address systems, trust mechanics, humor tolerance, taboos; `nl`/`th`
  provisional and `ar`/`hi`/`fa` script-unverified, flagged as such). Precedence
  updated: fact-lock > user instruction > mode > tone (mode caps win, stated
  plainly) > language > core > structural. Tone defaults to `human` (`expert`
  for legal/medical). MINOR — new layer, no existing outcome changes; tone×mode
  fixtures deferred to a post-blind batch.
- **`references/EVAL.md`: independent output evaluation.** Separate-call LLM
  judge, 5-metric composite (marker removal, fact-lock compliance, rhythm
  compliance, clean-slop scan, gate judgment; any invented specific fails the
  whole EVAL outright). Complement to the human blind check, with anti-bias
  rules and a triangulation policy (blind judge wins disagreements).
- **`examples/en-document.md`: the three admitted coverage gaps, pinned.**
  Audit-first spans with frozen equation/table/citations + a §2 no-edit hold;
  one-line report for a one-line edit; file naming (`paper.md`/`thesis.tex`
  writeback, `.docx` span-list by default). Also clarifies `SKILL.md`'s binary
  rule with a narrow uniform-formatting exception — this resolves the standing
  ambiguity around the two early `.docx` writebacks, which are grandfathered
  under exactly that exception. MINOR — new pins, no existing outcome changes;
  `en-document.md` itself is author-only and needs the blind pass.
- **Batch 5 crossings (`examples/es-social.md`, `ru-academic.md`,
  `ar-technical.md`).** Same tension shape as Batch 4, three new cells: Spanish
  social (colon/parallelism/gerund × humblebrag arc, incl. a deliberate
  honest-ask-vs-padding boundary case), Russian academic (hard bans hold while
  calibrated hedging survives, with the corporate-vs-academic opener carve-out
  boundary pinned), Arabic technical (Technical-register conservatism: connective,
  hedge, passive, and unit fixes with NO reordering or variance — applying
  opinion moves is the named regression). `ar-technical` carries the RTL
  open-item note. MINOR — new pins; all three author-only, blind + native review
  pending.
- **Tone fixtures (`examples/en-tone.md`).** First pins for `references/tones/`:
  legal+warm (cap holds, stated in one line), medical+human (direct address with
  dosage lock and no invented reassurance), social+social (conformant shape, flags
  instead of performed success). MINOR — author-only, blind pass pending.
- **Pre-flight check, volume flags, `--write`, audit severity (`SKILL.md`).**
  Every request now opens with a scored pre-flight (8 signals, 0–100) and a
  weighted STOP guard with per-language carve-outs (RU corporate opener, DE legal
  Nominalstil, PT-BR gerund) — the no-edit gate made auditable. New volume layer:
  `--free` (default passages) / `--careful` (default documents, 80–110%) /
  `--minimal` (explicit or post-STOP force, annotated `[HUMAN-ORIGIN]`).
  `--write` applies the rules from the first draft. `--audit` reports group by
  CRITICAL/HIGH/MEDIUM/LOW severity. Normal-mode reports stay to one or two plain
  sentences, no category lists. MINOR — no existing fixture's expected decisions
  change, but `en-general` Case 2 (no-edit) should be re-run through the blind
  check against the new guard.
- **Rhythm hardening + clean-slop controls (`core-rules.md` §0/§6).** §0 is now
  checkable: clause categories, three no-triplet rules, ≤3-clause ceiling,
  paragraph-weight rotation, universal opener rotation (per-language fillers owned
  by each catalog; `_template.md` now requires the opener + pre-flight rows for
  new languages), the surprise-variation mechanism named, and a short-form note.
  §6 gains replacement-tic and aphorism budgets, slack, the outline test, and
  plain-verb targets, backed by new **`references/prose-benchmarks.md`** (positive
  targets incl. a shelf-life rule: retire dead banned words with a CHANGELOG
  note). MINOR — same outcomes, stricter pins; re-run `en-general` with the rest.
- **`github-repo/scripts/`: dev hygiene scripts (repo root, not inside the skill).**
  `check.ps1` / `check.sh` lint every fixture (unreviewed banner, six required
  sections, rule citations, over-edited foil on no-edit cases, em-dash self-check)
  and verify the canonical → `github-repo` / `claude-upload` mirrors are in sync.
  They intentionally live outside `skills/humanize-skills/` so they never ride along
  with `npx skills` installs — the installed skill stays pure Markdown, zero
  executables, on every agent.
- **`SKILL.md`: long-document / file handling + report-length scaling.** Prompted by
  the first smoke tests — the default output was a full essay for a one-line rewrite,
  and there was no strategy for "humanize this 10-page file" other than regenerating
  the whole thing (slow, costly, drift-prone on claims/numbers/citations).
  - New **Document** output mode (auto: a file, ~1,500+ words, or titled sections):
    audit-first, freeze structure (headings, citations, equations, tables), per-section
    no-edit gate, return `location → before → after` spans only — never the whole doc.
  - **File output preserves the source format**: `paper.md` → `paper.humanized.md`,
    `thesis.tex` → `thesis.humanized.tex` (LaTeX commands / math / `\cite{}` untouched),
    etc. Never overwrites the original. Binary formats (`.docx`, `.pdf`, …) get the
    span list instead of a regenerated file.
  - **Normal-mode report** now explicitly scales with the edit (one line for a
    sentence) and bans the preamble / "this is textbook AI slop" editorialising; lead
    with the rewrite.
  - MINOR — no existing fixture's expected decisions change. **No fixture coverage yet**
    for Document mode, the file-output naming, or the report-length rule; add in a later
    batch.
- Phase 5 started: `references/examples/` golden-fixture suite.
  - Fixture format spec and the blind forced-choice review protocol (`examples/README.md`).
  - Batch 1: `en-general`, `en-academic`, `en-medical`, `en-legal`, `en-business`,
    `en-resume`, `en-ux`, `en-social`, `en-technical`, `en-creative` — every mode
    overlay exercised against English, with no-edit cases for the over-edit-prone modes.
  - Batch 2: `zh-general`, `es-general`, `de-general`, `fr-general`, `ru-general`,
    `ja-general`, `tr-general`, `ko-general` — every tier-1 language catalog exercised
    against `--general`, each with one AI-slop case (decisions cited to that catalog's
    specific rules) and one no-edit case whose over-edited foil is written in that
    language's characteristic over-formalization failure.
  - Batch 3: `vi-general`, `pl-general`, `id-general`, `uk-general`, `ar-general`,
    `pt-general`, `it-general`, `hi-general`, `fa-general`, `nl-general`, `th-general`
    — all 11 tier-2 catalogs. `nl`/`th` fixtures carry an extra banner warning that the
    catalog itself is unvalidated (zero source repos). `ar`/`fa` carry the RTL open-item
    note. Every fixture also doubles as native-reviewer bait.
  - Batch 4 (high-risk language×mode crossings): `tr-academic`, `zh-academic`,
    `de-legal`, `fr-academic`, `ja-technical`, `ko-business` — cells where the language
    catalog and the purpose mode pull in different directions (e.g. Turkish academic
    `-maktadır` is genre-correct in moderation but the five absolute bans still hold;
    `fr.md`'s Académique matrix makes "selon les experts" a TODO, never a rewrite;
    German Formal mode leaves participle-tails alone while `legal.md` governs modal
    verbs). Each pairs an AI-slop case with a "this is correct genre register, don't
    strip it" no-edit case.
  - `README.md`: added a **Validation status** section (all fixtures are model-authored
    and unreviewed; the blind protocol has not been run); a per-file status banner on
    every fixture; the "regression tripwire, not a coverage guarantee" framing.

### Changed
- **License: MIT → CC BY 4.0 (© Adem Kurtipek).** New `github-repo/LICENSE.md`
  carries the verbatim CC-BY-4.0 legal text with an attribution header; the MIT
  `LICENSE` is removed; `SKILL.md` frontmatter now reads `CC-BY-4.0`; README,
  CONTRIBUTING checklist, INDEX, and roadmap references updated. Pre-publish
  switch, no downstream users affected. (GitHub account path
  `gencharitaci/humanize-skills` unchanged — separate decision.)
- **Intake ledger (`SKILL.md` fact-lock).** The roadmap's safeguard #01 promised a
  protected-content ledger the router never operationalized — now a procedure:
  list names/numbers/dates/quotes/citations (+ calibrated tics) before editing,
  check each off verbatim at the end, per section in Document mode. PATCH —
  same outcomes, auditable promise.
- **`languages/pt.md`: expanded from the full humanizer-br pattern bank.**
  Added vague attributions, excessive connectives, specific never-use phrases,
  elegant variation, a register table, and a what-NOT-to-flag list (incl. the BR
  gerund and self-deprecation carve-outs). The sibling `aprofundador` skill was
  consulted and partially adopted (diagnostic + positioning transfer; additive
  layers rejected under fact-lock — recorded in Sources). The worked-example
  After invented "three products over two years" — rewritten to strip + flag,
  the ninth catalog fix of that class. Also: all 20 language files now carry the
  opener-rotation + pre-flight carve-out rows `_template.md` requires (standing
  SKILL defaults cited where file-specific data is unconfirmed). MINOR + native
  re-review note for `pt`.
- **Pre-flight coverage (`SKILL.md`).** Three rows added from an author dry-run
  that caught the gap: negative parallelism, reflexive triads, and vague
  unattributed authority are now scored (+10 / +10 / +10 each). The `en-general`
  slop case moves 30/Mild → 60/Clear (action unchanged — both proceed); the diary
  case still scores 0 → STOP. MINOR + re-run note for `en-general`.
- **`languages/en.md`: six missing banned words added** (leverage, utilize,
  streamline, optimize, cutting-edge, innovative) — four of the most famous AI
  words were absent while `en-general` Case 1 expected their removal. Sourced
  from the same survey lists the other catalogs already draw on. MINOR.
- **`references/EVAL.md`: short-text clause in RC** (under ~60 words, one
  same-category triplet permitted) — found dogfooding EVAL on `es-social` Case 1,
  whose three-sentence hook is genre-correct, not a violation. PATCH.
- **`modes/general.md`: expanded from a 13-line stub to a full overlay** (core
  principle, preserves, general-mode tell priorities, rhythm budget, voice, full
  structural pass, output, honest sources note). It defers to the same rules the
  `en-general` fixture cites, so no existing fixture's expected decisions change —
  MINOR — but `en-general` should be re-run through the blind check regardless.
- **`SKILL.md` frontmatter description trimmed to ~860 chars** (was 1014/1024).
  Trigger phrases kept; per-flag glosses dropped (they live in the SKILL body and
  README). PATCH — no behavior change, buys headroom under the Agent Skills spec
  limit.
- Fixture format spec: `Change magnitude` line now reads "eyeballed %, not measured".
- **`references/voice-calibration.md`: connective fingerprint + citation
  mechanics.** Two extraction bullets the generated-plan audit found missing
  (default transitions/openers/closers and their frequencies; inline vs
  parenthetical attribution habits). PATCH.
- **Merge rule + rhythm pointer index (`core-rules.md` §0,
  `references/language-rhythm.md`).** §0 gains the inverse operation (merge
  adjacent same-opener fragments/shorts, guarded against causal joins and
  deliberate staccato) and refreshes its now-stale opener fallback (all 20
  catalogs carry opener rows). New pointer-only index collects one-line
  characterizations + exact section pointers per language — states no rules, so
  the catalog always wins; tensions preserved (tr-no-fragments vs uk-staccato,
  uk-native vs ru-banned dash). Scripts now enforce card coverage per catalog.
  MINOR — no existing fixture outcome changes.
- **`languages/en.md`: English merge gloss.** Concretizes core §0's merge rule as
  two sub-12-word sentences sharing one opener, with worked example — kept in
  `en.md` (not core) since word counts are uncomputable in ZH/JA/TH. PATCH —
  approximation, no outcome changes.

### Fixed
- **`examples/en-general.md` Case 1:** the reference-after contained an em dash
  ("day to day — more"), the tell its own fixture removes — recast with a colon.
  Expected decisions now note the dropped "Studies show" claim is carried by the
  "isn't really settled" ending (gap flagged, not reconstructed). PATCH.
- `languages/hi.md` and `languages/fa.md`: each catalog's own worked-example "after"
  used an em dash "—", contradicting that same file's rule (hi: "target zero"; fa:
  Layer 4 "not native Persian punctuation"). Rewritten to a danda-terminated sentence
  (hi) and «؛» (fa). PATCH — no fixture outcome changes.
- **Reviewer-0 self-audit (2026-09-06):** a cold adversarial re-read of every fixture
  found a systematic issue — ~15 "edit warranted" `Reference "after"` blocks invented a
  concrete specific (a mechanism, a metric, a backstory, an illustrative scenario) to
  make the humanized version read real, which is the exact fact-lock violation the
  skill forbids ("Never invent … an example"). Fixed across `en-academic`, `en-medical`,
  `en-social`, `en-technical`, `en-general`, `zh-academic`, `fr-academic`,
  `ja-technical`, `tr-academic`, `ja-general`, `vi-general`, `hi-general`, `nl-general`,
  `th-general`, `uk-general` — each reference-after now removes the inflation and
  **flags** the missing specifics instead of reconstructing them. A second sub-audit
  then cleaned the **em dash** out of the rewritten reference-afters where it's the
  very tell the fixture/catalog flags (`ja`, `vi`, `hi`, `tr`, `zh`, `fr`).
  `README.md`'s `Reference "after"` spec updated to say it must itself obey the
  fact-lock. Milder category-illustration cases (`zh/it/es/pl/id-general`) left for
  native review. Full detail in `BLIND-RESULTS.md`. PATCH — no expected-decision changes.

- **Catalog worked-examples brought to the same standard.** Eight `languages/*.md`
  "Worked example" `**After:**` blocks invented a concrete specific with no
  acknowledging framework — `en.md` ("batch processing, keyboard shortcuts"),
  `fr.md` ("8 000 habitants", a 1932 church classification), `ja.md`/`fa.md`/`hi.md`/
  `th.md`/`nl.md` (a "3 days → 4 hours" / "five tools" / "a day a week" metric),
  `es.md` ("casco antiguo", "diez mesas"). Each rewritten to keep only what the draft
  contained and flag the rest, matching the fixture standard. Stray dashes introduced
  by the rewrite were cleaned. Left as acceptable: `zh.md` (has its own flagged
  personal-narrative exception), `uk.md` (a generic marketing offer, no number/date/
  name invented), and the category-illustration cases (`tr/id/pl/de/ar`). PATCH.

### Pending
- **Run the three-reviewer blind forced-choice protocol** on the existing fixtures —
  nothing here is validated until this happens. This is the gating item, not more
  fixtures.
- A second case per existing cell, or further crossings, if the blind pass
  surfaces gaps.
- First tagged release (`0.1.0`) once the blind pass is done.
