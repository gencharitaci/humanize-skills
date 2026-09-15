# Mode: legal

For contracts, NDAs, privacy/DPA text, policies, formal notices, compliance memos,
and legal correspondence. Not for general business writing about a legal topic in
plain language — that stays in `--business`; this mode is specifically for text that
carries or describes actual legal obligations.

## Core principle, stated as a hard boundary

This mode changes register. **It does not give legal advice, certify compliance, or
invent a legal basis.** If a rewrite would require asserting a statute, article,
deadline, or qualification not already present in the source, don't add it — leave an
explicit gap marker and say the passage needs a lawyer or compliance officer to fill
it in. Never cite a specific legal provision from memory; a plausible-sounding
citation in a legal document is worse than an admitted gap, because it will be
trusted.

## Formality here is correct register, not a tell

Legal writing's precision, defined terms, and modal-verb discipline are the genre
working as intended — general mode's instinct to "loosen up" formal prose does not
apply. The actual failure mode in legal AI writing runs the opposite direction: vague
hedging, generic filler, and imprecise modal verbs where the genre requires exactness.

## Modal verbs carry different legal force — never treat them as synonyms

"Shall"/"must" (obligation), "may" (permission/discretion), "will" (future fact, not
obligation), and "should" (recommendation, not a binding duty) are not interchangeable
even when a general-purpose smoothing pass would treat them as stylistic variants.
Swapping one for another to "vary the language" changes what the clause actually
requires. The same discipline applies to paired terms that look synonymous but carry
different legal roles — most importantly, **never conflate the party who decides how
data is used with the party who processes it on another's behalf** (controller vs.
processor, or the equivalent pair in the relevant jurisdiction); treating them as
interchangeable changes who is liable.

## Two structural traps specific to legal text — these are substance, not style

- **Making a one-directional clause symmetrical "for balance."** A clause protecting
  only the drafting party is a deliberate allocation of risk. Rewriting it into
  mutual, elegant-sounding language hands the counterparty a protection they were
  never offered — that is a different deal, not a polish pass. If a balanced version
  would genuinely be the better contract, say so in a note to the requester; never
  perform that change silently inside the clause itself.
- **Widening a clause's scope while tidying its wording.** Extending a clause that
  covers "the counterparty" into one that also covers "its subcontractors and
  agents" is a substantially larger risk allocation, not a smoother sentence. The
  perimeter of a clause is as much substance as its deadline or dollar figure — treat
  edits that expand or narrow scope with the same caution as edits to a number.

## Never assert a mechanism, deadline, or act that isn't in the source

A notice period, a forfeiture clause, an audit right, an automatic-renewal term, a
specific breach-notification window — these are obligations with real consequences.
Writing them in with a placeholder number ("within [XXX] days") doesn't make them
safe; if the source didn't specify the mechanism, it doesn't belong in the clause at
all — propose it separately as something the requester needs to supply, rather than
drafting it into the document.

## Vocabulary and content tells to actually fix

- **Unsupported absolute claims**: "guarantees," "complete security," "impossible to
  breach" — in legal writing, an absolute promise is an assumed liability, not
  marketing color. Flag or soften to what's actually true.
- **A compliance claim asserted rather than described**: "we are GDPR compliant" (or
  the equivalent under another regime) asserts a status nobody certifies that way.
  State what was actually done — the policy that was updated, the register that's
  maintained, the agreements that were signed — instead of the unfalsifiable claim.
  This is the legal-writing version of the engine's overclaiming-verb check.
- **Softened breach or incident language.** A breach notification has required
  content and a deadline; vagueness in that specific passage is itself a compliance
  problem, not a style issue — this is one of the few places in this mode where more
  precision is always the fix, never a judgment call.
- **A named legal basis that doesn't match the actual arrangement** — e.g., citing
  consent as the basis for something that actually runs on a contractual or
  statutory obligation. Flag the mismatch rather than silently harmonizing the
  language around whichever basis reads better.

## Register scaling

A cautious default applies here: precision, explicit scope, and stated conditions
increase with formality — never emphasis, adjectives, or persuasive language. An
internal legal note can be plain and direct; a contract clause, a formal notice, or a
regulatory filing wants defined terms, explicit conditions, and every obligation
paired with a subject, a deadline, and a consequence, with nothing left implied.
There is no register above that — a maximally "impressive"-sounding legal document is
a liability, not a stronger one. If a requester asks for a more emphatic or persuasive
version of a genuinely legal document, say plainly that inflating the language adds
risk rather than authority, and offer the precise version instead.

## Fact-lock, legal-specific

Never invent a statute, article number, deadline, party name, jurisdiction, or figure.
Never invent that an act occurred — a notice was sent, a filing was made, a deadline
was met — unless the source states it happened; write the proposing or conditional
form instead ("a notice should be sent within...") and flag the gap. A missing
number becomes an explicit placeholder for the requester to fill in, never an
invented one that merely looks plausible.

## Output

Return the cleaned text plus a change report, and treat any place where a citation,
mechanism, or deadline was flagged rather than filled as the most important line in
that report, not an afterthought.

## Sources

`similar-github-projects/by-language/it/humanizer-it-3` ("prospeak")'s
`branches/legal-compliance.md` — the symmetry-is-substance and widening-the-perimeter
findings, the controller/processor conflation warning, the never-invent-a-mechanism
rule, and the register-scaling table this file draws on almost entirely; a
same-family skill built specifically around the finding that inflated language on a
legal document creates risk rather than credibility.
