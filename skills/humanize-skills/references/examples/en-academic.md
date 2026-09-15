# en-academic — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Any
> change-magnitude percentage below is a rough eyeball estimate, not measured (no scanner).


`--academic`. Narrows the job: remove tells **without** casualizing; enforce
claim↔evidence discipline. Preserve evidence-tied hedging, passive voice, "we".

---

## Case 1 — inflated abstract, edit warranted

**Setup:** "Clean up this abstract, --academic." English.

**Input:**
> In recent years, graph neural networks have attracted increasing attention. In this
> paper, we propose a novel framework that leverages attention mechanisms to
> significantly improve performance. Extensive experiments demonstrate that our method
> proves superior to existing approaches and paves the way for future research in this
> important area. Our results shed light on the fundamental nature of graph
> representation learning.

**Expected decisions:**
- "In recent years, X has attracted increasing attention" — formulaic opener,
  `academic.md` (formulaic openers). Replace with the actual gap.
- "novel framework" + "novel" density — novelty padding, `academic.md`.
- "significantly improve" with no test or number — `academic.md` (empty intensifiers).
- "Extensive experiments" — name the datasets/benchmarks, `academic.md`.
- "demonstrate that our method proves superior" — over-claiming verbs, `academic.md`
  + claim-evidence discipline. Downgrade to what was measured.
- "paves the way for future research", "shed light on the fundamental nature",
  "important area" — significance hype, `academic.md`.
- Preserve: "we propose", "we" throughout — standard register, not a tell.
- Fact-lock: no problem statement, dataset names, or numbers exist in the source —
  flag that the abstract needs its actual motivation, the real benchmark names, and
  the measured deltas. Do **not** invent a mechanism or a result to make it concrete.
- Change magnitude: ~55%. No-edit gate: passed.

**Reference "after":**
> We propose an attention-based aggregation step for graph neural networks that
> reweights each layer's neighbor contributions. On [benchmarks — to be filled in] it
> matches or exceeds the strongest reported baseline.
> *(Flagged: the abstract states no actual problem, names no benchmark, and gives no
> number. All three need to come from the author — none were invented here, including
> the motivation.)*

**Blind forced-choice answer key:** a judge picks the **Input** — "attracted increasing
attention," "paves the way," "sheds light on the fundamental nature" are unmistakable.
The reference-after reads as a real abstract with a genuine gap statement.

**A regression here looks like:** the rewrite casualizes ("GNNs have been a hot topic
lately"); or it keeps "significantly" without a number; or it invents a motivation, a
mechanism, benchmark names, or performance figures to fill the gap instead of flagging
it.

---

## Case 2 — correctly hedged finding, hedge must survive

**Setup:** "Make this less AI-sounding, --academic."

**Input:**
> Our results suggest that the intervention may be associated with a modest reduction
> in symptom severity, though the wide confidence interval and small sample size
> warrant caution in interpretation.

**Expected decisions:**
- This is correct academic register. "suggest," "may be associated with," "warrant
  caution" are evidence-tied hedges over a genuinely uncertain claim — `academic.md`
  preserve list. **Do not** cut them.
- No banned vocabulary, no significance hype, no formulaic opener.
- No-edit gate: **triggered** (or near-zero edit). At most, "warrant caution in
  interpretation" → "warrant caution" is an allowable light trim; upgrading any verb
  is forbidden.
- Change magnitude: 0–5%.

**Reference "after":**
> (no change, or at most) Our results suggest the intervention may be associated with
> a modest reduction in symptom severity, though the wide confidence interval and
> small sample warrant caution.

**Deliberately over-edited version (for the blind pair):**
> Our results show that the intervention reduces symptom severity. While the sample
> was small, the effect is clear and points toward a promising new treatment avenue.

**Blind forced-choice answer key:** a judge picks the **over-edited version** — it
converts "suggest → show", "may be associated with → reduces", and adds "promising new
treatment avenue" significance hype. That's a fabricated overclaim, exactly what
academic mode's claim-evidence discipline and the fact-lock forbid.

**A regression here looks like:** any hedge gets deleted; "suggest" or "may be
associated with" gets strengthened; or the confidence-interval / sample-size caveat
gets cut as "hedging."
