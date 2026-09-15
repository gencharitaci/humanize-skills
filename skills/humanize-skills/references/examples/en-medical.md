# en-medical — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Any
> change-magnitude percentage below is a rough eyeball estimate, not measured (no scanner).


`--medical`. Fact-lock binds harder here than almost anywhere. Never upgrade a claim
past its evidence. Preserve calibrated hedging, methods-section passive, every number.

---

## Case 1 — promotional health-content paragraph, edit warranted

**Setup:** "Humanize this patient-facing page, --medical." English, patient-facing register.

**Input:**
> This groundbreaking new therapy is revolutionizing the treatment of chronic
> migraine. Studies show it can cut migraine days by 50%, offering patients a
> life-changing reduction in suffering. Experts agree it represents a paradigm shift
> in holistic migraine care. Talk to your doctor today about whether this innovative
> treatment is right for you.

**Expected decisions:**
- "groundbreaking," "revolutionizing," "paradigm shift," "holistic ... care,"
  "innovative treatment" — significance/promotional inflation about a therapy,
  `medical.md` (this is close to a regulated-claims problem, not just cliché).
- "Studies show ... Experts agree" — vague attribution with no trial named,
  `medical.md`. A reader may assume a specific trial exists.
- "cut migraine days by 50%" — relative figure quoted alone, `medical.md`. Flag that
  the absolute numbers (from how many days to how many) are missing, don't strip the
  claim silently and don't invent the absolutes.
- "life-changing reduction in suffering" — emotional inflation over the evidence.
- Patient-facing register: keep it short, concrete, second person, action-oriented —
  but do **not** make it read like a trial report.
- Fact-lock: no drug name, no trial, no absolute risk in the source → flag all three
  as gaps.
- Change magnitude: ~65%. No-edit gate: passed.

**Reference "after":**
> Some people with frequent migraine have fewer migraine days on [treatment name — to
> be filled in]. In [trial name — to be filled in], the average went from about
> [X] migraine days a month to about [Y]. It doesn't help everyone. Ask your doctor
> whether it's likely to help in your case, and what the side effects and cautions are.
> *(Flagged: the page needs the treatment name, the trial it's citing, and the
> before/after day counts — the draft gave only a relative "50%". Side-effect and
> suitability details are pointed to the doctor rather than asserted, since the draft
> supplied none.)*

**Blind forced-choice answer key:** a judge picks the **Input** — "groundbreaking,"
"paradigm shift," "Experts agree," and the ad-style "Talk to your doctor today" close
are the tells. The reference-after reads as cautious patient information.

**A regression here looks like:** "50%" is kept with no gap flag; a plausible drug name
or day-count is invented to fill a placeholder; the rewrite hedges so heavily
("may possibly in some cases potentially") that a patient can't tell what it's saying;
or "cut migraine days" becomes "cures migraine."

---

## Case 2 — correctly hedged observational finding

**Setup:** "Tighten this, --medical." Clinical/research register.

**Input:**
> In this single-center retrospective cohort of 214 patients over 65, higher baseline
> vitamin D was associated with a lower 30-day readmission rate (adjusted OR 0.82,
> 95% CI 0.68–0.99). These data are consistent with, but cannot establish, a causal
> relationship.

**Expected decisions:**
- Correct register throughout. "was associated with," "consistent with, but cannot
  establish, a causal relationship" — calibrated hedging over observational data,
  `medical.md` preserve list.
- "single-center retrospective," "cohort of 214 patients over 65" — population and
  limitation scoping, `medical.md` preserve list. Cutting this to "tighten" removes
  exactly what a clinical reader needs.
- OR, CI, N, age cutoff — verbatim, always.
- No-edit gate: **triggered.** Correct output is essentially no change.
- Change magnitude: 0–3%.

**Deliberately over-edited version (for the blind pair):**
> Higher vitamin D levels reduce 30-day readmissions in elderly patients (OR 0.82).
> This important finding suggests vitamin D supplementation could improve outcomes for
> older adults.

**Blind forced-choice answer key:** a judge picks the **over-edited version** — it
converts "associated with → reduce," drops "single-center retrospective" and the CI,
drops the explicit no-causation caveat, and adds a supplementation recommendation the
data doesn't support. Every one of those is a fact-lock / claim-evidence violation.

**A regression here looks like:** the CI or N gets dropped; "associated with" gets
strengthened; the "cannot establish causation" sentence gets cut as a hedge; or a
supplementation recommendation appears.
