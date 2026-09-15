# Language: Chinese (zh)

Pairs with `references/core-rules.md` and `references/structural-pass.md`. Synthesized
from nine native-built Chinese humanizer skills cloned into
`similar-github-projects/by-language/zh/`, not translated from `en.md` — several of the
tells below (number formatting, punctuation width, English-term spacing) have no
English equivalent at all, and several of English's tells (em dash overuse) show up in
Chinese for a completely different reason than they do in English.

## Genre gate — read this before applying anything else

Chinese-language sources converge hard on one point `en.md` only implies: **which
tells even apply, and how much can be added versus only rewritten, depends heavily on
genre** — more so than in English. Use this table alongside whatever `modes/{mode}.md`
is active; it's more granular for Chinese specifically.

| Genre | New sensory/narrative detail allowed? | Register |
|---|---|---|
| Personal narrative / opinion (随笔, 观点) | Only low-risk scene/feeling details, and only for the author's own experience — never for an argument's evidence. Flag every addition explicitly (see Fact-lock below). | First person, mixed emotion, uneven rhythm — see modes/creative.md |
| Business / general explanation (商务/说明) | None. No new facts, numbers, outcomes, or case studies. | Clear, specific, restrained |
| Marketing / brand (营销/品牌) | None invented — no fabricated metrics, rankings, awards, endorsements. Existing selling points may be kept, hollow superlatives removed. | Promotional tone tolerated, hollow exaggeration is not |
| Technical docs / README (技术文档) | None — no new features, parameters, performance numbers. | Neutral, scannable, action-oriented |
| Academic / thesis / grant (学术/学位论文/基金) | None whatsoever — see modes/academic.md; this genre's fact-lock is the strictest of all | Formal, precise, evidence-bound |
| Legal / encyclopedic (法律/百科) | None — no new citations, definitions, or conclusions | Formal, exact, no forced casualness |
| Changelog / migration guide (版本说明/迁移指南) | None — preserve version numbers, dates, and original quoted material exactly | Tracks version relationships precisely |

## Fact-lock, Chinese-specific addendum

Personal-narrative genre is the **only** place where this skill may add scene-level
detail (a smell, a delay, a stray thought) that the source didn't state, and only to
restore rhythm the AI draft flattened — never for business, technical, academic, legal,
or marketing genres. Whenever a detail is added under this exception, list it explicitly
in a **待核实内容** ("to verify") block after the rewrite: one line per addition, naming
what was added and that it wasn't in the source. Never fold an addition into the body
silently, and never use this exception outside personal narrative.

## Banned vocabulary

No more than one or two per paragraph; prefer plain, specific words.

**High-frequency AI vocabulary:** 深入研究/鑽研, 見證, 格局, 強調/凸顯, 突出, 關鍵的, 錯綜複雜,
細緻入微, 充滿活力, 展示, 促進, 與…一致, 持久的, 賦能, 生態, 閉環, 抓手, 底層邏輯, 價值沉澱,
長期主義, 深度融合, 全鏈路, 顆粒度, 場景化, 範式, 躍遷.

**Reflexive praise adjectives (marketing/travel-brochure register bleeding into neutral
prose):** 領先, 卓越, 極致, 革命性, 全方位, 沉浸式, 令人驚嘆, 世界級, 獨具魅力.

**Copula avoidance:** 可視為, 呈現出, 體現了, 彰顯了, 具備……屬性, 充當/作為……, 標誌著/代表著……
replacing a plain 是/有. Say 是 when that's what's meant.

## Sentence-pattern habits specific to Chinese

**Negative parallelism.** 不是……而是…… / 不只是……更是…… — fine once, a tell when it
recurs. A related, distinctly Chinese variant: a clipped negative fragment tacked onto
a sentence's end instead of written as a full clause (無需猜測, 不留死角, 毫不費力 used as
sentence-final ad-copy stingers rather than real predicates).

**The false-depth reveal.** 真正的問題是…… / 歸根結底…… / 本質上…… / 核心在於…… — a two-step
move that pretends to cut through to a deeper truth, then just restates an ordinary
point more grandly. Write the judgment and its basis directly instead of staging a
reveal.

**The aphorism formula.** X 是 Y 的語言 / X 不是工具，而是一面鏡子 / ……的架構 / ……的貨幣 —
turns an ordinary claim into a quotable-sounding maxim that adds no precision. Replace
with the specific point it's gesturing at.

**Rhetorical question-then-answer as a crutch.** 這家公司最值錢的是什麼？是數據庫裡那堆表。 —
occasional use is fine; reflexive use in place of a direct statement is a tell.

