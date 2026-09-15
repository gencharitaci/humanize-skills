# en-tone — golden fixtures (tone layer)

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Any
> change-magnitude percentage below is a rough eyeball estimate, not measured (no scanner).

Tone is the third axis (mode fixes the document type, tone sets the relational
coloring). Three cells where tone and mode pull different ways: a warmth request
the mode must refuse, a warmth request the mode allows inside hard discipline,
and a tone conforming to its own mode's shape.

---

## Case 1 — warmth requested on legal text, cap holds

**Setup:** "Warm this up a little, --legal --tone=human."

**Input:**
> Moreover, the Service constitutes a robust and seamless solution. Furthermore,
> the Company shall not be liable for indirect damages. Moreover, all disputes
> are subject to binding arbitration. The User agrees to these industry-standard
> terms.

**Expected decisions:**
- "Moreover" ×2 + "Furthermore" — repeated-transition cluster, `core-rules.md`
  §2.5. Keep at most one connective in the whole clause set.
- "constitutes," "robust," "seamless" — inflated copula + banned vocabulary,
  `core-rules.md` §2.4 / `en.md`. The marketing first sentence carries no
  operative content: cut it (defined term "Service" survives in the remaining
  sentences — freezing a term never means keeping the sentence around it).
- "industry-standard" — vague unattributed authority, `core-rules.md` §1.2. Cut.
- Tone request REFUSED in one line: `legal.md` never authorizes casual tone and
  `SKILL.md` precedence puts mode caps above tone (`references/tones/profiles.md`
  says the same). No contractions, no first-name warmth, no "we've got you
  covered." Defined terms (Service, Company, User) verbatim throughout.
- Change magnitude: ~40% (eyeballed). No-edit gate: passed — dense cluster.
- Report includes the cap statement; without it the refusal looks like the
  request was ignored.

**Reference "after":**
> The Company is not liable for indirect damages. All disputes are subject to
> binding arbitration. The User accepts these terms.
>
> *(Tone note: --legal keeps formal register, so the requested warmth was not
> applied. Defined terms kept verbatim.)*

**Blind forced-choice answer key:** a judge picks the **Input** — the
moreover-stack, "constitutes," and "robust and seamless" are recognizable
scaffolding. The after reads as cleaned-but-formal, and the one-line cap note
proves the tone request was seen and overruled, not missed.

**A regression here looks like:** warmth applied anyway ("We've streamlined the
legal stuff so you're covered"); "Service" simplified to "our platform"; the
marketing sentence kept with softer adjectives; or the cap applied silently
with no note.

---

## Case 2 — patient-facing medical text, warmth inside discipline

**Setup:** "Make this discharge note kinder, --medical --tone=human."

**Input:**
> It is important to note that the patient should moreover take the medication
> twice daily. Furthermore, side effects may include dizziness. The treatment
> demonstrates excellent efficacy and patients leverage the portal for follow-up.

**Expected decisions:**
- "It is important to note that" + "moreover" + "Furthermore" — hedge prefix and
  fake transitions, `core-rules.md` §2.5/§5. Discharge instructions take direct
  address (`tones/profiles.md` human: direct, plain verbs).
- "may include dizziness" — calibrated uncertainty over a genuine risk, KEPT
  (`medical.md` causal discipline; `core-rules.md` §5 — never delete the one
  hedge a genuinely uncertain claim needs).
- "demonstrates excellent efficacy" — overclaim verb + unmeasured superlative,
  `medical.md`; no trial reference in the source → downgrade and flag, never
  replace with a invented success rate.
- "leverage the portal" — banned verb, `en.md`; "portal" itself is the correct
  term and stays (`medical.md` terminology lock).
- Dosage ("twice daily") byte-identical — `medical.md` dosage lock, fact-lock.
  No invented reassurance ("you'll feel better soon" would assert an outcome —
  the exact causal indiscipline this mode forbids).
- Change magnitude: ~50% (eyeballed). No-edit gate: passed.

**Reference "after":**
> Take the medication twice daily. It may cause dizziness.
> The treatment [efficacy claim needs its trial reference — "excellent" removed,
> nothing substituted].
> Use the portal for follow-up.

**Blind forced-choice answer key:** a judge picks the **Input** — stacked
hedge-prefixes, "moreover/Furthermore," and "demonstrates excellent efficacy"
are textbook AI-clinical prose. The after is direct, keeps the one honest
hedge, and flags the evidence gap instead of performing kindness with invented
reassurance.

**A regression here looks like:** "demonstrates" survives; an efficacy rate or
a recovery promise gets invented; the dosage is reworded ("two times a day" is
fine — "once daily" would be a fact change, not a style fix); or "may cause
dizziness" is deleted as hedging.

---

## Case 3 — social post in social tone, shape conforms

**Setup:** "Punch this up for X, --social --tone=social."

**Input:**
> In today's fast-paced digital landscape, our innovative solution leverages
> cutting-edge technology. Moreover, it delivers robust results. It is not just
> a tool, but a revolution. In conclusion, the future is here. 🚀🚀🚀 Comment
> YES below!

**Expected decisions:**
- Formulaic opener + "innovative / leverages / cutting-edge / robust" (all four
  now in `en.md`) + "moreover" + negative parallelism + summary close —
  `core-rules.md` §1/§2. Near-pure filler.
- Emoji stack + "Comment YES below" — decoration and bait, `social.md`; at most
  one closing emoji, and only on a post with content. An empty post gets none —
  decoration can't carry it.
- Tone-conformant after: hook first, short sentences with one longer explanatory
  one, fragments at spacing (`tones/profiles.md` social row). But the draft
  contains NO mechanism, metric, or audience — so the correct after is flags,
  not punch. Punching up invented specifics would be `social.md`'s first-person
  lie in third-person form.
- Change magnitude: ~85% (eyeballed). No-edit gate: passed.

**Reference "after":**
> Our tool does [X — the draft names nothing; needs the one real thing it does].
> It is fast at [needs the number plus its unit].
>
> *(Flagged: no mechanism, no metric, no audience in the draft — nothing to punch
> up until the author supplies them.)*

**Blind forced-choice answer key:** a judge picks the **Input** — opener,
four-hit vocab cluster, parallelism, "In conclusion," rocket stack, and YES-bait
in twelve lines. The after keeps the social shape (short, direct) while
refusing to perform success it wasn't given.

**A regression here looks like:** a metric invented ("10x faster"); the emoji
stack or bait survives; "revolution" kept as "voice"; or the flags get
reconstructed into plausible specifics.
