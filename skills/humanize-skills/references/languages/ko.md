# Language: Korean (ko)

Pairs with `references/core-rules.md` and `references/structural-pass.md`. Synthesized
from `similar-github-projects/by-language/ko/im-not-ai`, the single most empirically
rigorous resource in the entire research corpus: 70 patterns across 10 categories,
each backed by measured human-vs-AI corpus frequencies (not intuition), with several
patterns explicitly *downgraded or reversed* once measurement contradicted the
starting assumption. Treat any Korean-specific claim below the way that source does —
as a frequency-budget judgment call, not a flat ban — and read the source directly
before writing production rules from this summary.

## The reversal lesson (read this first)

Two of this language's most-cited "AI tells" turned out, on measurement, to be things
**human Korean writers use more than AI does**: "~를 통해" (via/through) was originally
banned as translation-ese, then downgraded once a corpus check found non-translated
Korean uses it more than twice as often as translated text; "~에 대해" (about/
regarding) and "~을 위해" (in order to) show the same reversal. The lesson generalizes
beyond Korean: a pattern *looking* like a calque of English is not evidence it
actually reads as AI-generated in the target language — verify before banning, the way
this file's source did, rather than trusting the intuition that produced `en.md`'s
list and assuming it transfers.

## The injection failure mode (a distinct risk, not just over-editing)

Measured directly in this source: the humanizing pass itself can **introduce new
tells that weren't in the original** — a comma injected after a connective ending
where English editing habit expects one (2 of 28 tested documents went from 2 to 3,
and 4 to 7, after "humanizing"), or a causal-summary formula ("~하는 이유다") the model
adds while polishing a conclusion it didn't have before. This is a sharper, measured
version of `core-rules.md`'s governing principle: after any edit, check not just
"did I remove tells" but "did my edit's own phrasing habits add a tell that wasn't
there before." Apply this check for every language, not only Korean — it's just that
Korean is the one place in the survey where it was actually measured.

## Register is bidirectional — never upgrade formality

If the input is formal (합쇼체 endings, "-했-"), keep it formal. If the input is casual
or conversational (해요체, sentence-final "-인데요/-거든요/-한 겁니다"), **keep it casual** —
do not "clean it up" into a more formal register. A one-directional rule that only
guards against making things too casual will miss the opposite failure — text that was
already appropriately casual coming out stiffer than it went in. Both directions are
defects.

## Genre gate

Identify genre before applying intensity — column/essay, report, blog, and official/
institutional writing don't take the same amount of restructuring, and this
skill's job is sentence- and paragraph-level language, not renaming the genre itself
(a column doesn't become an essay; an essay doesn't become literary prose).

## Content anchors — preserve the argument's own vocabulary

Before editing, note the core nouns and concepts that carry the piece's actual claims.
Particles and sentence endings can change freely; the underlying content words that
carry the argument should survive at least once in their original form, even after
paraphrasing or merging sentences — don't let synonym substitution or sentence-merging
quietly erase the term the argument actually rests on.

## Translation-ese (번역투) — the deepest category, verify before applying

The densest category in the source (19 sub-patterns), covering English/Japanese
syntax forced into Korean word order and particle systems. The most reliably useful,
frequency-verified members:

- **Double passive** "~되어진다/~지게 된다" — collapse to a single passive or active
  voice: "판단되어진다" → "판단된다."
- **By-passive calque** "~에 의해" — restore the actual agent as the subject: "AI에
  의해 생성된 이미지" → "AI가 만든 이미지."
- **English pronoun-for-pronoun translation** (그/그녀/그것/그들 mapped 1:1 from he/she/
  it/they) — Korean achieves cohesion through zero-pronoun omission, noun-phrase
  repetition, or kinship/status terms of address instead. This is one of the strongest
  verified signals (2–3x pronoun density versus non-translated Korean) but **applies
  specifically to translated or summarized-from-English text** — in prose originally
  written in Korean, measurement found the opposite (humans use more of these pronouns
  than AI does). Don't apply this rule outside a translation/summarization context.
- **Left-branching relative-clause pileup** — English's right-branching relative
  clauses, translated literally, stack three or more modifying phrases before the head
  noun, overloading a reader's working memory before the point arrives. Split the
  sentence or convert to a postposed appositive clause instead of nesting further.
