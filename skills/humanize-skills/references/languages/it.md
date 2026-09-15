# Language: Italian (it)

Pairs with `references/core-rules.md` and `references/structural-pass.md`. Synthesized
from `similar-github-projects/by-language/it/humanizer-it-2` ("scrittura-italiana"), a
skill organized around classical rhetoric's four virtues of expression rather than a
flat pattern list — that organizing structure is worth keeping, not just its content.
Tier-2, wave 2.

## The four virtues (organize the whole pass around these)

| Virtue | Meaning |
|---|---|
| **aptum** | Fit to purpose, audience, register, genre, and — critically — the text's **control level** (see below) |
| **puritas** | Correctness: punctuation/typography, and word/syntax correctness (accents, homophones, plurals, subjunctive) |
| **perspicuitas** | Clarity — the reader understands on first read; the text holds together (cohesion, coherence) |
| **ornatus** | Regulated beauty — figures, rhythm, *the necessary word* — never decoration for its own sake |

AI-generated Italian's core failure is an **excess of ornatus** — periphrasis, forced
triads, pompous adjectives, gerund-padding — which classical rhetoric already has a
name for: *mala affectatio*. Good writing finds the right measure for the purpose, not
maximum ornamentation.

## The control-level gate — check this before applying any typography rule

Typographic norms depend entirely on how "controlled" the text is, and this is a
distinct axis from formal/informal register:

- **Controlled text** (publishing, official documents, essays, formal publications):
  full norms apply — correct accents (perché, not perche), spaced en-dashes, sentence-
  case headings. Curly quotes are acceptable if the text's own existing style is
  already internally consistent — don't convert a uniformly-styled document just to
  "fix" it.
