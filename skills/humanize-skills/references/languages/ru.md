# Language: Russian (ru)

Pairs with `references/core-rules.md` and `references/structural-pass.md`. Synthesized
from `similar-github-projects/by-language/ru/humanizer-ru`, the deepest single-language
catalog in the entire research survey: 64 patterns across 14 categories (A–N), several
tied to specific published detector research (DivEye, KatFish, StoryScope) rather than
intuition alone.

## The discourse layer is already covered — don't duplicate it

Category N of the source catalog (patterns 59–64) is the StoryScope discourse-level
findings — explicit final morals, portrait-style character introduction, emotion
conveyed only through the body, seamless causal chains, strictly linear chronology, no
reader address — applied to Russian. **This is the same research
`references/structural-pass.md` is built on.** Apply the structural pass as written
there; don't re-derive a Russian-specific version of it here. What follows is
categories A–M: the surface-level, Russian-specific catalog that structural-pass.md
does not cover.

## Hard bans (apply regardless of register, cluster or not)

- **The em dash** ("—"). Detectors count its frequency directly as one of their
  strongest statistical signals, and casual living Russian typed from a phone almost
  never uses it — people use a plain hyphen. Replace every long dash with a comma,
  colon, period, hyphen, or a restructured sentence. Only exception: the user has
  explicitly said they're a professional editor, need correct typography, or the text
  is genuinely formal-publishing register — and even then, that exception is theirs to
  invoke, not this skill's to assume.
- **Negative parallelism**: "не просто инструмент, а партнёр" / "не только ускоряет, но
  и трансформирует" — present in the overwhelming majority of GPT-generated Russian
  text sampled. State the thing directly.

## Content and language patterns

**Empty openings**: "В современном мире...," "В эпоху цифровых технологий...," "Не
секрет, что..." — delete the entire opening paragraph; the real text usually starts at
the second one. Or open with a fact, a story, or a question instead.

**Vague authorities**: "по мнению экспертов," "исследования показывают" with no name
attached. Name the actual expert or study, or drop the attribution and state the claim
in the writer's own voice — "я считаю" is more honest than "многие считают."

**Bureaucratic nominalization (канцелярит)** — the single most important marker in the
whole catalog. AI turns verbs into deverbal nouns: "осуществление," "реализация,"
"внедрение," "в целях реализации проекта." Restore the verb: "реализация проекта
завершена" simply means "проект завершён." A verb is almost always better than the
noun it was made from.

