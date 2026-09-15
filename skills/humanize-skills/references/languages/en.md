# Language: English (en)

Pairs with `references/core-rules.md` and `references/structural-pass.md`. This file
holds what's specific to English: exact words, exact constructions, and how much
intensity a given register should get. The reference implementation for the language
template — see `_template.md` for what a new language file needs to cover.

## Banned vocabulary

No more than one of these per piece; prefer plain, specific words: delve, tapestry,
testament, underscore(s), pivotal, vibrant, boasts, crucial, enduring, garner,
intricate, interplay, meticulous(ly), align with, enhance, fostering, highlighting,
showcasing, emphasizing, causal, empirical, correlate (used decoratively), robust,
seamless, leverage, utilize, streamline, optimize, cutting-edge, innovative (unproven),
landscape (figurative), nuanced, groundbreaking, renowned, breathtaking,
nestled, in the heart of, diverse array, commitment to excellence.

## Copula avoidance

Replacing a plain "is/are/has" with "serves as," "stands as a testament to,"
"represents," "operates as," "functions as," "boasts a," "features," "offers." Say "is"
when that's what's meant.

## Vague relationship phrases

"Was associated with," "was connected to" where the direct, stronger fact is knowable:
"was CEO of," "worked at," "reduced X by Y%."

## Connectives

Moreover, furthermore, additionally, on the other hand, that said — each is fine used
once. Repeating the same one more than once in a piece is the tell, not the word
itself.

## Em dash

Used more than once as a true parenthetical break within one piece, or as a bullet-
point substitute, reads as AI-typical in English specifically — this varies by
language; don't assume the same threshold applies once other language files exist.
Recast with commas, a colon, parentheses, or a full stop.

## Quotation marks

Curly (“…”) versus straight ("…") — match whatever the target format or style guide
uses, and don't let one piece mix both.

### Opener rotation and pre-flight carve-out

Conjunction openers: And, But, So, Or, Nor, Yet — all free. Verb-first imperatives
in informal registers; questions and fragments free everywhere. Pre-flight
carve-out: none file-specific — the short-text skip in `SKILL.md` is the main
false-positive guard here (terse human prose scores low but cleanly). Confidence:
high — this file is the reference implementation.

### Merge gloss (English)

In English, the core-rules §0 merge rule ("two adjacent fragments or short sentences sharing one opener") usually means two sentences each under ~12 words — e.g. "And the system works. And it scales." → "And the system works and it scales." — unless the fragments are doing deliberate work (a punch pair, a listed contrast, a register whose staccato is intentional). Never merge with a causal join ("and so," "which meant") the source didn't state.

## Register table

| Register | Hedging tolerance | Passive-voice tolerance | Dash tolerance | Contractions |
|---|---|---|---|---|
| Formal / legal / technical | Keep calibrated hedges (see `modes/academic.md`, `modes/legal.md`) | High where the actor is irrelevant | Very low | Rare |
| Business / professional | Low — state what happened directly | Moderate | Low | Occasional |
| Blog / essay / creative | Personality allowed — see `modes/creative.md` | Low, prefer active voice | Author's own rate (see `voice-calibration.md`) | Normal |
| Social / marketing | Minimal hedging, direct address | Very low | Low | Normal |

## What NOT to flag (false positives)

- Clean grammar and a consistent style alone — plenty of writers are professionals or
  edited; polish isn't evidence of AI authorship.
- Mixed casual and formal register in one piece — can reflect a writer's field, age, or
  personal habit.
- A single "however," "moreover," or "additionally" — only a repeated cluster is a
  tell.
- Formal or academic vocabulary used correctly and specifically — the banned list
  above targets a short set of reflexive words, not elevated diction generally.
- A lone curly quote, or a lone em dash — both are common editor and platform defaults;
  only count them once stacked with other tells.
- A single short, forceful sentence for emphasis — only a run of several in a row is
  the dramatic-fragment tell.
- Unsourced claims by themselves — most web writing has no citations; that alone
  proves nothing.
- A letter-style opening or sign-off — salutations predate chatbots by centuries.

## Human-writing signals to preserve, not "fix"

- Specific, hard-to-invent details (a real address, an odd direct quote, a detail only
  someone who was there would know).
- Genuinely unresolved mixed feelings, stated as such, rather than a tidy resolved
  verdict.
- Dated, subculture-specific slang or references tied to a real year — models lag
  behind these by a year or more.
- A writer explicitly able to justify a specific word choice or cut they made.
- Concrete named actors and actions, rather than an abstraction ("the data," "the
  market," "the culture") doing the acting a person actually did.
- Uneven sentence length, real asides, and mid-sentence self-correction.
- Anything written before ChatGPT's public release (late November 2022) — treat as
  human by default, with rare exceptions.

## Worked example

**Before (AI-typical):**
> The new software update serves as a testament to the company's commitment to
> innovation. Moreover, it provides a seamless, intuitive, and powerful user
> experience — ensuring that users can accomplish their goals efficiently. It's not
> just an update, it's a revolution in how we think about productivity. Industry
> experts believe this will have a lasting impact on the entire sector, highlighting
> the company's pivotal role in the evolving technological landscape.

**After:**
> This is a software update. It changes [the specific features; the draft names none].
> *(Flagged: the draft is pure significance-assertion, "testament to," "revolution,"
> "pivotal role," with not one concrete feature, number, or named source in it. The
> actual changes have to come from the release notes; nothing was invented here to
> fill the gap.)*

**Changes:** removed the inflated copula ("serves as a testament to"), the AI
vocabulary ("seamless," "pivotal," "evolving landscape"), the reflexive "-ing" tail
("ensuring that..."), the negative parallelism ("it's not just... it's..."), and the
vague attribution ("industry experts believe"). The draft contains no substance to
rewrite *toward*, so the correct output is the inflation stripped plus an explicit gap
flag — not a plausible reconstruction (the fact-lock forbids inventing an example).

## Status

Full-depth catalog: banned vocabulary, sentence-pattern specifics, formatting habits,
a register table, a false-positive list, a human-signal preserve list, and a worked
example — the target depth every other language file should reach in Phase 2/3 of the
roadmap. One worked example per register (rather than the single general-register one
above) is the next increment for this file, using the blind forced-choice check from
the roadmap's Phase 5 note rather than an eyeball diff.
