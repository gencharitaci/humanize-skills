# Language: Arabic (ar) — Modern Standard Arabic (MSA/الفصحى)

Pairs with `references/core-rules.md` and `references/structural-pass.md`. Synthesized
from three repos in `similar-github-projects/by-language/ar/`: a rhetoric-first,
28-pattern MSA specialist (`humanizer-ar-1`'s `humanizer-ar-msa`, which also ships
Egyptian, Levantine/Shami, and even Hebrew dialect variants worth consulting for
dialect-specific work) and a corpus-scale engineering system with register-gated
transformations (`humanizer-ar-2`, mined from 1.31M sentences / 71.28M tokens). Tier-2,
wave 2. **Right-to-left script and layout handling still needs separate verification**
beyond the pattern content covered here — see the roadmap's risk note on this.

## The rhetorical-tradition principle (read this first)

Arabic's own rhetorical tradition — بلاغة — treats writing as performance: varied,
rhythmic, image-bearing, and register-flexible by design, not as a flat, uniformly
cautious register. AI-generated MSA is grammatically correct but rhetorically hollow:
it hedges when classical and contemporary Arabic writers assert, it lists where
Arabic's essay tradition (المقالة) argues in connected prose, and it holds a single
formal register regardless of audience or purpose. The goal of humanizing Arabic isn't
decoration — it's restoring the native instincts of assertion, rhythm variation, and
rhetorical grounding that AI output flattens.

## Register is a gating decision, not a single tell list

The four practical registers — classical, news, opinion, technical — gate which
transformations even apply, in a stricter and more explicit way than most other
languages here: stylistic variation and rhetorical figures fire in full for classical
and opinion writing, but news defaults to skipping risky stylistic moves (no saj', no
aggressive sentence-length variance), and technical text is the most conservative of
all (typography and redundancy fixes only — no structural-opener rewrites, no
sentence-length variance). Determine register before applying anything below.

## The single most decisive tell: علاوة على ذلك

Search for every instance of علاوة على ذلك ("moreover/in addition"). AI models produce
this at a rate far exceeding human writers, and it sounds subtly wrong to a native
reader — closer to a mistranslation than a mistake. Three or more instances in one text
is, on its own, close to sufficient to identify AI authorship to a trained Arabic
reader. Replace with a rotation of إضافة إلى ذلك، فضلًا عن ذلك، وثمة أيضًا، بل إن —
never repeat the same replacement more than once per text.

## Hedging and passive-voice overload

**Hedging phrase overload**: من المهم الإشارة إلى، يجب الإشارة إلى، قد يكون، ربما، من
المحتمل أنّ، تجدر الإشارة إلى — appearing more than once per 200 words, or opening a
sentence where a direct assertion would serve better. AI hedges at three to four times
the human rate in Arabic; native journalists, academics, and essayists assert and let
the argument carry the risk.

**تم/يتم passive overuse**: grammatically valid but bureaucratic — the register of
official statements and government communiqués, not analytical or argumentative prose.
More than one such construction per paragraph, or more than three per 300 words, is
the AI threshold. Convert to active voice and name the agent. The related **formal
passive family** (يُستخدم، يُعتبر، يُلاحَظ، يُشار إلى) is the same failure mode dressed
more elegantly — more than two per 200 words is the threshold there too.

## Clichéd openings and formulaic closings

**Clichéd paragraph openers**: في الآونة الأخيرة، في العصر الحديث، إن العالم اليوم، في
ظل التطورات المتسارعة — pure throat-clearing with no connection to the actual subject;
delete and begin with the first substantive claim.

**Formulaic conclusions**: في الخلاصة، وختاماً، وبهذا نكون قد، مما سبق يتبين أن —
Arabic rhetoric expects a conclusion (الخاتمة) to have real weight and closure, like the
last note of a musical phrase, not a summary that tells the reader they may stop
reading now.

## Vocabulary and structural uniformity

**Vocabulary homogeneity**: either the same word used for a concept throughout where
Arabic's root-pattern (جذر-وزن) morphology offers a richer field of precise near-
synonyms, or the opposite failure — mechanical synonym rotation with no actual
semantic distinction (أثبتت الدراسات in one paragraph, أظهرت الأبحاث in the next, with
no functional difference).

**Conjunction chains**: و-chains connecting more than three items, averaging above 3.5
conjunctions per sentence across a paragraph. Human writers group, prioritize, and
compress rather than listing everything.

**Syntactic template dominance**: more than 60% of sentences in a paragraph following
the same opening template (إن/أن + noun + verb; يُعد + noun + adjective). Arabic's
considerable word-order flexibility (VSO, SVO, fronting, topicalization) exists
precisely so native writers can vary emphasis — use it.

**Sentence- and paragraph-length uniformity**: standard deviation under 6 words across
a paragraph's sentences is a clear AI signature (human MSA text varies above 40% of
mean sentence length); likewise every paragraph running the same 3–5 sentences with no
single-sentence paragraph anywhere. A single-sentence paragraph is one of the most
powerful tools available in Arabic prose — it signals "this matters" — and AI almost
never uses it.