- **Double-particle chains** ("-에서의," "-에로의," "-으로의," "-에의," "-으로부터의") —
  a Japanese-particle-plus-English-preposition hybrid with no natural Korean
  equivalent; unpack into a clause instead. (Plain "-의" alone is not part of this —
  scholarly opinion is split on whether it's even a calque at all, and this file
  doesn't take a side; only the doubled forms are the target.)
- **Light-verb calques** ("가지고 있다" for "have/possess") — convert to a predicate
  adjective or double-subject construction: "강한 경쟁력을 가지고 있다" → "경쟁력이 강하다."

## Structural and formatting patterns (S1 — apply without exception)

- **Emoji as structural decoration** in headings, list heads, or emphasis — remove
  entirely outside social-media or product-copy contexts.
- **Antithesis pileup** — "A인가, B인가" or "A가 아니라 B" parallel constructions
  repeated two or more times in one piece. This is the single strongest measured
  signal in the entire taxonomy (roughly 9x denser in AI text than human text, and the
  gap holds across three different model families) — but it is also a real stylistic
  habit some individual human writers lean on heavily. The fix is never to eliminate
  every instance: keep one, and rewrite the rest as asymmetric direct statements.
  Wiping the pattern out entirely is itself flagged as a failure mode by the source's
  own verification gate.
- **Comma immediately after a connective ending** (-고/-며/-지만/-면서/-아서·어서 followed
  by a comma) — Korean's connective endings already carry the pause; the added comma
  is an English comma-after-conjunction habit grafted on. Remove it. This is also
  where the injection failure mode above was specifically measured — check that your
  own edit didn't add one of these while restructuring a sentence.

## Signature phrases (D-category — remove on sight, never insert)

These read as distinctly AI-generated and have no strong basis in ordinary Korean
usage: reflexive summary openers ("결론적으로," "요약하면," "종합하면"); overstated-
significance closers ("시사하는 바가 크다," "주목할 만하다," "간과할 수 없다"); hype
adjectives ("혁신적인," "획기적인," "압도적인," "폭발적인"); personified abstract
subjects performing human actions ("기술이 묻는다," "시대가 부른다" — restore the actual
human or institutional actor as subject); formulaic closings ("~해야 할 때입니다," "~로
나아갈 시점입니다"); the transformation-slogan formula ("'A에서 B로'," "'A를 넘어 B로'");
the cleft-sentence formula borrowed from English "what matters is..." ("필요한 것은/
중요한 것은/문제는/핵심은 ~이다" — collapse to a direct subject-predicate statement);
and inverted causal closers ("~하는 이유다," "결국 ~로 이어진다," "~에 직결된다").

**Critical: this category is for removal, never for insertion.** Never introduce one
of these stock phrases into a rewrite that didn't already contain a version of it —
doing so while "improving" a plain, live phrase in the original is a regression, not a
fix, and several of these (the inverted causal closers especially) have been directly
measured being injected by editing passes that were only trying to polish a
conclusion.

## What NOT to flag (false positives and individual variation)

- "~에 대해," "~를 통해," "~을 위해" used once or twice — measured to be **more common
  in native Korean than in AI or translated text**. Only flag dense clustering (three
  or more of the same construction in one paragraph), never a lone instance.
- A parallel enumeration ("첫째... 둘째... 셋째...") — a legitimate native rhetorical
  device; only flag four or more items in one paragraph landing with metronomic
  regularity.
- A single antithesis pair — some individual writers genuinely favor this construction
  as a personal stylistic signature (measured in roughly 1 in 60 clean human
  documents, with one columnist using it 26 times in a single piece). The tell is
  uniform clustering across adjacent sentences, not the construction's mere presence.
- Hedged modal phrasing ("~할 수 있다") — preserve by default; a writer's chosen claim
  strength is meaningful and changing possibility into certainty is a factual
  overclaim, not a style fix. Only vary the wording when the identical form repeats
  four or more times and is genuinely flattening the rhythm — and even then, swap in
  another hedge, never a flat assertion.

### Opener rotation and pre-flight carve-out

Conjunction openers: 그리고, 하지만, 그래서, 그런데. English-style subject
당신 in prose reads translated — restructure or drop, never "vary into" it.
해요체 is the safe default register for general writing. Pre-flight carve-out:
none confirmed beyond the standing defaults — universal pre-flight applies;
native review may add one.

## Register table

| Register | Formality direction | Fact/detail addition | Hedge (~할 수 있다) handling | Antithesis tolerance |
|---|---|---|---|---|
| Official / institutional (공적) | Preserve exactly as given | None | Preserve fully | Very low |
| Report (리포트) | Preserve exactly as given | None | Preserve, vary only if 4+ identical | Low |
| Column / blog (칼럼/블로그) | Preserve exactly as given | None beyond restructuring existing content | Preserve | One kept, rest asymmetric |
| Personal essay (개인 에세이/수필) | Preserve exactly as given | Low-risk detail only, explicitly flagged | Preserve | Author's own rate — don't strip a genuine stylistic signature |

## Worked example

**Before (AI-typical):**
> AI 규제에 대해 논의할 필요가 있다. 이 문제는 단순한 기술 문제가 아니라, 사회 전체의 문제다.
> 규제가 필요한가, 자율에 맡겨야 하는가. 결론적으로, 지금 필요한 것은 속도가 아니라 방향이다.

**After:**
> AI 규제를 논의해야 한다. 이 문제는 기술만의 문제가 아니라 사회 전체가 마주한 문제다. 정부가
> 규제를 서두르면 혁신 속도가 떨어질 수 있고, 자율에만 맡기면 책임 소재가 흐려질 수 있다. 지금
> 필요한 건 어느 쪽인지를 먼저 정하는 일이다.

**Changes:** "~에 대해" was left alone (a lone instance, not a cluster — see false
positives above); the antithesis pair ("규제가 필요한가, 자율에 맡겨야 하는가") was resolved
into two concrete, asymmetric outcomes instead of a rhetorical question pair; the
reflexive "결론적으로" opener and the cleft-sentence "필요한 것은 ~이다" formula were both
removed and replaced with a direct statement of what actually needs deciding.

## Sources

`similar-github-projects/by-language/ko/im-not-ai/skills/humanize-korean/references/
ai-tell-taxonomy.md` — the full 70-pattern, 10-category (A–J) taxonomy with measured
frequencies for every entry; this file draws primarily on categories A (translation-
ese), C (structural), and D (signature phrases), plus the reversal and injection
findings from the source's own version history. Categories E (rhythm/sentence-length
uniformity), F (redundant modification), G (hedging), H (connective overuse), I
(formal/dependent nouns), and J (visual decoration) exist in the source at the same
depth and are the next increment for this file — see the source directly rather than
waiting for a future revision here if you need them now.
