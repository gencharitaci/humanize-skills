# Blind forced-choice results

Where blind-pass outcomes are recorded. Protocol: `README.md` § "The blind forced-choice
check". A case **passes** only when 3 independent reviewers (who did not write the
fixture) agree with the answer key.

## Status key

- `unrun` — no blind review yet
- `partial` — some reviewers, not yet 3
- `pass` — 3/3 agree with the key
- `fail` — reviewers picked against the key; see the note and the fix

## Reviewer-0 self-audit (contaminated — not a substitute for the real pass)

On 2026-09-06 the author model did a cold adversarial re-read of every fixture, trying
to break it: reference-afters that still carry a tell, over-edited foils that aren't
clearly worse, unrealistic slop inputs, answer-key reasoning that doesn't hold. Because
the same model wrote the fixtures, **agreement here is near-meaningless — only the
flagged failures and the fixes matter.**

### R0 finding — systematic: reference-afters were inventing specifics

**~15 "edit warranted" fixtures** had a `Reference "after"` that added a concrete
specific not in the source — the exact fact-lock violation the skill forbids
(`SKILL.md`: "Never invent a name, number, date, quote, citation, or **example**").
Two sub-patterns:

1. **Invented mechanism / result** — `en-academic`, `zh-academic`, `fr-academic`
   invented a research motivation ("message passing dilutes long-range signal");
   `en-technical`, `ja-technical` invented an incident mechanism ("widened a
   connection-pool limit"); `tr-academic` invented a "sparse-data" result;
   `en-medical` asserted "it can have side effects".
   **Fix:** each reference-after now states only what the draft contained and **flags**
   the mechanism / result / motivation as an author gap.
2. **Invented illustrative scenario** — `en-social` invented a resume-rewrite +
   referral backstory (and used a "wasn't X — it was Y" construction, the same
   negative parallelism the mode removes); `ja-general`, `hi-general`, `fa-general`,
   `nl-general`, `th-general` invented a "3 days → 4 hours" team metric;
   `vi-general` invented a weaving museum; `uk-general` invented a concrete offer
   ("три проєкти на місяць") + CTA — and that fixture's own regression line already
   said inventing a project count *was* the regression.
   **Fix:** each reference-after now removes the inflation and flags the missing
   specifics, no reconstructed scenario.

A second sub-audit caught that several of the rewritten reference-afters then
contained the **em dash** their own fixture/catalog flags (`ja`, `vi`, `hi`, `tr`,
`zh`, `fr`) — those were also cleaned (period / colon / comma).

Milder, **left as-is** pending native review: `zh-general`, `it-general`, `es-general`,
`pl-general`, `id-general` reference-afters name a generic category illustration
(审批流/报表; foglio di calcolo, chat, gestionale di cassa; fakturowanie/raportowanie;
spreadsheet + WhatsApp). These read as category-definitional rather than claims about a
specific product; a native reviewer should confirm whether they overstep.

Added to `README.md`: the `Reference "after"` spec now says it must itself obey the
fact-lock, and a reference-after that invents is a fixture bug.

**Also fixed (same pass):** eight language-catalog "Worked example" `**After:**` blocks
had the same invent-a-plausible-result pattern (`en fr ja fa hi th nl es`). Rewritten
to "keep what the draft had, flag the rest". `zh.md` (own flagged exception), `uk.md`
(no number invented) and the category-illustration cases left as acceptable. See
`CHANGELOG.md`. Native review of the *language* in these rewrites is still wanted.

Per-fixture R0 status in the table below is "audited" (re-read this pass; fixed if
flagged). It is **not** a pass — R0 is contaminated.

## Fixture status

| Fixture | R0 self-audit | Human blind pass | Notes |
|---|---|---|---|
| en-general | audited | unrun | |
| en-academic | audited | unrun | |
| en-medical | audited | unrun | |
| en-legal | audited | unrun | |
| en-business | audited | unrun | |
| en-resume | audited | unrun | |
| en-ux | audited | unrun | |
| en-social | audited | unrun | |
| en-technical | audited | unrun | |
| en-creative | audited | unrun | |
| zh-general | audited | unrun | |
| es-general | audited | unrun | |
| de-general | audited | unrun | |
| fr-general | audited | unrun | |
| ru-general | audited | unrun | |
| ja-general | audited | unrun | |
| tr-general | audited | unrun | |
| ko-general | audited | unrun | |
| vi-general | audited | unrun | |
| pl-general | audited | unrun | |
| id-general | audited | unrun | |
| uk-general | audited | unrun | |
| ar-general | audited | unrun | |
| pt-general | audited | unrun | |
| it-general | audited | unrun | |
| hi-general | audited | unrun | |
| fa-general | audited | unrun | |
| nl-general | audited | unrun | catalog itself unvalidated |
| th-general | audited | unrun | catalog itself unvalidated |
| tr-academic | audited | unrun | |
| zh-academic | audited | unrun | |
| de-legal | audited | unrun | |
| fr-academic | audited | unrun | |
| ja-technical | audited | unrun | |
| ko-business | audited | unrun | |
| en-document | authored with feature, no R0 | unrun | Document/report-length/naming; needs blind pass |
| es-social | authored with feature, no R0 | unrun | Crossing; needs blind pass + native check |
| ru-academic | authored with feature, no R0 | unrun | Crossing; needs blind pass + native check |
| ar-technical | authored with feature, no R0 | unrun | Crossing; needs blind pass + native check; RTL unverified |
| en-tone | authored with feature, no R0 | unrun | Tone layer; needs blind pass |

## Functional smoke tests

Not the blind protocol — the maintainer running the installed skill on known inputs and
checking the behaviour is right. Evidence that the engine *works*, not that a reviewer
can't spot the edit.

| Date | Setup | Input | Result |
|---|---|---|---|
| 2026-09-06 | local `~/.claude/skills/` install, fresh Claude Code session | en, pure AI marketing slop ("groundbreaking platform leverages cutting-edge…") | **pass** — skill auto-activated, read core + structural + general, stripped all banned vocab, and **held the fact-lock**: used `[placeholder]` gaps and stated it would not invent the missing specifics. Change report gave the ~95% estimate + categorised cuts. |
| 2026-09-06 | same | en, genuine human diary text ("We got to the cabin late, maybe eleven…") | **pass** — **no-edit gate fired**: named the human signals (time hedge, hard-to-invent detail, dropped subject, unresolved aside) and returned no rewrite ("if I touched anything it would be to make it worse"). |
| 2026-09-06 | same, `--academic` | en, inflated GNN abstract ("…novel framework that significantly improves performance and paves the way for future research") | **pass** — loaded `modes/academic.md` only (reused core/structural/lang); caught the academic-specific tells (formulaic opener, "novel" padding, unbacked "significantly", "paves the way" hype); stayed formal; held the fact-lock (placeholders, no invented benchmark/delta); change report closed with the mode's required "no number/equation/citation altered" line. Output independently matched the `en-academic` fixture's prediction. |
| 2026-09-06 | same, German input | de, buzzword slop ("In der heutigen schnelllebigen Zeit spielt Remote-Arbeit eine entscheidende Rolle…") | **pass** — loaded `languages/de.md` (fresh); **replied in German**, change report included, no translate round-trip; named the Sachlich gate; caught Floskel opener + significance inflation + the `fungiert als` / `stellt … dar` copula cluster; fact-lock held ("Nicht erfunden: Zahlen, Studien oder Mechanismen", placeholder slots). |

| 2026-09-15 | author dry-run, pre-flight table vs `en-general` C1 (slop) | 60/100 Clear → full pass (was 30/Mild before the §2/attribution rows; action unchanged, severity now honest) | **pass** — verdict matches the fixture's edit-warranted call |
| 2026-09-15 | author dry-run, pre-flight table vs `en-general` C2 (diary) | 0/100 → STOP, guard conditions hold (no opener/close, <5 banned; "Dad said" correctly not counted as vague authority) | **pass** — no-edit gate fires through the scorer, not around it |
| 2026-09-15 | author dry-run, EVAL vs `en-general` C1 pair | MR10 FL10 RC10 CS10 GJ10 = 50/50 Excellent | **pass** — rubric runs clean; contaminated (author-run), not validation |
| 2026-09-15 | author dry-run, EVAL vs `es-social` C1 pair | MR10 FL10 RC8 (three consecutive shorts) CS10 GJ10 = 48/50 | **pass with rubric fix** — short-text triplet exempted in EVAL RC (genre-correct hooks); fixture stands |

### Smoke-test summary (2026-09-06)

4/4 passed. The router → core → structural → language → mode → fact-lock → change-report
path works end to end. The two hardest behaviours — the **no-edit gate** and the
**fact-lock** — held in every applicable test; the fact-lock fired in all four,
including the two non-`--general` runs. **Not yet exercised:** `--audit`, `--calibrate`,
`--redo`, `--strict` / `--light`, the structural pass on a long narrative, any tier-2
language, the mode×language crossings, and the new **Document mode / file handling /
report-length rule** added to `SKILL.md` after these tests (the smoke tests also
surfaced that the default report is too verbose — a one-line rewrite got an essay).
This is functional testing, not the blind forced-choice pass (see below) — that is
still the gate for `0.1.0`.

## Human blind-pass log

<!-- One block per submission. Copy from the "Blind review results" issue template. -->

_(none yet)_