**List and bullet overuse**: lists are a documentation tool, not an Arabic rhetorical
prose tool. When argumentation is converted into bullets, the connective tissue
(qualification, subordination, build-up and release) disappears, and a list of claims
stops being an argument. Convert to integrated prose with real connectives outside
technical/reference material.

**Markdown formatting in running prose** (bold, headers, horizontal rules) — native
Arabic writers emphasize through word choice, sentence structure, and rhetorical
placement, not typographic decoration.

## Rhetorical absence — what's actually missing, not just what's present

- **No saj' (rhymed prose)** — the complete absence of any phonetic harmony at
  sentence or paragraph endings, where the classical-to-contemporary tradition (from
  the Quran through Al-Jahiz to today's columnists) uses it to create aural memory and
  closure. Where tone permits, especially at section and text endings, choose word
  forms whose endings create light phonetic pattern.
- **No metaphor or figurative language** in a text over 300 words — Arabic's
  figurative tradition is unusually strong precisely because the language is built on
  semantic extension from physical roots; flat, imageless prose about an abstract topic
  reads as experientially empty even when technically accurate.
- **No rhetorical questions** in a text over 400 words — الاستفهام البلاغي creates
  urgency and reader involvement; its total absence reads as monological and detached.
- **Generic, culturally deracinated references** — text with no Arab historical,
  literary, or regional touchstone could describe any society in translation. A human
  writer writes from somewhere: an Egyptian columnist references the Azhar or the
  khedivial tradition; a Levantine writer references the nahda (النهضة); a Gulf writer
  references oil-economy transition speed. Ground the text in the actual audience's
  shared reference points.

## Diacritics and dialogue register

**Diacritic consistency**: modern MSA prose (journalism, web content, most books) is
written without diacritics; formal religious, classical, or legal text diacritizes
fully. Inconsistent diacritization — some words marked, most not, with no principled
pattern — reads as reactive (added only where the model was uncertain) rather than a
deliberate stylistic choice. Pick one standard for the genre and hold it throughout.

**Dialogue in formal MSA**: no Arab speaks in formal MSA. Dialogue or quoted speech
written in full MSA rather than an appropriate reduced or dialectal register is
immediately artificial — equivalent to writing English dialogue in formal legal
register. Adjust quoted speech to the appropriate register for who's speaking.

## What NOT to flag

A hedge used to mark genuine, material uncertainty; a تم-passive where the agent is
truly unknown or irrelevant; the definite article ال where specificity is
semantically required; a single triad or a single dash-adjacent construction; formal
register in a genuinely formal genre (legal, religious, academic reference).

### Opener rotation and pre-flight carve-out

Conjunction openers: لكن, بل, ثم, كما أن — plus the language's word-order
flexibility (VSO, SVO, fronting, topicalization) as the deeper rotation than any
fixed opener list.
Single-sentence paragraphs allowed outside technical register. Pre-flight
carve-out: none beyond the catalog's own register gating (which already decides
what fires where); script/layout handling still unverified — pattern rows only.

## Register table

| Register | Rhetorical figures & saj' | Sentence-length variance | Structural-opener rewrites | Tashkeel |
|---|---|---|---|---|
| Classical | Full | Full | Full | Preserve fully |
| Opinion | Full, including quote-verb rotation | Full | Full | Strip in modern contexts |
| News (default, safest) | Skip saj'/quote-verb rotation | Skip aggressive variance | Full | Strip |
| Technical | None | None | None — typography and redundancy fixes only | Strip |

## Worked example

**Before:**
> من المهم الإشارة إلى أن الاقتصاد الرقمي يُغير طبيعة العمل في المنطقة. علاوة على ذلك،
> يُعد الاستثمار في هذا المجال ركيزة أساسية للتنمية. تم إجراء دراسات عديدة حول هذا
> الموضوع.

**After:**
> الاقتصاد الرقمي يُعيد رسم خريطة العمل في المنطقة، وهذا لم يعد موضع جدل. فضلًا عن ذلك،
> الاستثمار فيه ليس رفاهية — إنه شرط للتنمية. أجرى باحثون عدة دراسات ميدانية حول هذا
> الأثر.

**Changes:** the reflexive hedge ("من المهم الإشارة إلى أن") was removed for a direct
assertion; the critical علاوة على ذلك tell was replaced with فضلًا عن ذلك; the تم-passive
was converted to active voice with a named agent (باحثون); a short, direct sentence
("إنه شرط للتنمية") was introduced to break sentence-length uniformity.

## Sources

`similar-github-projects/by-language/ar/humanizer-ar-1/skills/humanizer-ar-msa` — the
28-pattern MSA rhetoric-first catalog this file draws on most heavily, with sibling
dialect-specific skills (`humanizer-ar-egt` for Egyptian, `humanizer-ar-shami` for
Levantine, and a Hebrew variant) worth reading directly for dialect-specific work;
`humanizer-ar-2` — a 16-dimension, register-gated engineering system built on a
100,000-record, 1.31M-sentence corpus mining pass, this file's source for the register-
gating table and the explicit humanizer-vs-localizer scope discipline (BCP47/ICU/SSML
localization concerns are explicitly out of scope for a humanizer). A third repo,
`humanizer-ar-3`, exists in the same folder for further cross-checking.
