# Mode: medical

For clinical reports, research abstracts, protocols, patient education material,
medical device and pharma communication, and health-system correspondence. Not for
general health/wellness blogging — that stays in `--general`, where AI-tell removal
runs at ordinary intensity because no regulated claim is at stake.

## Core principle

Medical writing has its own correct register, and much of what other modes treat as
an AI tell is exactly right here: calibrated hedging, passive voice in methods
sections, and precise terminology are the discipline, not a defect to smooth away.
This mode's job is narrower than general mode's: remove genuine AI tells (empty
significance inflation, vague "studies show" attribution, promotional language
about a therapy) while leaving the parts of formal medical register that exist for a
reason strictly alone. When in doubt, the fact-lock in `SKILL.md` binds harder here
than almost anywhere else in this engine — an invented specific in medical text isn't
just a style failure, it can be acted on by a reader.

## Preserve these — do not strip them as tells

- **Calibrated hedging** ("suggests," "is associated with," "the data are
  consistent with," "may indicate") wherever the underlying evidence is genuinely
  uncertain, observational, or drawn from a limited sample. Turning "is associated
  with" into "causes" is not a style improvement — it's a fabricated causal claim.
- **Passive voice in methods and procedural sections** ("samples were incubated at
  37°C," "patients were randomized 1:1") — standard register, not a missing-agent
  defect.
- **Precise clinical, regulatory, and statistical terminology**, drug and device
  names, dosages, units, confidence intervals, p-values, and every number — verbatim,
  always, with zero paraphrase-induced drift.
- **Explicit population, condition, and limitation scoping** ("in this cohort of
  patients over 65 with...," "single-center, non-randomized") — cutting this to
  "tighten" the prose is cutting the exact information a clinical reader needs to
  judge whether the finding applies to their patient.
- **Prominent warnings and contraindications** — never move these later in a
  document, shorten them, or soften their register for readability.

## The single hardest rule: never upgrade a claim past its evidence

- "Suggests" does not become "shows" or "demonstrates." "Is associated with" does not
  become "causes" or "prevents." "May reduce" does not become "reduces."
- **Relative risk quoted alone is a tell to fix, not a tell to preserve** — a "50%
  reduction" that goes from 2-in-1000 to 1-in-1000 is honest arithmetic and dishonest
  communication once the absolute figures are dropped. If the source gives both, keep
  both; if the source gives only the relative figure, flag the gap rather than
  quietly stripping context that was never there to strip.
- **Efficacy (trial conditions) and effectiveness (real-world practice) are different
  claims** — don't let a rewrite collapse the distinction for smoother prose.
- Never convert "correlation" into "causation" language anywhere in the piece,
  including in a summary or conclusion sentence that restates an earlier, correctly
  hedged finding.

## Tells specific to medical AI writing (these are the actual targets)

- **Significance inflation about a therapy or device**: "groundbreaking treatment,"
  "revolutionary approach," "game-changing therapy" — these are not just clichés
  here, they're close to a promotional-claims problem in a regulated space. Replace
  with the specific documented effect.
- **Vague attribution**: "studies show," "research indicates," "experts agree" with
  no study named. In medical writing this is worse than filler — a reader may assume
  a specific trial exists. Name the actual source or cut the claim.
- **The "more research is needed" close** used reflexively rather than specifying
  what's actually missing (what population, what comparator, what endpoint,
  what follow-up duration) — replace with the actual specific gap.
- **Promotional tone about a drug, device, or outcome** — beyond the regulatory
  problem in most jurisdictions (advertising rules on medicines and devices are real
  and vary by country), a clinical reader reads promotional language about a therapy
  as a signal the underlying data is weak, which undermines the piece even where it
  isn't a compliance issue.
- **High-frequency AI vocabulary in this domain**: "holistic care approach,"
  "comprehensive management strategy," "innovative treatment paradigm" clustered
  together — say what was actually done instead.

## Patient-facing register is a different register, not a lighter version of the clinical one

Writing to a patient or caregiver is not the clinical register with big words
removed — it's short, concrete, second-person, and states what to do. Don't apply
the clinician-register preservation rules above (heavy hedging, passive voice,
technical density) to patient materials; a patient leaflet that hedges like a trial
report is a comprehension failure, not appropriate caution. Match the register to
who is actually reading, every time, and never let a single document drift between
the two without a clear section break.

## Fact-lock, medical-specific

Never invent a diagnosis, a treatment, a dosage, a piece of evidence, a
contraindication, or a reassurance not present in the source. Never convert general
information into what reads as personal medical advice. If a claim needs a specific
number, population, or citation that the source doesn't supply, flag the gap in the
change report rather than filling it with a plausible-sounding placeholder — a
plausible number in medical text is read as a real one.

## Output

Return the cleaned text plus a change report that explicitly separates (1) tells
removed, (2) any claim whose verb was downgraded to match its evidence, and (3) any
gap flagged rather than filled — the third category matters more here than in most
modes, and should never be silently empty just because nothing was found.

## Sources

`similar-github-projects/by-language/it/humanizer-it-3` ("prospeak")'s
`branches/healthcare-pharma.md` — the efficacy-vs-effectiveness distinction, the
relative-risk-alone tell, the patient-vs-clinician register split, and the
regulated-claims framing this file draws on most; `similar-github-projects/
multilingual/patina/document-types/medical.md` — the pattern-override concept
(hedging, passive voice, and some nominalization reduced in medical text specifically
because they're genre-appropriate there) that grounds this file's "preserve" section.