- **Uncontrolled text** (web, social, chat, quick comments, email): keyboard
  conventions apply and are **not errors to fix**: straight or absent quotes,
  "keyboard" accent substitutes (perche, e'), no em dash. Imposing editorial
  typography on a social comment is itself an *aptum* violation — matching the wrong
  register is a mistake in the other direction.
- **Poetry and experimental prose**: everything can be license (meter, punctuation,
  spelling) — intervene only on explicit request.

Decide the register in this order: an explicit user instruction wins; consistent
keyboard-convention signals in the text (e', perche, all-lowercase, emoji) mean
uncontrolled; an obvious genre (thesis, article, documentation, contract) means
controlled; if still ambiguous and the choice matters, ask in an interactive context,
or default to controlled without invasive typographic normalization in a non-
interactive one, and state that assumption in one line.

## The fact-checking guard (humanizer ≠ fact-checker)

This skill improves form, clarity, and voice — it does not verify facts. AI-generated
text is convincing even when it invents statistics, citations, studies, or people.
Never introduce plausible-sounding data or citations to fill a gap; if an attribution
or figure looks doubtful, flag it separately rather than silently confirming,
correcting, or enriching it.

## The conservation contract — what a revision may never add

Revising a text is not rewriting its content. Never invent or strengthen: facts,
dates, places, quantities, names; quotations or sources; **definitions and glosses of
terms** (even correct ones — propose them separately, don't insert them silently);
causal relationships; numeric comparisons; opinions, emotions, irony, or first-person
experience; value judgments; conclusions absent from the original. Always preserve:
informative polarity and negation (test by implication in context — see the bipolar-
definition rule below); modality (può, potrebbe, sembra, è, deve — never promote
possibility to certainty or correlation to causation); conditions, exceptions, and
limits; the scope of claims; temporal and causal relationships; quotation meaning; and
the author's own voice where it's recoverable from the text or a supplied sample. A
missing necessary detail becomes a placeholder (*[dato da verificare]*), never a
plausible invented detail.

## Intervention level — decide before editing

1. **Proofread**: only objective errors — spelling, accents, agreement, incorrect
   punctuation. Zero style intervention.
2. **Line edit**: clarity and rhythm at close range — untangles a convoluted sentence,
   removes one tic, varies a cadence. No new information, conservative changes only.
3. **Deep rewrite / humanize**: structure and style — reorders, **preserves or
   reconstructs the available voice** (never fabricates one). Still no new content —
   gaps become placeholders, per the conservation contract.

Functional text (technical documentation, APIs, code, structured data, legal text,
procedures) gets treated at the **lowest** level even if a "line edit" was requested —
correct objective errors and stop. Don't reformulate an already-correct sentence for
elegance; in these genres literalness and stability matter more than polish, and an
unrequested touch-up is a defect, not a service.

## puritas — correctness

No comma between subject and verb, or between a verb and its adjacent arguments. A
parenthetical aside takes **two** commas (open and close), never one. A restrictive
relative clause takes no comma; an explicative one does. Hierarchy: comma < semicolon
< period. No capital after a colon (except quoted direct speech). Quotation marks: «
» in controlled text, straight or absent in uncontrolled — never mixed within one
piece. A hyphen `-` joins without spaces; an en-dash `–` separates with spaces and is
used sparingly in Italian. Headings in sentence case. High-frequency word-level
errors: *qual è* (never *qual'è*), *un po'* (never *pò*), *sé stesso* (recommended;
*se stesso* remains legitimate — an oscillating norm), *perché*/*è*, *da/dà*.

## perspicuitas — clarity

Break sentences over roughly 35–40 words or with more than two *che* clauses. A chain
of three abstract nouns linked by *di* should become a verb-led sentence instead.
Keep the subject near the verb; one clause, one idea. Hold the thread: every sentence
hooks onto the previous one, with the connective that actually fits the logical
relation (não *però* for causation, not *quindi* for concession). A "mosaic" text
(individually true sentences with no real connective order, reorderable at will) is
not argumentation — connect it.

## ornatus — anti-AI patterns specifically

- **Copula avoidance**: prefer *è/sono/ha* over periphrasis (*si configura come*,
  *rappresenta*, *costituisce*).
- **Antilingua** (a concept borrowed directly from Italo Calvino's own essay on the
  phenomenon): always prefer the **common word** over the "chosen" one — *fare* not
  *effettuare*, *casa* not *abitazione*, *problema* not *problematica* — and the
  **full verb** over "empty verb + abstract noun" (*effettuare un controllo* →
  *controllare*).
- **Gerundite**: at most one trailing gerund clause per paragraph — the Italian
  version of the English "-ing" padding tell.
- **-mente adverb overuse**: cut an -mente adverb whenever the sentence holds up
  without it.
- **Forced triads** and repeated *"non solo… ma anche"*.
- **The bipolar definition** *"non è X, ma è Y"* (and its variants: inversion *"X, non
  Y"*; plural/tense forms; without the second *è*; with a colon *"non è X: è Y"*; *"e
  non"*): cut to a pure assertion (*"è Y"*) **when it's clearly ornamental** — sharp
  antonyms (*"gratuito, non a pagamento"*) or copy-style elevation (*"non un semplice
  X, ma Y"* → *"è una soluzione completa"*). **Preserve when it carries information or
  you're in doubt** (fidelity beats cleanliness) — category exclusion where X is the
  default reading, quotations, triadic anaphora, thesis statements, philosophical
  distinctions, glossaries. The test is **implication in context** — does *"è Y"*
  already imply *"not X"*? — not a lexical pattern match.
- **Don't manufacture elegant variation**: repeating a name (*Federer*, not "the Swiss
  tennis player") is correct, not a flaw to fix.
- A rhetorical figure earns its place only if it adds meaning or force; otherwise it's
  *mala affectatio*.
- **Aim one register below** the instinct — restraint, no pathos, no purple prose;
  cut superfluous adjectives, adverbs, and hedges.

## dispositio — how the piece is built

Enter the subject immediately — no gray preamble, no dictionary-style definition to
open. Structure the argument (anticipate and answer objections). Close without
inflation: a sober summary or a real question — never an uplifting "message" tacked on
at the end.

## Numeric thresholds are heuristics, not laws

Every specific number in this file ("35–40 words," "one gerund per paragraph," "one
uncertainty marker") diagnoses a *tendency*, not a hard ban — calibrate to genre and
register. A treatise legitimately holds long periods; lyrical narrative legitimately
lives on adverbs; a scientific text legitimately accumulates real qualifications.
Applied as an automatic ruler, these thresholds produce false positives on perfectly
good authorial prose. Use them as flags to verify, not a mechanical count to enforce.

### Opener rotation and pre-flight carve-out

Conjunction openers: E, Ma, O, Quindi, Però, Dunque. Correct congiuntivo in
openers signals education — preserve; si-passivante piles banned. Rhetorical
"Ha senso?"-style openers social-only. Pre-flight carve-out: none confirmed —
universal pre-flight applies; native review may add one.

## Worked example

**Before:**
> Questo strumento si configura come una soluzione realmente innovativa, che non è
> semplicemente un prodotto, ma rappresenta un vero cambiamento di paradigma,
> garantendo risultati eccellenti e permettendo di ottimizzare ogni processo.

**After:**
> Questo strumento riduce i tempi di lavorazione del 30%. Non richiede formazione
> specifica.

**Changes:** the copula avoidance ("si configura come," "rappresenta") was restored to
a plain statement; the ornamental bipolar definition ("non è semplicemente... ma
rappresenta...") was cut to a direct assertion since it carried no information beyond
elevation; the trailing gerund padding ("garantendo... permettendo...") was removed;
replaced with the two concrete facts the sentence was gesturing toward — no new facts
were invented, these are illustrative placeholders for what a real revision would draw
from the source.

## Sources

`similar-github-projects/by-language/it/humanizer-it-2` — the four-virtues framework,
the control-level gate, the conservation contract, and the antilingua/bipolar-
definition rules this file draws on most heavily; grounded in classical Italian
rhetoric and stylistics (Mortara Garavelli, Calvino's *L'antilingua*, Serianni, Giunta).
Two sibling repos, `humanizer-it-1` (with an extensive internal eval history) and
`humanizer-it-3`, exist in the same folder for further cross-checking.
