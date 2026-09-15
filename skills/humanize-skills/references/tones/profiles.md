# Tone Profiles — Relational Coloring

Mode fixes what kind of document this is (legal, medical, resume). The language
file gates which surface tells apply at what formality level. Tone sets the
third axis: the emotional/relational coloring — a patient-facing medical
explanation and a support reply can each be formal or warm independent of their
document type.

Tone is set ONCE per request and never re-detected mid-pass. Where a tone
request conflicts with a mode's hard constraints, **the mode cap wins** and the
output says so plainly (a `--legal` document requesting warmth stays formal;
`legal.md` already declares this ceiling for register generally).

## Selection

1. Explicit `--tone=xx` always wins.
2. Otherwise inferred from context (contract → `expert`, ad caption → `social`).
3. Default: `human` — except `--legal` and `--medical`, which default to
   `expert` unless the requester says otherwise.

## The seven profiles

| ID | Voice | Best for |
|---|---|---|
| `expert` | The Practitioner | Technical docs, deep analysis, legal/medical default |
| `biz` | The Consultant | B2B proposals, service pages, formal business |
| `human` | The Smart Friend | Blog posts, emails, about pages — the default |
| `social` | The Scroller | LinkedIn, X, short-form, captions |
| `landing` | The Seller | Product and sales pages, CTAs |
| `article` | The Explainer | Long-form guides, tutorials |
| `case` | The Case Study | Portfolio pieces, success stories, lessons learned |

## Rhythm targets per tone

Fragments and conjunction-openers are spaced, not sprinkled — a target per tone
so "voice" doesn't collapse into tic:

| Tone | Fragment spacing | Conjunction-opener spacing | Short sentences |
|---|---|---|---|
| expert | every 5–7 sent. | every 5–7 sent. | ~20% |
| biz | rare (1–2 per text) | rare (1–2 per text) | ~20% |
| human | every 3–5 sent. | every 3–5 sent. | ~25% |
| social | every 2–3 sent. | every 2–4 sent. | ~35% |
| landing | every 3–4 sent. | every 5–7 sent. | ~30% |
| article | every 4–6 sent. | every 4–6 sent. | ~20% |
| case | every 4–5 sent. | every 4–6 sent. | ~20% |

Never exceed 2 consecutive fragments or conjunction-openers in any tone —
`social` included. The ceiling is structural, not tonal.

## Per-tone rules

- **expert:** Problem first, mechanism named, numbers with units. Contractions
  only where the language uses them naturally in professional prose. No
  enthusiasm adjectives, no rhetorical questions, no punchlines.
- **biz:** Limited contractions. Direct statements of what is offered and what
  it costs or returns. Banned everywhere in this tone: "journey," "passionate
  about," "partner with us," mission-statement diction.
- **human:** Full natural contraction range, conjunction starters, fragments at
  spacing. Opinions allowed where the mode permits (general, creative, social —
  never academic, medical, legal). One aside per piece maximum.
- **social:** 3–12 word sentences dominate with one longer explanatory sentence
  per paragraph. Fragments encouraged at spacing. Hook in the first line; close
  on an observation, never a summary.
- **landing:** Headline under 12 words. Cut 40–60% of the draft's filler before
  styling anything. CTAs in imperative or infinitive — pick one per text, never
  mix. Trust through specifics (numbers, named features), never superlatives
  the draft can't cash.
- **article:** Open on the problem, not context. Section breaks may be
  questions. "Firstly/secondly" chains are a tell — vary the scaffolding.
- **case:** Context → problem → failed attempt → working attempt → numbers →
  lessons. The failed attempt stays in: handled failure builds more trust than
  a perfect narrative. Never a "flawless implementation."

## Cultural calibration

Before applying any profile, read this language's row in
`cultural-matrix.md` (same folder): trust mechanics, address and formality
systems, humor tolerance, and taboos. Markers below the universal rules —
which filler words, which address pronouns, which irony — live per language,
because address forms and honorific systems differ too much to stay universal.
A tone profile without its matrix row is an accent, not a voice.
