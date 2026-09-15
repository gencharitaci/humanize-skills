# Core Rules — Universal Surface Pass

Language- and mode-independent. Every purpose mode and every language layer on top of
these categories; a mode may tune how strictly one applies (see `modes/*.md`), but
none of them are ever fully disabled by default.

## 0. Rhythm first

Restructure sentence rhythm before touching a single word. Vary sentence length
deliberately within a paragraph — mix short, blunt sentences with longer ones that take
their time. Vary paragraph shape; don't force every paragraph into "topic sentence +
2–3 supporting sentences." Diversify how consecutive sentences open (don't let three in
a row start with the same subject-verb shape).

This is, by a wide margin, the single highest-leverage move in this file. Restructuring
rhythm alone — done before any vocabulary edit — has been measured to move detector
scores further than every word-choice fix in the rest of this document combined. The
mechanism has a name: **sentence-level surprise variation.** Machine prose keeps
per-token surprise in a narrow band (uniformly polished rhythm); human prose alternates
punchy lines with meandering ones, so surprise varies widely sentence to sentence.
Detectors that measure this variation separate the two far better than any word list —
which is also why word lists expire (one famous banned word collapsed within a year as
models adapted) while rhythm persists. Vary the rhythm and the word fixes matter less;
flatten it and no vocabulary edit will save the piece.
It also interacts with the rest of this file: removing a word (an ornamental intensifier,
a filler phrase, a padded "-ing" tail) without restructuring the sentence it lived in
can make that sentence *more* uniform, not less — always re-check the sentence's shape
after cutting something out of it, not just its content.

Count clauses, not words. Word counts drift across languages; clause structure does
not. Use these categories:

| Category | Clauses | Rough shape |
|---|---|---|
| Fragment | 0 (no subject+predicate pair) | A punch. An afterthought. |
| Short | 1 | One plain statement. |
| Medium | 2 | Main clause plus one dependent or coordinate clause. |
| Long | 3 | Three clauses — the ceiling, not the default. |

Three checkable rules:

1. **No three consecutive sentences** in the same length category.
2. **No three consecutive sentences** with the same clause count.
3. **No sentence exceeds 3 clauses.** Split at 4+. Exception: one sentence per
   ~300 words may carry 4 clauses.

Visual paragraph weight follows the same logic — no three consecutive paragraphs
of identical weight (light: 1 sentence; medium: 2–3; heavy: 4+). Three same-weight
paragraphs in a row is itself a pre-flight signal.

Opener variety is per-language but the rotation is universal: no three
consecutive sentences starting with the same opener type. Rotate through subject,
pronoun, conjunction, verb-first, prepositional phrase, adverbial, question, and
fragment — each language file lists its own natural fillers (e.g. which
conjunctions may open a sentence: And/But/So in English) in its sentence-pattern
section. Every catalog now carries its opener row (per-language diagnostics are
collected in `references/language-rhythm.md`); where a row is marked unconfirmed,
fall back to the one rule that never misfires: never open three in a row the
same way.

Merge is the inverse operation: two adjacent fragments or short sentences sharing
one opener ("And… And…") usually want to become one medium sentence — unless the
fragments are doing deliberate work (social spacing, a punch pair, a listed
contrast, a register whose staccato is intentional). Never merge with a causal
join ("and so," "which meant") the source didn't state.

Short-form note (social, ux, fragments under ~100 words): curvature-style
detection is weak on short texts — there isn't enough sequence to curve. On
short input, rhythm rules 1–2 and phrase-density (§1–§2) carry the weight; do not
declare a short text "clean" from rhythm alone.

## 1. Content moves to avoid