**English calques**: "Стоит отметить, что..." (it's worth noting that), "является" used
in every other sentence (is) where Russian would omit the copula or restructure
entirely, punctuation calques (a comma after "Однако" at a sentence's start, where
Russian doesn't obligatorily set it off the way English does after "However,").

**Excessive explicit subjects**: Russian is pro-drop; AI inserts the subject in every
clause because English requires one. "Он встал и он пошёл к двери" reads better as
"Встал, пошёл к двери."

**Participle-clause piling**: multi-story participial constructions stacked in one
sentence ("Анализируя данные, учитывая результаты, рассматривая возможности, мы пришли
к выводу..."). Break into short sentences; keep at most one participial phrase per
sentence.

**Syntactic uniformity**: sentences clustering at one length (15–20 words) with
uniform subject-verb-object order, avoiding inversion and conversational
constructions. Vary deliberately: short. Then long, with commas, with asides in
parentheses. A question? That works too. Use inversion ("Хорошо это или плохо, не
знаю.").

**Rule of three**: "важный, значительный и ключевой" — if three items are really
synonyms, keep one. Sometimes two is enough; sometimes four is needed.

## Style and punctuation

**Bold overuse**: every key term bolded. Keep it to one or two spots in the whole
piece, or none.

**Sentence-case after a colon**, not capitalized ("Решение: следующий шаг," not
"Решение: Следующий шаг") — English capitalization habits carried over incorrectly.

**No Title Case in headings** — same principle, headings capitalize only the first
word and proper nouns.

**Mechanical numbered lists** where the ideas are actually connected — rewrite as
running prose; lists are for instructions, not reasoning. Watch specifically for the
"colon-doubler" list format: "Слово: Развёрнутое повторение слова" (e.g. "Эффективность:
Повышает эффективность работы") — the text after the colon just restates the label.

**Impoverished punctuation**: only periods and commas, no ellipses (for a pause), no
parentheses (for an aside), no rhetorical questions. Add variety deliberately.

**Quotation marks are register-dependent**: «ёлочки» for articles, documents, and
formal text; straight "quotes" for social posts, messaging, and casual writing —
typographically correct «ёлочки» in an informal text reads as a robot with perfect
typography, not a person typing from a phone.

## Communication residue

**Chatbot artifacts**: "Конечно! Давайте разберёмся...," "Отличный вопрос!," "Рад
помочь!" — delete entirely; an article's author is not "happy to help."

**Sycophancy**: agreeing with everything. A writer is allowed to disagree, doubt, or
argue.

**Formulaic transitions**: "Давайте рассмотрим подробнее...," "Перейдём к следующему
аспекту..." — cut (the reader can see the new paragraph) or make it carry actual
content (a question, a contrast, a link to the previous idea).

**Padded hedging**: "В определённом смысле...," "Можно предположить, что возможно..." —
say what you're actually unsure about, specifically, or commit to the claim.

**Verbosity**: AI-generated Russian text is typically compressible 40–60% with no loss
of meaning — one idea smeared across 3–5 sentences, a thesis repeated in different
words. Test: if cutting the text in half loses nothing, the original was padded.

## Morphological tells

Case-agreement errors (nominative where genitive belongs), gender-agreement slips
("Компания заявил"), aspect confusion (mixing perfective/imperfective incorrectly),
participial clauses attached to the wrong subject, and reflexive overuse of "данный,"
"определённый," "соответствующий" as filler ("определённые аспекты" means, in practice,
"I don't know which ones specifically"). RuBERT-style detectors specifically target
long agreement chains — an AI-typical morphological error is a stronger signal than an
ordinary human typo (a missing comma, a "-тся/-ться" mix-up).

## Tone and register-specific human markers

Living Russian carries particles AI omits or misplaces: же, ведь, вот, -то, ли, ну —
one or two per paragraph in informal text is a marker of life, not noise. Emotional
flatness is a distinct family of tells: AI keeps a level emotional tone throughout
(no genuine frustration, no real doubt, no shift from delight to irritation to relief
within one piece) and largely avoids irony, metaphor, and idiom — a text over 300 words
with not one idiom or figurative comparison is itself suspicious in Russian
specifically, a culture whose writing runs on irony more than most.

For informal registers only (posts, chats, social) — leave 1–2 minor natural
imperfections (a missing comma, an informal "-тся/-ться" slip) rather than
hyper-correcting to sterile typography; a phone-typed message with a hyphen instead of
a dash and a bracket pressed against a word is not an error, it's a hand.

## Information-rhythm tells (newer detector research, DivEye-class)

Newer-generation detectors don't look at individual words; they look at how evenly
"surprise" is distributed across the text. AI aims for uniform information density —
every sentence carrying roughly the same informational weight. A human writes in
bursts: dense → light → dense. Build a real "cardiogram": a fact-dense paragraph, a
light connective aside, a short question, a dense paragraph again. If every sentence in
a passage is equally "informative," it reads as synthetic regardless of vocabulary.
The same applies at the block level in numbered lists: if every item shares the same
skeleton (title, two-line explanation, example), that macro-level uniformity is itself
one of the hardest tells to spot and one of the most reliable — read only the first
line of every list item in a row; if they sound templated, break the template.

## What NOT to flag (false positives)

- A single em dash, single "однако," or single formal word alone.
- Perfect grammar and typographically correct «ёлочки» quotes in a *formal* document —
  correct there, not a tell; only suspicious in casual registers stacked with other
  markers.
- A rule-of-three that's genuinely the right count for the content.

### Opener rotation and pre-flight carve-out

Conjunction openers: А, И, Но, Или, Зато, Однако. Verb-first is natural
(inversion welcome); questions and fragments welcome in informal registers;
particles (же, ведь, ну) season informal openers. Pre-flight carve-out:
corporate «В современных условиях…» opener alone WARNS, never STOPS (standing
default in `SKILL.md`) — an academic "В современном мире…" with nothing behind
it is still cut (see `ru-academic.md` Case 1 for the boundary).

## Register table

| Register | Dash tolerance | Quote style | Minor imperfections | Emotional range |
|---|---|---|---|---|
| Formal / academic / editorial | Hyphen only, dash by explicit request | «ёлочки» | None | Restrained but not flat — real hedging preserved |
| Business / professional | Hyphen only | «ёлочки» | None | Direct, low emotional register |
| Social / chat / casual | Hyphen only | Straight quotes, phone-typed style | 1–2 per piece, deliberate | Full range — irony, frustration, doubt all welcome |
| Blog / personal essay | Hyphen only | Either, match a supplied sample | Author's own rate | Full range — see modes/creative.md |

## Worked example

**Before:**
> В современном мире эффективность бизнес-процессов играет ключевую роль. Осуществление
> процесса оптимизации способствует повышению эффективности деятельности организации —
> это не просто улучшение, это трансформация.

**After:**
> Навели порядок в процессах — стало быстрее работать. Не рывок, но заметно.

**Changes:** the empty cosmic opening was cut entirely; the bureaucratic nominalization
chain ("осуществление процесса оптимизации способствует повышению эффективности") was
restored to plain verbs; the negative-parallelism closer was replaced with a direct,
slightly understated statement — one dash kept, since a single instance is not itself
a violation of the hard ban on clustering, though even here plainer punctuation was
preferred.

## Sources

`similar-github-projects/by-language/ru/humanizer-ru-1/skills/humanizer-ru/references/
catalog.md` — the full 64-pattern, 14-category catalog with a fast-scan marker word
list for audit mode, and its own deterministic scanner
(`similar-github-projects/by-language/ru/humanizer-ru-1/scripts/`) for anyone building
the eventual Phase 5 golden-fixture check for Russian. Two sibling repos
(`humanizer-ru-2`, `humanizer-ru-3`) exist in the same folder with independent takes
worth cross-checking.
