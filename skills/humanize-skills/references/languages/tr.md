# Language: Turkish (tr)

Pairs with `references/core-rules.md` and `references/structural-pass.md`. Synthesized
from `similar-github-projects/by-language/tr/turkce-humanizer`, one of the most
rigorously engineered single-language humanizer skills surveyed — its two-phase model
(unconditional removal, then register-gated rhythm injection) is worth keeping as the
shape of this file, not just its content.

## The two-phase model

**Phase 1 removes AI signals. It is unconditional — applies to every register, every
text, no exceptions**, including the five absolute bans below. **Phase 2 injects
human-Turkish rhythm signals. It is conditional on register** (see the table below) —
some registers get none of it at all.

## Five absolute bans (register-independent — apply before anything else)

1. **No em dash inside a sentence, ever**, including as dialogue punctuation. Use a
   comma for an aside, or split the sentence. This is one of the single most reliable
   Turkish AI signals — more so than in English.
2. **No semicolon, anywhere**, even where formally correct by Turkish style guides
   (TDK). A semicolon is where AI is translating English's "; also / ; however" logic
   directly into Turkish. Split into two sentences instead.
3. **No sentence fragments.** Every sentence keeps a subject and predicate. Short
   sentences are fine and encouraged (see the positive goal below) — but they must be
   complete, not a clipped one- or two-word non-sentence.
