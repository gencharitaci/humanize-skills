# Language template — copy this file to `{code}.md` and fill it in

Do not translate `en.md`'s word list into the new language. Translated-from-English
tells are exactly the mistake several native-built humanizer skills in
`similar-github-projects/` were built specifically to correct (Turkish's punctuation
rules, Chinese's paragraph-opening conventions, and others) — every entry below should
come from real observation of how AI-generated text in this specific language actually
reads wrong, not from carrying an English list across.

Before writing a single rule, check `similar-github-projects/by-language/{code}/` for
existing reference repos in this language (the research log at
`similar-github-projects/meta-research/_research/language-coverage.md` lists what's
already cloned per language, and `similar-github-projects/multilingual/` covers
languages that only show up inside a multi-language project) — start from what a
native speaker already documented, verify it, and cite it, rather than re-deriving
from scratch. Languages with no folder under `by-language/` yet had nothing found in
that research pass — see the coverage log for which ones (Dutch and Thai, as of the
last sweep) and treat those as a genuine from-scratch build, not an oversight to
search harder for.

## Sections every language file needs

### Banned vocabulary
The specific words this language's AI-generated text overuses. Not a translation of
`en.md`'s list — a from-scratch list for this language, sourced from real examples.

### Sentence-pattern habits
This language's versions of the shapes in `core-rules.md` §2 (negative parallelism,
false ranges, inflated copulas, elegant variation) — the *shape* is often universal,
but the exact construction that trips the "this reads as AI" signal is language-
specific. Include any construction unique to this language with no English equivalent
(for example, a specific verb-ending pattern, a punctuation convention borrowed
incorrectly from English syntax, or a register-marking particle used or dropped
incorrectly).

End this section with the two rows this engine depends on: the language's
**opener-rotation fillers** (which words fill the 8 universal opener slots —
subject, pronoun, conjunction, verb-first, prepositional, adverbial, question,
fragment — e.g. which conjunctions may open a sentence and which never do) and
its **pre-flight carve-out** (which global pre-flight signals in `SKILL.md`
misfire in this language and must WARN instead of STOP).

### Formatting and punctuation
Anything this language's readers reliably read as an AI tell in formatting or
punctuation specifically — not assumed to match English's em-dash/curly-quote/emoji
list. Confirm each one against native usage before including it; a mark that's an AI
tell in English is not automatically one here.

### Register table
Following `en.md`'s format: which of this file's rules loosen or tighten by register
(formal/legal, business, blog/essay, social), and by how much. This is the piece a
short calibration paragraph (see `_legacy-calibration.md`) never had room for, and it's
often where a translated-from-English rule set fails hardest — a passive construction
or a level of hedging that's a tell in one register can be completely standard in
another.

### Worked examples
At minimum one before/after pair per register in the table above, in this language,
not translated from an English example.

## Verification before shipping

- **Native or near-native review is required**, not optional, before a new language
  file is considered complete — see the roadmap's risk note on this.
- Run the file's own worked examples through a blind forced-choice check (does an
  independent reader identify which of two versions was machine-edited?) rather than
  relying on how convincing the rules look on the page.
- Cross-check against any existing reference repo for the language cloned into
  `similar-github-projects/` — where this file's proposed rule disagrees with what a
  native-built skill already documents, investigate the disagreement before shipping
  either version.