**"一句話講清楚" and "……這件事" framing.** 它幹的事情用一句話講清楚：X — state X directly
instead of announcing that a summary is coming. Likewise 寫……這件事 as a nominalized
stand-in for a plain verb phrase.

**Guided-tour openers.** 讓我們深入探討…… / 下面我們來拆解…… / 廢話不多說 — announces what's
about to happen instead of just doing it. Cut the announcement.

**Fake-candid hooks.** 說實話？/ 老實講， / 你知道嗎？ used as a standalone dramatic pause
before an ordinary point. The tell is the staged pause, not the phrase itself — these
are unremarkable mid-sentence in genuinely casual writing.

## Formatting and punctuation — largely unique to Chinese, do not assume English's list applies

**Half-width vs. full-width punctuation.** A Chinese sentence using an English comma
`,` and period `.` instead of the correct full-width `，` and `。` is one of the more
reliable mechanical tells — normal Chinese typing input methods don't produce this by
accident.

**Number formatting.** Thousands separators in a run of Chinese prose (`100,000`) read
as unnatural — a person typing Chinese numerals by hand generally doesn't add commas
that Chinese doesn't grammatically need.

**Dash overuse, but for different reasons than English.** A short list of items
followed by a dash-introduced aside (`视界、光子环、吸积盘、被弯曲的字——都是光线追踪出来的`)
or metaphor-heavy dash constructions with heavy figurative language on both sides read
as AI-typical. Chinese tolerates the mark (—— , full "Chinese em dash") far less
often than English tolerates its own em dash; treat any use beyond one true
parenthetical break per piece as a tell, and check specifically whether it's being used
to stage a dramatic reveal (— 用來製造轉折或揭示感) rather than a genuine aside.

**Quotation-mark-wrapped metaphors.** Wrapping an ordinary metaphor or label in quotes
as if flagging its cleverness (`它把"提醒你休息"從功能問題變成了審美問題`) is a tell distinct
from normal quotation use.

**Quote style itself.** Chinese text mixes `""` (straight, Western-style) and `「」`
(traditional/vertical-friendly) quotation conventions. Precedence: an explicit user
request → a project-level declaration (e.g. a `CLAUDE.md`/`AGENTS.md` note) → the
input's own existing style if it's already consistent → default to `""`. Never mix both
styles within one piece.

**English terms embedded in Chinese prose.** Multi-word English terms get a half-width
space before/after when embedded in Chinese prose (`AI Design Agent`); no space
before an opening Chinese parenthesis when glossing a term (`LLM（大語言模型）`); no
spaces around a slash joining parallel English terms (`coworkers/agents`); English
brand names keep their official capitalization (`YouTube`, `GitHub`).

**Bulleted lists where every item is a bold label plus colon.** `**效率：** ……` /
`**體驗：** ……` stacked — same tell as English, same fix: merge into prose, or make
every item carry real information instead of a label.

**Bold overuse.** Bolding a phrase in nearly every sentence, including ordinary
conclusions, flattens the emphasis it's supposed to create. Keep it rare.

**Over-listing instead of summarizing with 等等.** Naming eight items in a row
(`Widget、郵件、WhatsApp、Facebook Messenger、Instagram、X、Telegram、LINE、SMS、TikTok`)
where a person would name the two or three that matter and say "等等" ("and so on").

## Structural and article-level habits

**Reflexive san-duan-lun (三段論) triads.** Forcing every list, every set of reasons,
and every section into exactly three parallel items. Vary the count.

**Formulaic "challenges and outlook" closings.** 機遇與挑戰並存 / 前景值得期待 / 未來仍需持續探索
as a reflexive ending with no specific content. If a piece needs to close, name one
actual limitation or next step.

**Heading-then-restatement.** A heading followed immediately by a sentence that just
restates the heading (`## 性能` → `性能非常重要。`) before the real content starts. Cut
the restatement.

**Coherence check at the article level.** Does the opening paragraph's stated question
actually get answered by the close? Do body paragraphs each serve a distinct function
(background, claim, evidence, example, turn, close) rather than reading as
interchangeable filler? A piece that could have its paragraphs reordered without loss
has a structure problem core-rules.md's rhythm check won't catch on its own — check
this explicitly for Chinese long-form pieces (`references/structural-pass.md` §2 covers
the same idea at the discourse level; this is the sentence-adjacent version of it).

### Opener rotation and pre-flight carve-out

Conjunction openers: 但, 但是, 所以, 然而, 不过 — all natural. Verb-first is rare
in formal written Chinese (topic-comment structure does that work instead); do
not inject verb-first openers to "vary" academic prose. Questions sparingly in
formal registers. Pre-flight carve-out: none confirmed — universal pre-flight
applies; native review may add one.

