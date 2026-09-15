# Mode: academic

For papers, theses, abstracts, rebuttals, related-work sections, and funding
proposals. Not for blogs, marketing copy, or personal essays — see `modes/creative.md`
for those instead — and never inject opinion, humor, or first-person "personality"
here. In technical and scholarly writing, neutral and precise *is* the human register;
the goal is stripping AI tells without casualizing the prose, not making it sound like
a blog post.

## Core principle

Academic writing already has a correct human register: neutral, precise, third-person
plural ("we"), every claim tied to its evidence. This mode narrows general mode's job
rather than replacing it: (1) remove the same tells `core-rules.md` already targets,
and (2) enforce a discipline general mode doesn't need — every claim earns its number,
figure, or citation, and no verb is stronger than the evidence actually behind it.

## Preserve these — do not strip them as general-mode tells

- **Evidence-tied hedging** ("suggests," "is consistent with," "we hypothesize that,"
  "may indicate") when the underlying claim is genuinely uncertain. Turning "the
  results suggest X" into "the results show X" is not a fix — it's a fabricated
  overclaim, and the fact-lock in `SKILL.md` forbids it.
- **Passive voice**, when the actor is genuinely irrelevant ("samples were normalized
  to total protein").
- **First-person plural "we"** — standard academic register, not a tell.
- **A moderate, non-repetitive attribution phrase** ("prior studies have shown
  that...") when it's followed by an actual citation or specific data. Only flag
  attribution that is genuinely vague *and* unsupported (`core-rules.md` §1.2).
- **Formal definitions, named methods and metrics, technical terms, equations,
  symbols, and citation keys** — verbatim, always, with no exceptions.

## Tells specific to academic AI writing

- **Over-claiming verbs.** Empirical work *shows* and *provides evidence for*; it does
  not *prove* or *demonstrate* a universal truth. Watch: demonstrate, prove, establish,
  confirm, guarantee — and "significantly" used with no attached test or number.
- **Significance hype.** "Paves the way for," "a crucial step toward," "sheds light
  on," "bridges the gap," "of paramount importance" — state the specific thing the work
  actually does instead of the genre of importance it's claiming.
- **Empty intensifiers.** "Extensive/comprehensive experiments," "a wide range of" —
  name the actual scope (the three datasets, the N participants, the specific
  benchmark).
- **Novelty padding.** More than one "novel" per section; "to the best of our
  knowledge" used reflexively rather than because a genuine literature gap was
  actually checked.
- **Formulaic openers.** "In recent years, X has attracted increasing attention," "With
  the rapid development of..." — open with the actual gap or limitation being
  addressed instead.
- **Citation dumping.** A bracketed list of five sources with no discussion is weaker
  than naming the one or two that actually matter and stating how the current work
  differs from them.
- **Boilerplate emphasis.** "It is worth noting that," "Importantly," used reflexively
  — if the point genuinely matters, the sentence carries that weight on its own.

## Claim-evidence discipline

For every empirical claim: is it backed by a number, figure, table, or citation in the
text, and does the verb match the strength of that evidence?

- **Unbacked claim** → add the evidence pointer, or soften the claim to what's actually
  shown.
- **Verb stronger than the evidence** → downgrade it ("demonstrates universal
  superiority" → "matches or exceeds the strongest baseline on these three datasets").
- **Vague magnitude** → a number or a range, attributed to its specific method, metric,
  and baseline — not an averaged figure with the averaging method left unstated.

## Voice and venue

If prior writing is supplied, read it first and match sentence rhythm, hedging habits,
and how sections tend to open — see `references/voice-calibration.md`, including its
warning: a profile built only from someone's strongest passages produces a caricature,
not their voice. Match the target venue's register too — a terse, results-forward
conference paper reads differently from an expository journal piece. Absent a sample or
a stated venue, default to clean, precise, unremarkable academic prose, not the casual,
opinionated register general and creative mode allow.

## Sub-mode: funding proposals (NSF, NIH, and similar)

A proposal is sold on vision and feasibility, not finished results, and its register
differs from a paper's. **Do not flatten the vision** the way the rules above would in
a paper — ambition language ("long-term goal," "establish a foundation,"
"transformative") is appropriate here, provided it's backed by a credible plan. Apply a
different discipline instead: **claim must be matched by feasibility.**

- For every promised outcome, check whether it's backed by preliminary data, a prior
  published result, a classical foundation to build on, or a named collaborator. If
  yes, keep the ambitious verb. If no, either attach the missing evidence or scale the
  claim down to what the plan actually supports.
- Never invent preliminary results, prior funding, partners, or letters of support that
  don't exist — flag the gap to the author instead of papering over it. This is the
  fact-lock, applied to a proposal's specific failure mode.
- Keep run-in lead-ins ("**Goal:**", "**Innovation:**") and a clear opening arc
  (long-term vision → this proposal's specific gap → the aims → the payoff). Reviewers
  skim; visible structure here is doing real work, not padding.

## Output

Return the cleaned text plus a short change report: patterns removed by category, any
claim that was softened or given an evidence pointer, and explicit confirmation that no
number, equation, or citation was altered.