4. **No isolated sentence opened by a conjunction and left standing alone** ("Ama şu
   oldu." as its own sentence). Either keep the conjunction inside the sentence it
   belongs to, or merge the two sentences.
5. **No comma before a contrast conjunction** (ama, ancak, fakat, lakin, yalnız used as
   "but"). This is Turkish's version of English's mandatory pre-"but" comma, forced
   into a language where it isn't native and where TDK itself calls it incorrect.
   "Plan hazırdı, ancak uygulamada aksadı" → "Plan hazırdı ancak uygulamada aksadı."

None of these five loosen for any register, including formal or legal Turkish — they
are wrong regardless of how correct-looking the rest of the sentence is.

## Register diagnosis (do this before anything else)

Identify which of five registers the text is in — legal/administrative,
academic/institutional, analytical/journalistic, essay/blog, or literary/creative — and
confirm with the requester if it isn't obvious from context, since Phase 2's
intervention level depends entirely on this call.

## Phase 2: human-rhythm injection, gated by register

| Register | Sentence-length variance | Colloquial connectives (ama/zaten/oysa/ne var ki) | Rhetorical questions | Self-correction ("daha doğrusu," "aslında") | Voice-profile matching |
|---|---|---|---|---|---|
| Legal / administrative | Not applied | Not applied | Not applied | Not applied | Not asked |
| Academic / institutional | Applied, restrained | Bureaucratic connectives only (bu bağlamda etc. avoided per the ban below) | Not applied | New-sentence placement preferred over inline | Not asked |
| Analytical / journalistic | Applied | Applied, replacing bureaucratic connectives | Not applied | New-sentence placement preferred | Offered — see below |
| Essay / blog | Full | Full | Applied | Either placement | Offered |
| Literary / creative | Full, plus sensory/tense-shift/dialogue traces (ask the user for these — never invent them) | Full | Applied | Either placement | Offered |

## Structure preservation

Never touch document structure while fixing sentence- and paragraph-level language:
bullet lists stay lists, heading hierarchy stays as-is, tables stay tables, block
quotes and code blocks stay as-is. This skill's job is sentence- and paragraph-internal
language, not document architecture, unless explicitly asked to restructure.

## Dominant signals (three or more together mean the text is heavily AI-flavored)

- **Punctuation inflation**: the em dash and semicolon bans above; a colon used for a
  mid-sentence mini-explanation (Turkish reserves the colon for a sentence-final
  example or before reported speech, not "X: Y" mid-sentence); slash-separated triplets
  ("kullanıcı/müşteri/istemci") where Turkish would say "A, B veya C."
- **Sentence-length monotony**: every sentence 18–25 words, no full sentence under 8
  words, standard deviation under roughly 30%.
- **Formulaic repetition**: "-mektedir/-maktadır" as the predicate ending four-plus
  times in one paragraph (natural Turkish academic writing mixes this with other
  tenses at roughly 20–25%); bureaucratic connective stacking (bu bağlamda, söz konusu,
  öte yandan, bu doğrultuda, bu çerçevede — three or more in one piece); closing
  clichés (kritik bir rol oynamaktadır, hayati bir önem taşımaktadır) more than once,
  especially at paragraph ends.
- **"Sadece X değil, aynı zamanda Y" family**: the Turkish calque of "not just X, it's
  Y" — one instance is already enough to flag, across all its variants (yalnızca X söz
  konusu değildir; Y de..., X'in ötesinde, Y boyutu göz ardı edilmemelidir).
- **Empty evaluative adjective clusters**: eşsiz, benzersiz, paha biçilmez, zengin bir
  mozaik, çok boyutlu — two or more in one paragraph.
- **The "şudur/budur" explanation formula**: "X şudur: Y" or "Kesin olan tek şey
  şudur: Y" — a direct calque of English's "The thing is: X." Rewrite as "Y olan X"
  instead of the colon-explanation structure; this is a natural move in the classical
  Turkish academic/literary register, not an invented fix.

## Secondary signals (supporting evidence only, not proof alone)

Overuse of "adeta"/"sanki" to paper over a missing concrete example; forced triads with
no real distinction between items; total absence of inverted sentence order (devrik
cümle) — natural Turkish uses it occasionally, AI Turkish essentially never does;
register drift within one paragraph (starting bureaucratic, sliding into aesthetic-
emotive vocabulary); abstract claims with no accompanying concrete anchor (a date, a
name, an example); heavy reliance on passive voice where an active construction would
be clearer; English emphasis-fillers calqued into Turkish as reflexive intensifiers
(tam da, tam anlamıyla, gerçekten de, aslında da, kesinlikle as filler, esasen,
nihayetinde, bir bakıma, gerçek anlamda, sentence-initial işte used as filler); the
same referent given three or more different names in one paragraph (metonymic uses —
Türkiye/Ankara/cumhuriyet referring to different aspects of the same country — are not
this tell; ask if unsure).

## What NOT to flag (false positives)

- A single "ama," "zaten," or "oysa" — these are the ordinary connective vocabulary of
  natural Turkish; only a total absence of them (all bureaucratic connectives instead)
  is itself worth noting, not their presence.
- A borderline-formal connective like "ne var ki" sitting between analytical and
  essay register — ask the requester which they'd prefer rather than assuming either
  is wrong.
- A single -mektedir predicate — only a cluster (four or more in one paragraph) is the
  tell.
- Author-specific quirks confirmed by a supplied writing sample — see Voice profile
  below; a profile overrides this file's defaults for connective choice specifically.

## Voice profile (session-scoped, register-gated)

Offered once per conversation, only for register-compatible text (analytical/
journalistic through literary — never for legal/administrative or academic/
institutional). If offered and accepted, extract from 2–3 samples the person's actual
sentence-length rhythm, connective preferences (ama vs. ancak; yani vs. diğer bir
ifadeyle), and concept-coining habits, and prefer those over this file's generic
choices where they conflict — this is the same median-not-peaks discipline as
`voice-calibration.md`, applied specifically to connective and rhythm choice rather
than vocabulary. The profile lives in this conversation's memory only, per
`voice-calibration.md`'s session-scoping rule, and is asked for again in a new session.

### Opener rotation and pre-flight carve-out

Conjunction openers: Ama, Fakat, Yani, Çünkü open freely; Ve-initial is
colloquial — allowed informal, flagged formal/academic. Verb-first is unnatural
in Turkish (verb-final language): a verb-first sentence is a translation tell,
never inject one for variety. Questions fine everywhere. Pre-flight carve-out:
corporate-formal openers alone WARN, never STOP (standing default in `SKILL.md`);
academic `-mektedir` moderation is a catalog rule, not a pre-flight signal.
Confidence: high — native-built source.

## Worked example

**Before (AI-typical):**
> Bu bağlamda, düşük kodlu geliştirme araçları şirketlerin maliyetlerini azaltmasında
> kritik bir rol oynamaktadır. Sadece geliştirme süresini kısaltmakla kalmaz, aynı
> zamanda iş süreçlerini de köklü biçimde dönüştürür — ki bu da verimliliği artırır;
> dolayısıyla pek çok kurum bu araçlara yönelmektedir.

**After:**
> Bazı şirketler düşük kodlu araçları onay süreçleri, raporlama ve iç araçlar için
> kullanıyor. Amaç genelde tekrarlanan geliştirme işini azaltmak.

**Changes:** removed the bureaucratic opener (bu bağlamda), the reflexive "kritik bir
rol oynamaktadır" closer, the "sadece... aynı zamanda..." negative parallelism, the
banned semicolon and mid-sentence colon-style em dash, and the reflexive "-mektedir"
ending; replaced with two direct sentences naming what the tools are actually used for.

## Sources

`similar-github-projects/by-language/tr/turkce-humanizer` — read the full skill file
directly for the complete signal list (23 signals total between dominant and
secondary), the full register-detail reference, and the literary-reference author list
(Tanpınar, Ortaylı, Karpat, and others) this file's positive sentence-strength goal is
drawn from but doesn't reproduce in full here.