## Register table

| Register | New-fact tolerance | Dash tolerance | Quote style default | Judgment strength |
|---|---|---|---|---|
| Legal / encyclopedic (法律/百科) | None | Very low | Match source/project convention | Fully hedged, cite everything |
| Academic (see modes/academic.md) | None — evidence-bound | Very low | `""` unless project states otherwise | Claim must match evidence exactly |
| Business / technical docs (商務/技術文檔) | None | Low | Consistent, either style | Direct, no hedging theater |
| Marketing / brand (營銷/品牌) | None invented; existing claims may stay | Low | Consistent | Promotional tone kept, hollow superlatives cut |
| Blog / essay / personal narrative (隨筆/觀點) | Low-risk scene detail only, always flagged — see Fact-lock above | Author's own rate | Match a supplied voice sample if given | Opinion and mixed feeling allowed — see modes/creative.md |

## What NOT to flag (false positives specific to Chinese)

- Clean grammar and consistent style alone — many writers are edited professionals.
- Mixed casual/formal register in one piece — common in technical or younger writers'
  Chinese, not itself a signal.
- A single 然而/此外/因此 — only a cluster of repeated connectives is a tell.
- Formal or academic vocabulary used correctly and specifically (遑論, 構成要件) — the
  banned list above targets specific reflexive words, not all elevated diction.
- A lone curly quote or a lone dash — common editor/IME defaults; only counts stacked
  with other tells.
- A single short, forceful sentence — only a *run* of short dramatic fragments in a row
  is the tell (see the aphorism/punchline pattern above).
- Unsourced claims alone — most web text has no citations; that alone proves nothing.

## Human-writing signals to preserve, not "fix"

- Specific, hard-to-invent details (a real address, an odd direct quote, a detail only
  someone who was there would know).
- Genuinely unresolved mixed feelings, stated as such, rather than a tidy resolved
  verdict.
- Dated, subculture-specific slang or references tied to a real year — models lag
  behind these.
- An author explicitly able to justify a specific word or cut they made.
- Concrete named actors and actions rather than abstractions doing the acting (让"数据"
  "市场""趋势" replace a real person or team as the sentence's subject is the tell to
  fix; a real person as subject is what to preserve).
- Uneven sentence length, real asides, and mid-sentence self-correction.
- Anything written before ChatGPT's public release (late 2022) — treat as human by
  default.

## Worked example

**Before (AI-typical):**
> 這次旅行不僅讓我領略了城市的獨特魅力，也讓我對生活有了更深層次的思考。這座城市坐落在河畔，是這個
> 國家不朽精神的生動見證，歷史底蘊與現代活力在每個轉角交織。從主廣場往外走幾步，你就會發現一個更
> 安靜、更本真的一面。我還會再來嗎？絕對會。這裡不只是一個值得一遊的地方——它是一個讓你一次又一次
> 墜入愛河的地方。✨

**After:**
> 這次旅行最讓我記得的不是景點，而是傍晚坐在路邊吃東西的那半小時。城市很吵，但那一刻反而讓人鬆下
> 來。往主廣場外面走兩個街區，晾衣繩、缺角的瓷磚、開著的窗，還有把聲音開得很大看球的老人——這才是
> 我會一直想起的部分。我會再來，但下次會挑春天。

**Changes:** removed inflated significance ("不朽精神的生動見證"), the reflexive
question-then-answer close, the em-dash-staged reveal used as a sales flourish, the
emoji, and the generic positive ending; replaced with one specific, checkable scene.
No new facts were added beyond concrete rendering of what the source already implied
(a quiet side street, an evening) — this is prose-level specificity, not new content,
so no 待核实内容 block is needed here.

## Sources

Synthesized from `similar-github-projects/by-language/zh/`: `Humanizer-zh-1`,
`humanizer-zh-2` (op7418 lineage — genre gate, punctuation/quote/term conventions),
`humanizer-zh-next` (op7418 + blader + academic-humanizer localized — the 33-pattern
catalog, genre fact-boundary matrix, and detection guide this file draws on most
heavily), `humanizer-academic-zh` and `humanizer-zh-academic` (academic register —
see modes/academic.md for the mode-level rules these inform), `chinese-ai-humanizer`
(the punctuation-width, number-formatting, and rhetorical-pattern observations with no
English equivalent), `zh-humanizer-literary` (personal/editorial voice), and
`qu-ai-wei` (the arbitration-hierarchy approach to fact-lock vs. voice vs. register
this file's Fact-lock addendum is grounded in).
