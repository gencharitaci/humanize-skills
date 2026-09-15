# Language: German (de)

Pairs with `references/core-rules.md` and `references/structural-pass.md`. Synthesized
from `similar-github-projects/by-language/de/humanizer-de`, a 72-pattern catalog with
its own five-pass pipeline, a documented false-positive corpus, and an explicit mapping
of what statistical detectors (GPTZero-style) actually measure versus what this
catalog fixes — the two are not the same thing, and conflating them causes damage.

## The detector-mismatch lesson (read this first)

Statistical detectors measure two things: **perplexity** (how predictable the next
word is) and **burstiness** (how much sentence length and structure vary). Their
human-readable labels ("Mechanical Precision," "Impersonal Tone," "Robotic Formality")
are just translations of those two numbers — and they fire on **exactly what makes
technical writing good**: precise terminology, correct source attribution, plain
factual clarity. Do not "fix" a low-perplexity finding by degrading accurate technical
language; that's not humanizing, it's damage. The only levers this catalog can pull
against those two detector signals without hurting the text are sentence-rhythm
variance (pattern 55) and clustered colon-titles (pattern 54) — everything else in a
detector's report that isn't one of this file's 72 named patterns is not this skill's
to "fix."

## Mode gate — determine before anything else

| Mode | Used for | Voice |
|---|---|---|
| Locker (casual) | Blog, social, newsletter | Full personality, not manufactured |
| Sachlich (matter-of-fact) | Website, docs, email, B2B | Restrained, neutral |
| Formal | Academic, legal, technical-specialist | No injected voice at all |

If unclear, default to Sachlich and say so. The mode changes which severity classes get
touched: HIGH artifacts and evidence problems are corrected in every mode; HIGH style
issues are corrected in Locker/Sachlich but often skipped in Formal (participle-tail
constructions, for instance, are stylistically accepted in scientific German and should
be left alone there). MEDIUM soft-style patterns are only touched when they cluster.

## Count clusters, not single signals

A single transition word, a single dash, clean grammar, or typographic quotes alone are
never a tell on their own. This governs the whole catalog more strictly here than in
most other languages: several named patterns below were explicitly downgraded from
HIGH to MEDIUM severity in the source's own version history after over-aggressive
single-instance removal was found to damage legitimate writing (the rule-of-three
pattern, specifically, was downgraded after real user complaints about wholesale
dismantling of ordinary three-item lists).

## High-severity patterns (correct even as a single instance)

- **Symbolic inflation**: "steht als Zeugnis für," "spielt eine wichtige Rolle bei,"
  "symbolisiert" — state the concrete fact instead.
