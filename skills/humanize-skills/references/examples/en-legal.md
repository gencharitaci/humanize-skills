# en-legal — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Any
> change-magnitude percentage below is a rough eyeball estimate, not measured (no scanner).


`--legal`. Changes register only. Never gives advice, certifies compliance, or invents
a legal basis. Modal verbs are not synonyms. Scope and symmetry are substance.

---

## Case 1 — inflated + vague policy paragraph, edit warranted

**Setup:** "Make our privacy policy sound more professional and reassuring, --legal."

**Input:**
> We take your privacy extremely seriously and are fully committed to protecting your
> data with industry-leading, state-of-the-art security. Your information is completely
> safe with us and will never be compromised. We are proud to be fully GDPR compliant,
> and we may share your data with trusted partners to enhance your experience.

**Expected decisions:**
- "take your privacy extremely seriously," "proud to," "enhance your experience" —
  marketing color in a document that carries obligations, `legal.md` (register: no
  emphasis/adjectives/persuasion). The requester's ask for "reassuring" is capped.
- "industry-leading, state-of-the-art security," "completely safe," "will never be
  compromised" — unsupported absolute claims = assumed liability, `legal.md`. Soften
  to what's true.
- "fully GDPR compliant" — a compliance claim asserted rather than described,
  `legal.md`. State what was actually done.
- "we may share your data with trusted partners" — "may" (permission) is a real modal
  choice; keep the modal but the vague "trusted partners" / "enhance your experience"
  needs the actual categories of recipient and purpose. Flag as needing the real list.
- Fact-lock: don't invent recipient categories, retention periods, or a lawful basis.
- Register cap: tell the requester plainly that inflating the language adds risk, not
  authority; deliver the precise version.
- Change magnitude: ~60%. No-edit gate: passed.

**Reference "after":**
> We process personal data to operate the service and meet our legal obligations.
> We apply technical and organizational security measures appropriate to the risk;
> no method of storage or transmission is completely secure. We share personal data
> with [categories of processor/recipient — to be supplied] for [stated purposes — to
> be supplied], under written data-processing terms. Our data-protection practices are
> described in the sections below.
> *(Flagged: the policy needs the actual recipient categories, purposes, retention
> periods, and lawful basis; "GDPR compliant" was replaced with a description of
> practices — a lawyer or DPO should confirm the specifics.)*

**Blind forced-choice answer key:** a judge picks the **Input** — "extremely
seriously," "state-of-the-art," "completely safe," "proud to be fully GDPR compliant"
are the tells; a real policy doesn't promise data "will never be compromised."

**A regression here looks like:** an absolute security promise survives; "GDPR
compliant" is kept as an assertion; recipient categories or a lawful basis get
invented to fill the placeholders; or "may share" gets changed to "will share" or
"shall share" (different modal force).

---

## Case 2 — one-directional indemnity, do not "balance" it

**Setup:** "Polish this clause so it reads more even-handed, --legal."

**Input:**
> The Vendor shall indemnify and hold harmless the Client against any and all claims
> arising from the Vendor's breach of this Agreement.

**Expected decisions:**
- The clause deliberately protects only the Client. Rewriting it into mutual
  ("each party shall indemnify the other") is a different deal — `legal.md`, the
  symmetry-is-substance trap. **Do not** do it silently.
- "shall" = obligation; keep it. Do not vary it to "will" or "agrees to."
- "any and all" is legal-register redundancy, not an AI tell — leave it or note it's a
  stylistic-only trim the requester can approve; it does not change scope.
- No-edit gate: **triggered** for the clause text. The correct response is a note, not
  an edited clause.
- Change magnitude: 0% to the clause.

**Reference "after":**
> (clause unchanged) — This indemnity runs one direction (Vendor → Client) by design;
> that's a risk allocation, not a drafting slip. A mutual version would give the Vendor
> a protection it currently isn't offered — a different commercial deal. If you want
> that, say so and it can be drafted and flagged for the counterparty, not slipped in
> as a "polish." "shall" was kept (it's an obligation, not interchangeable with
> "will").

**Deliberately over-edited version (for the blind pair):**
> Each party shall indemnify, defend, and hold the other party harmless against any
> and all claims, losses, and liabilities arising from such party's breach of this
> Agreement or its negligent acts or omissions.

**Blind forced-choice answer key:** a judge picks the **over-edited version** as the
machine-touched one — it silently converted a one-way clause to mutual and widened
scope ("negligent acts or omissions"). That's a substantive change disguised as
polish.

**A regression here looks like:** the clause comes back mutual, or with widened scope
("and its subcontractors and agents"), or with "shall" swapped for "will"/"agrees to."