1.1 **Inflating an ordinary fact into unearned significance** ("marks a turning
point," "plays a vital role," "left a lasting legacy"). State the fact, stop, and only
claim significance with a specific, attributable reason.

1.2 **Vague, uncredited attribution** ("experts say," "observers note," "industry
reports suggest," "several sources" when few are actually cited). Name the source, or
drop the claim.

1.3 **The formulaic "faces challenges, but the future looks bright" close** with no
specific support behind either half.

1.4 **Padding a plain sentence with an unsupported "-ing" tail** ("...highlighting its
importance," "...underscoring its significance") instead of either writing a full,
specific, sourced analytical sentence or cutting the tail entirely.

1.5 **Promotional, travel-brochure adjectives** (vibrant, rich, breathtaking, nestled,
world-renowned) describing a place, person, or organization where neutral, specific
description would do.

1.6 **Reflexive "Legacy / Impact / Awards and Recognition" sections** added because the
outline expects them, with no genuine sourced content to put in them.

1.7 **Disproportionate space** — giving one element (a person, an angle, a company) far
more room than its actual weight in the topic warrants.

1.8 **Compiling dense, lightly-reworded source material** instead of actually
summarizing it.

## 2. Sentence-pattern habits

Language files add the exact words; these are the shapes to watch for in any language.

2.1 **Negative parallelism** ("not just X, but Y," "it's not X, it's Y") used more than
once per piece.

2.2 **Reflexive grouping in threes** — vary the count; one, two, four, and five are all
available.

2.3 **False ranges** ("from X to Y") where X and Y aren't actually two ends of one
continuum.

2.4 **Inflated copulas** replacing a plain "is/are/has" ("serves as," "stands as a
testament to," "represents," "functions as"). Say "is" when that's what's meant.

2.5 **The same transition repeating** — using the same connective word more than once
in a piece where the language offers several options for the same relationship.

2.6 **Elegant variation** — cycling synonyms for one referent (three different names
for the same person or thing in three consecutive sentences) instead of repeating the
plain, correct name. Repetition of the correct term is a feature of clear writing, not
a defect to engineer around.

## 3. Formatting habits

Adapt every item here to the target format's own conventions. Never default to these
Markdown-chatbot habits when they don't fit the actual deliverable.

3.1 Repeating the title as a heading; a parent heading with only sub-headings and no
content of its own.

3.2 Bulleted lists where every item is "**Bold term:** restated sentence."

3.3 A dash (or the target language's equivalent mark) used as a bullet-point
substitute, or repeated more than once as a true parenthetical break within one
paragraph.

3.4 Emoji used as structural markers in headings or list items.

3.5 A small decorative table built for data that reads fine as one plain sentence.

3.6 Skipping heading levels, or overusing top-level headings.

3.7 Long, generic, template-sounding section headings that aren't specific to the
actual content underneath them.

## 4. Residue to strip before anything is final

4.1 Any sentence addressed to "the user" inside delivered content — greetings, offers,
sign-offs ("I hope this helps!", "Let me know if..."). A document is a deliverable, not
a chat turn.

4.2 Knowledge-cutoff or "based on available information" hedging used as reflexive
filler rather than a real, specific, briefly-stated caveat.

4.3 Unfilled placeholders left in the final text.

4.4 Tool-specific citation or markup artifacts — foreign citation markers, tracking
parameters left in URLs, leftover chatbot-formatting debris that doesn't belong in the
target system.

4.5 Fabricated or unverified citations; invented categories, templates, or fields that
don't actually exist in the target system.

4.6 Narrating your own research or editing process in the delivered text ("a review of
the sources shows that...") instead of just stating the finding.

## 5. Filler and hedging discipline

5.1 Strip reflexive filler: "in order to" → "to"; "due to the fact that" → "because";
"it is important to note that X shows Y" → "X shows Y."

5.2 At most one hedge word per clause (very, perhaps, tends to). Never stack several in
the same sentence.

5.3 Don't force an "on the other hand" counterbalance onto a point that genuinely
doesn't need one.

## 6. The injection check — a distinct failure mode from under-editing

An edit can remove every tell on this list and still fail, by **adding a new one that
wasn't in the original.** This has been directly measured, not just theorized: a
rewrite pass that smooths a sentence's punctuation can insert a comma habit the source
didn't have; a pass that tightens a conclusion can reach for exactly the kind of
reflexive summary-closer or causal-wrap-up phrase this file bans elsewhere, introducing
it fresh while polishing a plain original sentence that didn't need one.

Before finalizing, re-read the edit specifically for this — not "did I remove tells"
but "did my own rewriting habit add one." Check punctuation choices made while
restructuring, and check anywhere a conclusion or transition got tightened for whether
the tightened version reaches for one of §1 or §2's own banned moves. This check is
easy to skip because it runs against the instinct that finishing a pass means it's
done; it is not optional.

Clean slop — the second-order version of the same failure — is what a cleanup pass
deposits when it polishes too eagerly. Four controls:

- **Replacement-tic budget.** Any substitute phrase repeated across three texts
  becomes a marker itself ("here's what that means in practice," "the real
  question is"). The cure for a cliché is usually not another phrase but its
  absence: start with the substance. If a fix needs a connective at all, vary it;
  if it doesn't, delete rather than substitute.
- **Aphorism budget.** At most one punchy one-liner closing a paragraph per text.
  Count them. If every paragraph lands with a punch, unclench a few — uniform
  maximum punch is its own machine signature.
- **Slack.** At least one sentence per text gets to be written at half pressure:
  an underdeveloped aside, a plain flat statement, a "we'll see." A person's
  attention is uneven and the prose shows it. Slack is not a fake typo or an
  inserted "um" — those are costume.
- **Outline test.** Read the first sentence of every paragraph in order. If they
  form a clean summary of the piece, the document-level structure is
  machine-shaped: reorder, merge, or start one section somewhere unexpected.
  Exempt: specs, runbooks, and formats where an outline is the point.

Write like humans are allowed to while doing all of the above: plain "is/has"
instead of elevated substitutes, plain verbs (wrote, moved, used, tried),
superlatives when true ("the first," "the only"), hedges and intensifiers when
honest ("very," "perhaps," "tends to"). These are constructions machine prose
avoids and human prose uses freely — do not sand them off. Positive targets for
all of this live in `references/prose-benchmarks.md`; read it with the final
check, not at startup.

## Fact-lock

Repeated here because it is never optional regardless of mode or language — the full
version is in `SKILL.md`:

- Preserve every name, number, date, quote, and citation exactly as given.
- Never invent a detail "for liveliness."
- Every substantive claim is from the source, computed on a stated assumption, a
  flagged judgment, or a named gap — never quietly upgraded into a fact it isn't.

## Governing principle

No single item above is fatal in true isolation — plenty of competent human writing
contains one em dash, one "moreover," one three-item list. The failure state is
**several of these co-occurring, or one of them repeating, in the same piece.** Read
back what was produced and cut the moment two or more stack together. Do not apply this
list so mechanically that the result becomes a new, equally recognizable formula of its
own — vary the fix along with the flaw; genuine variation grounded in the actual
content is the goal, not a fresh set of tics to replace the old ones.