- **Advertising language and superlatives**: "atemberaubend," "einzigartig,"
  "spektakulär," "faszinierend," including translated English AI hype idioms ("das
  ändert alles" for "this changes everything").
- **Editorial meta-commentary**: "es ist wichtig zu bemerken," "es sollte
  hervorgehoben werden."
- **Mechanical connectives repeating**: "darüber hinaus," "außerdem," "ferner" used
  reflexively across consecutive sentences.
- **Participle-tail padding** ("-end" constructions: "gewährleistend,"
  "hervorhebend," "ermöglichend") — **except in Formal/scientific register, where
  this construction is stylistically standard and should be left alone.**
- **Vague authorities**: "Branchenberichte zeigen," "Manche argumentieren" with no
  named source — either supply the real source, remove the attribution, or mark
  `[ECHTE QUELLE NÖTIG]`. Never invent one.
- **Citation fabrication**: invented sources, invalid DOIs/ISBNs, a real source that
  doesn't actually support the claim.
- **Letter-style writing and collaborative chatbot residue** ("Ich hoffe, das hilft,"
  "Natürlich!") left in delivered content.
- **Hidden Unicode artifacts**: zero-width spaces, soft hyphens, BOM, bidi controls.
- **Fabricated German quotation marks**: the wrong closing mark ("Text" instead of
  „Text") — a mechanical typography error, always worth fixing regardless of cluster.

## Medium-severity patterns (fix on clustering, not on a single instance)

- **Negative parallelism and clipped negation fragments**: "nicht nur… sondern
  auch," and the tacked-on fragment style ("kein Raten." instead of a full clause) —
  except when the construction expresses a genuine factual correction ("nicht Montag,
  sondern Dienstag"), which is not a tell.
- **Rule-of-three and suspiciously round list lengths** (exactly 5, 7, or 10 points) —
  fix only when the pattern actually repeats; a single triad is not evidence.
- **Copula avoidance**: "fungiert als," "verfügt über," "stellt … dar" replacing
  "ist"/"hat," and the parallel upgrade of plain verbs ("verfasste" for "schrieb,"
  "verstarb" for "starb") — acceptable in Formal register, a tell only when clustered
  in a neutral or casual register where the plain verb would be more natural.
- **AI marker vocabulary**: "beleuchten," "eintauchen," "die (digitale) Landschaft"
  (figurative), "das Spannungsfeld," "der Meilenstein" (figurative) — individually
  unremarkable, a tell only in co-occurrence (3+ in one text).
- **Abstraction stacking and hypernym preference**: "verschiedene Maßnahmen,"
  "zahlreiche Aspekte" replacing a concretion the text or context actually supports.
  Never invent the missing specific detail to sound concrete — that's pattern 53
  (spekulative Lückenfüllung), a worse defect than the vague version.
- **Synonym rotation for one entity**: three or more different names for the same
  referent in one section — applies to proper nouns and ordinary recurring terms alike
  ("die Studie" → "die Untersuchung" → "die Analyse" for the same study).
- **Dash-punctuation clusters**: multiple em/en dashes, paired dash-set asides, or
  spaced hyphens used as dash substitutes in one paragraph. Replacement hierarchy in
  priority order: period, comma, colon, semicolon (sparingly — clustered semicolons are
  their own tell), parentheses, or restructure entirely.
- **False-dichotomy conclusions**, including the extended "praise → challenges →
  outlook" three-beat document template spread across paragraphs — a tell only as an
  empty-content pattern; a genuinely evidenced outlook with real numbers and named
  risks is not a defect.
- **Register collapse**: a text marked as casual (chat message, team update) that
  carries informal surface markers (greetings, emoji) over a fully-formed essay
  architecture underneath (complete sentences, one topic per paragraph, an explicit
  close). The markers are sprayed on; the structure is still an essay.

## What NOT to flag (documented false positives)

- Quotes inside code blocks, inline code, YAML frontmatter, Markdown image titles, or
  raw HTML tags — straight quotes there are technical syntax, not a typography error.
- Sentence-initial "Sie" address alone — conservative default counts it once; a clear
  singular anaphora ("Die Idee war neu. Sie überzeugte sofort.") is not register drift.
- Modal particles used in their literal, non-particle sense: "schon" meaning
  "bereits," "mal" meaning "einmal," "ja" as a plain answer, "stellt" as a full verb
  ("stellt eine Frage"). Only the reflexive discourse-particle use counts.
- A subject-initial-sentence ratio above 0.85 — unremarkable on its own (measured
  human writing runs a median of 0.816); a tell only alongside additionally suppressed
  sentence-length variance or repeated identical sentence openings.
- A single colon-titled heading — behavior only becomes a pattern at two or more
  identically-structured colon-titles in the same document.

### Opener rotation and pre-flight carve-out

Conjunction openers: Und, Aber, Oder, Denn, Doch, Sondern — preserving
verb-second order after the conjunction (a conjunction opener that breaks
verb-second is a defect, not variety). "Man sollte" preaching never opens.
Questions direct, no softening stack. Pre-flight carve-out: legal-register
Nominalstil is unscored for rhythm (standing default in `SKILL.md`).

## Register table

| Class | Locker | Sachlich | Formal |
|---|---|---|---|
| HIGH artifact/chatbot/technical | fix | fix | fix |
| HIGH evidence/source problem | flag/correct | flag/correct | flag/correct |
| HIGH style | fix | fix | only if not field-conventional; skip participle-tail pattern entirely |
| MEDIUM technical/structural | fix | fix | flag or cautiously fix |
| MEDIUM soft style | fix on clustering | fix on clear clustering/mechanism | usually flag only |
| LOW formatting | fix if disruptive | fix on a clear rule violation | usually skip or flag |

False friends and hard calques are corrected in every register; softer calques and
syntactic transfers get corrected in Formal, but only on clustering in Sachlich/Locker.

## Worked example

**Before:**
> Die Galerie fungiert als Ausstellungsraum des Vereins und verfügt über vier Räume mit
> insgesamt 280 Quadratmetern. Sie stellt zudem einen wichtigen Bestandteil der
> lokalen Kunstszene dar und spielt eine wichtige Rolle bei der Förderung junger
> Künstler.

**After:**
> Die Galerie ist der Ausstellungsraum des Vereins und hat vier Räume mit insgesamt
> 280 Quadratmetern. Sie zeigt vor allem Arbeiten junger Künstler aus der Region.

**Changes:** copula avoidance ("fungiert als," "verfügt über," "stellt … dar")
restored to plain "ist"/"hat"; the reflexive significance-inflation closer ("spielt
eine wichtige Rolle bei") replaced with the concrete fact it was gesturing at.

## Sources

`similar-github-projects/by-language/de/humanizer-de` — the full 72-pattern catalog
(`references/patterns.md`), the mode/register system (`references/register-profiles.md`
and the mode matrix in `SKILL.md`), and a documented false-positive test corpus
(`tests/fp_corpus/`) worth reading directly before extending this file.
