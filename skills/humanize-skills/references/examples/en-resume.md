# en-resume — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Any
> change-magnitude percentage below is a rough eyeball estimate, not measured (no scanner).


`--resume`. Candidate-authored. Primary defect = "could describe almost anyone in this
role." Convert generic self-description into specific, checkable claims. Never invent a
number. Preserve real metrics, ATS keywords, the dropped-subject convention.

---

## Case 1 — generic bullets, edit warranted (with gaps flagged)

**Setup:** "Rewrite my resume bullets to sound less AI, --resume." English.

**Input:**
> - Results-driven professional with a proven track record of success
> - Responsible for managing cross-functional teams and driving operational excellence
> - Detail-oriented team player passionate about leveraging data to unlock insights
> - Tasked with improving processes and delivering high-impact outcomes

**Expected decisions:**
- "Results-driven," "proven track record," "detail-oriented team player," "passionate
  about" — trait-not-action vocabulary tells, `resume.md`. Replace each with the
  action/result that lets a reader infer the trait.
- "Responsible for managing," "Tasked with" — responsibility-listing + passive
  agentless construction, `resume.md`. Lead with an active verb; add the outcome.
- Every bullet fails the rival-candidate test — flag as the primary defect.
- "driving operational excellence," "unlock insights," "high-impact outcomes" —
  significance inflation with nothing behind it.
- Fact-lock: no numbers, team sizes, or outcomes supplied → the rewrite must **not**
  invent them; each rewritten bullet carries an explicit "[candidate: add the number]".
- Preserve: dropped subject pronoun ("Led...", not "I led...").
- Change magnitude: ~80% of wording, but 0 new facts.

**Reference "after":**
> - Led [team size] across [functions] to [specific goal]; [outcome — candidate: add
>   the metric, e.g. "cut cycle time from X to Y"]
> - Rebuilt [the specific process] because [the specific problem it was causing];
>   result: [candidate: add the before/after number]
> - Built [the specific dashboard/model] that [the specific decision it informed]
> *(Every bracket is a place the candidate must supply a real number or name — none
> were in the draft, and none were invented. All four original bullets passed the
> "a rival candidate could publish this unchanged" test, which is the main thing to
> fix here.)*

**Blind forced-choice answer key:** a judge picks the **Input** — "Results-driven ...
proven track record of success" and "passionate about leveraging data to unlock
insights" are pure resume-bot. The reference-after is a skeleton, but an honest one
that names specific artifacts.

**A regression here looks like:** the rewrite invents a team size, a percentage, or an
outcome to make a bullet land; keeps "results-driven" or "detail-oriented"; or inserts
"I" in front of every verb, breaking the genre convention.

---

## Case 2 — a real, specific bullet — leave it alone

**Setup:** "Humanize my resume, --resume."

**Input:**
> - Cut new-hire onboarding from 3 weeks to 4 days by replacing the shadowing period
>   with a written checklist and a staged-access schedule; adopted by all 5 regional
>   teams the following quarter.

**Expected decisions:**
- Passes the rival-candidate test decisively — specific numbers, a specific mechanism,
  a specific adoption outcome. `resume.md` "what NOT to flag": genuine verifiable
  metrics, even when impressive, are not significance inflation.
- Active verb lead ("Cut"). Dropped subject. Varied length warranted by the content.
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> - Spearheaded a transformative overhaul of the onboarding experience, leveraging a
>   streamlined checklist-based approach to dramatically accelerate time-to-productivity
>   for new team members across the organization.

**Blind forced-choice answer key:** a judge picks the **over-edited version** —
"Spearheaded a transformative overhaul," "leveraging a streamlined ... approach,"
"dramatically accelerate time-to-productivity" replaced every concrete number with
inflation. The input is the strong bullet.

**A regression here looks like:** the "3 weeks to 4 days" or "all 5 regional teams"
detail gets abstracted away; "Cut" becomes "Spearheaded"/"Drove"; or a qualifier like
"successfully" or "effectively" gets added.
