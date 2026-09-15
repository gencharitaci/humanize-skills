# en-document — golden fixtures (Document mode, report length, file naming)

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Any
> change-magnitude percentage below is a rough eyeball estimate, not measured (no scanner).

Document output behavior lives in `SKILL.md`, not in any mode file — so it gets
its own fixture file instead of a `{lang}-{mode}` cell. Three cases: audit-first
spans with frozen elements, report-length scaling, and file naming including
binaries.

---

## Case 1 — Filed draft, audit first, changed spans only, §2 left alone

**Setup:** "Humanize this draft, --academic --lang=en" with a ~700-word
three-section draft attached as a file. Document mode triggers (file + titled
sections). Shown: the audit the skill returns first, then the applied spans
after the requester says "apply the fixes".

**Input:**
> # Field notes on Route 12 bus delays
>
> ## 1. Background
> In today's fast-paced urban landscape, bus delays play a vital role in commuter
> satisfaction. Moreover, unreliable service disproportionately affects shift
> workers. Moreover, existing schedules assume free-flow traffic that rarely
> exists at peak hours.
>
> ## 2. Method
> We rode Route 12 end to end on six weekdays in March, logging boardings,
> alightings, and door-open times at each of the 14 stops. The AVL export gives
> second-resolution timestamps for the same trips (n=412). Headways follow
> Eq. (1); stop-level dwell is summarized in Table 1.
>
> ## 3. Findings
> Studies show that signal priority improves on-time performance, underscoring
> its significance for the corridor. Mean headway adherence rose 6 points after
> the March retiming [Okafor 2023]. Whether that generalizes beyond Route 12 is
> untested [Lindqvist 2021].

**Expected decisions:**
- Audit first, grouped by severity (`SKILL.md` severity levels), then stop —
  no silent rewrite. §1: CRITICAL opener + HIGH repeated "moreover" + HIGH
  significance inflation (`core-rules.md` §1/§2, `en.md` connectives).
- §2: no-edit gate holds — specific, grounded method prose (six weekdays, 14
  stops, n=412); report "no change" and skip it.
- §3: vague attribution ("studies show") → attach the actual source or flag
  (`structural-pass.md` check 4); Eq. (1), Table 1, and both citation keys are
  frozen (`modes/academic.md` preserve list).
- Change magnitude: ~60% of §1 tokens, ~20% of §3, 0% of §2.
- No-edit gate: edit warranted for §1/§3; holds for §2.

**Reference "after":**
> Audit (returned first):
> - CRITICAL — §1 ¶1: formulaic opener + significance inflation ("fast-paced
>   urban landscape," "play a vital role").
> - HIGH — §1 ¶1: "moreover" twice in three sentences.
> - HIGH — §3 ¶1: vague attribution ("studies show") + "-ing" tail
>   ("underscoring its significance").
> - §2: no findings — no change.
>
> Applied spans (after "apply the fixes"):
> - §1 ¶1, Before: "In today's fast-paced urban landscape, bus delays play a
>   vital role in commuter satisfaction." After: "Bus delays shape commuter
>   satisfaction on the Route 12 corridor. [Flagged: the draft offers no delay
>   figures; attach the AVL export or narrow the scope to what was observed.]"
> - §1 ¶1, Before: "Moreover, unreliable service… Moreover, existing schedules…"
>   After: "Unreliable service hits shift workers hardest. Existing schedules
>   assume free-flow traffic that rarely exists at peak hours."
> - §3 ¶1, Before: "Studies show that signal priority improves on-time
>   performance, underscoring its significance for the corridor." After: "Signal
>   priority improved on-time performance by 6 points after the March retiming
>   [Okafor 2023]; whether that generalizes beyond Route 12 is untested
>   [Lindqvist 2021]."
> - §2: no change.
> - Frozen and verified unchanged: Eq. (1), Table 1, [Okafor 2023],
>   [Lindqvist 2021].

**Blind forced-choice answer key:** a judge picks the **Input** — the opener,
the moreover-stack, and "vital role" are recognizable scaffolding, while the
spans read as targeted repairs and §2 standing untouched proves the gate rather
than asserts it.

**A regression here looks like:** the whole document regenerated in the reply;
§2 "tightened"; Eq. (1), Table 1, or a citation key altered; or the audit
skipped straight to a rewrite.

---

## Case 2 — One-line edit gets a one-line report

**Setup:** "Fix this sentence." No flags. General mode, English.

**Input:**
> This innovative solution leverages cutting-edge technology to deliver seamless results.

**Expected decisions:**
- Banned-vocabulary cluster (innovative / leverages / cutting-edge / seamless)
  with no proposition underneath (`core-rules.md` §1, `en.md` banned list).
  Strip to what exists and flag the gap — never invent the mechanism
  (fact-lock).
- Change magnitude: ~80% of one sentence — warranted, the input is pure filler.
- No-edit gate: passed — dense cluster, edit is the right call.

**Reference "after":**
> This [product/process does X — the draft names nothing; needs the actual
> mechanism from the author].
>
> Report: cut four banned terms with no content under them; needs the real mechanism.

**Blind forced-choice answer key:** a judge picks the **Input** — four banned
hits in twelve words. The after reads as a deletion plus a flag, not a polish.

**A regression here looks like:** an essay-length report for a one-line
rewrite; a preamble restating what was wrong; "textbook AI slop"
editorialising; or an invented mechanism ("reduces load times by 40%") to fill
the gap — the exact fact-lock violation.

---

## Case 3 — File naming: text writeback, binary span-list

**Setup:** "Apply the fixes and write it back" × 3 — `paper.md`, `thesis.tex`
(with `\cite{}` keys), and `brief.docx` (mixed fonts, tracked changes, an
embedded chart).

**Input:**
> (the three files as attached; prose issues as in Case 1; §2-style clean
> sections present in each.)

**Expected decisions:**
- `paper.md` → `paper.humanized.md`: Markdown structure (headings, links,
  front-matter, code fences) preserved; original untouched.
- `thesis.tex` → `thesis.humanized.tex`: every command, math mode, and
  `\cite{}` key byte-identical outside the edited prose spans.
- `brief.docx` → NO writeback: mixed formatting + tracked changes + embedded
  object means faithful regeneration is impossible. Deliver the `location →
  before → after` span list for the requester's own editor, plus a plain-text
  rendering of the changed sections if asked.
- Narrow exception pinned: a binary with uniform run formatting throughout may
  be written back as `{name}.humanized.{ext}` with the original untouched and
  the uniformity stated in the report. Mixed formatting, tracked changes, or
  embedded objects never qualify.
- No-edit gate: per-section, in each file.

**Reference "after":**
> - `paper.humanized.md` written beside `paper.md`; per-section summary
>   (sections touched / left, roughly what changed).
> - `thesis.humanized.tex` written beside `thesis.tex`; confirmation that no
>   command, equation, or `\cite{}` was altered.
> - `brief.docx`: no file written. Span list delivered instead, with the
>   reason stated in one line (mixed formatting + tracked changes + chart).

**Blind forced-choice answer key:** behavioral, not textual — a checker finds
the originals byte-identical, the two text writebacks beside them, and no
regenerated `.docx`. Any missing original is the failure.

**A regression here looks like:** the original overwritten; a `\cite{}` key
altered in the `.tex` writeback; or a `.docx` regenerated from mixed
formatting with drift presented as faithful.
