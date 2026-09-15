# ru-academic — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Non-English:
> needs a native-speaker check.

`--academic`, Russian. The crossing: `ru.md` fires hard bans that hold in every
register (em dash, negative parallelism, bureaucratic nominalization), while
`academic.md` preserves what is genuinely genre-correct (evidence-tied hedging,
formal definitions, citation keys). Resolution: strip канцелярит but keep
calibrated hedging — "представляется возможным" as padding goes, "следует
считать предварительными" over a small sample stays. Note the carve-out
boundary: a corporate «В современных условиях…» opener alone would WARN, but an
academic "В современном мире…" opener with no content behind it is still cut.

---

## Case 1 — AI Russian abstract, edit warranted

**Setup:** "Причеши аннотацию, --academic --lang=ru."

**Input:**
> В современном мире эффективность университетских процессов играет ключевую роль.
> Осуществление цифровой трансформации способствует повышению качества образования —
> это не просто улучшение, а настоящая революция. Исследования показывают, что наша
> методика доказывает свою эффективность [1, 2, 3, 4, 5].

**Expected decisions:**
- "В современном мире…" + zero content behind it — empty cosmic opener, `ru.md` +
  `academic.md` formulaic opener. Cut (this is not the corporate carve-out case:
  nothing else in the text is clean).
- "играет ключевую роль," "настоящая революция" — significance hype, `academic.md`.
- "Осуществление … способствует повышению" — канцелярит chain, `ru.md`; restore
  verbs.
- "— это не просто улучшение, а…" — em dash + negative parallelism, `ru.md` hard
  bans. Both fire regardless of register.
- "Исследования показывают" with no named study — vague authority, `ru.md`.
- "доказывает свою эффективность" — over-claiming verb, `academic.md`; empirical
  work показывает, it does not доказывает. Downgrade and scope.
- "[1, 2, 3, 4, 5]" with no discussion — citation dumping, `academic.md`; keys
  preserved verbatim, discussion gap flagged, not filled.
- No numbers, sample, metrics, or dates in the source → flag the gap; inventing
  a sample size or a delta is a fact-lock failure (`academic.md` + `SKILL.md`).
- **Do not casualize**: no irony, no particles (же/ведь), no phone-style
  imperfections — formal academic register keeps restrained hedging and clean
  typography (`ru.md` register table).
- Change magnitude: ~65% (eyeballed). No-edit gate: passed.

**Reference "after":**
> В университете внедрены элементы цифровой трансформации учебных процессов;
> методика описана автором как эффективная.
>
> *(Флаг: ни выборки, ни метрик, ни сроков в черновике нет — утверждение об
> эффективности висит без опоры; ссылки [1–5] сохранены дословно, но в тексте не
> обсуждены — это на усмотрение автора.)*

**Blind forced-choice answer key:** a judge picks the **Input** — cosmic opener,
nominalization chain, dash-plus-parallelism closer, "доказывает," hype, and an
undiscussed five-key dump are textbook AI-academic Russian. The after states
only what the draft contained, scopes the claim to the author's own wording,
and flags the missing evidence.

**A regression here looks like:** "доказывает" survives (or returns as
"подтверждает" with the same unearned strength); a sample size, metric, or date
gets invented; the dash or the parallelism stays; irony/particles slip into
formal register; or "[1–5]" get "discussed" via invented summaries.

---

## Case 2 — correct Russian academic sentence, NO EDIT

**Setup:** "Глянь, нормально звучит? --academic."

**Input:**
> Выборка ограничена одним факультетом (n=84), поэтому результаты следует считать
> предварительными (см. табл. 2).

**Expected decisions:**
- Evidence-tied hedging ("следует считать предварительными") over a genuinely
  uncertain small sample — `academic.md` + `ru.md` formal-register preserve. Do
  **not** strengthen.
- Sample scope (один факультет, n=84) — exactly what the reader needs; cutting it
  to "tighten" is a defect, `academic.md`.
- "(см. табл. 2)" — table reference, preserved verbatim, `academic.md`.
- No dash, no nominalization pile, no parallelism, no hype, no vague authority.
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> В современном мире ограниченность выборки играет ключевую роль — результаты
> нашего масштабного исследования (n=84) доказывают эффективность методики, что
> открывает новые горизонты [1].

**Blind forced-choice answer key:** a judge picks the **over-edited version** —
it added a cosmic opener, significance inflation, a dash, an over-claim
("доказывают"), hype ("новые горизонты"), called n=84 "масштабного," and
collapsed five sources' context into a bare "[1]." Every one is a `ru.md` /
`academic.md` / fact-lock violation. The input is correct academic Russian.

**A regression here looks like:** any hedge deleted or strengthened
("предварительными" → "достоверными"); the sample caveat cut; "(см. табл. 2)"
dropped; or "ограничена" edited into nominalization ("ограниченность выборки").
