# Language: Japanese (ja)

Pairs with `references/core-rules.md` and `references/structural-pass.md`. Synthesized
from `similar-github-projects/by-language/ja/humanizer-ja`, a lean 20-pattern skill
organized into five categories, ending in a mandatory self-audit question. Smaller in
scope than the Chinese or Korean catalogs, but its two Japanese-specific structural
points (subject-dropping, honorific-register uniformity) have no equivalent in any
other language file here.

## Vocabulary and phrasing

**Inflated significance**: stacking "重要な," "極めて," "計り知れない" onto an ordinary fact
instead of stating the concrete number or outcome ("業界全体のDX推進において極めて重要な役割"
→ state what actually got faster, in what unit).

**Stock evaluative phrases** — treat as near-automatic AI tells and always rewrite:
浮き彫りにしており (say plainly what became visible instead), 今後の展開が注目されます
(delete, or state your own prediction), 多面的な/包括的な/画期的な (specify what is
actually multifaceted or groundbreaking about it), 注目に値する (say in one sentence why
it caught your attention), 〜と言えるでしょう and 〜ではないでしょうか (commit to a direct
statement instead of hedging into a rhetorical question).

**Katakana overload**: AI trained across multilingual data reaches for katakana
loanwords where a native word exists — レバレッジ, イノベーティブ, トランスフォーメーション
stacked together is the tell. Three or more katakana loanwords in a row is worth a
second look; prefer the native equivalent (和語) where one exists.

**Vague sourcing**: "業界の専門家によると," "調査結果が示すように," "多くの企業が指摘しているように"
with no actual source. Name the specific source (a company, a study, a year) or
state plainly that there is no source and the claim is the writer's own view.

## Structural and formatting patterns

**Bold-label bullet lists**: "**速度:** 処理速度が3倍に向上" — one of the two most
recognizable Claude/ChatGPT formatting habits in Japanese. Strip the label, keep only
the content, and let the sentence read on its own.

**Forced groups of three**: benefits, steps, or points reflexively bundled into
exactly three. If there are genuinely three, keep three — but a sentence that opens
with "3つにまとめると" is worth checking for padding.

**Full-width dash overuse (——)**: the direct Japanese-script equivalent of English's
em-dash habit — used to insert an aside mid-sentence ("Claude Code——Anthropicが開発した
CLIツール——を使えば"). Convert to parentheses or a comma: "Claude Code（AnthropicのCLI
ツール）を使えば."

**Over-structured short sections**: adding h2/h3 subheadings to a section under roughly
300 characters. Let short material read as flowing text instead of forcing a heading
onto it.

## Tone patterns

**Preachy preambles**: "ここで重要なのは〜という点です," "〜について理解しておく必要があります,"
"注意すべき点として" — cut the preamble and state the content directly; the reader can
judge what matters without being told to.

**Connective overuse**: 一方で, しかしながら, 加えて, このように, さらに, とりわけ — three or
more of these in one passage is too many. Cut about half and let sentence order carry
the logic instead.

**Negative-parallelism pairs**: "単なるツールではない。パラダイムシフトだ。" — a construction
borrowed wholesale from English "not just X, it's Y." Two or more in one piece is the
tell; rewrite one side into a different construction.

**Sycophantic tone**: "素晴らしいご質問ですね！", "非常に良い指摘です," "おっしゃる通り" — cut the
flattery; if praise is warranted, say specifically what was good about it.

**The unearned "-ing" tail equivalent**: a factual sentence followed by an
unsupported inference tacked on — "売上は前年比120%でした。これは同社の戦略が功を奏していることを
示しており、今後の成長が期待されます。" State the fact and stop; let the reader draw the
inference, or draw it yourself with actual support.

## Japanese-specific structural patterns (no equivalent in other language files here)

**Honorific-register uniformity**: AI-generated Japanese holds one honorific level
(です/ます, say) uniformly across an entire piece with no variation, where a human
writer shifts register by context — mixing in a plain-form ending or a noun-stop
sentence (体言止め) for emphasis. Uniform politeness level throughout a longer piece is
itself a tell, independent of any specific word choice.

**Excessive explicit subject-marking**: Japanese is a language that omits the subject
freely; AI writing carries over English's habit of stating the subject in every
sentence ("このツールは高速です。このツールはセキュリティも強固です。このツールは無料で使えます。").
Drop the repeated subject and let the predicates carry the sentence, or combine into
one sentence: "高速で、セキュリティも強固。しかも無料。"

## Filler shortenings

"〜することができます" is almost always shortenable: "設定を変更することができます" →
"設定を変更できます," and often further to "設定は変えられます." Apply this cut wherever
found; there's essentially no register in which the unshortened form reads as more
natural rather than more stilted.

## Conclusion register

**Bodiless conclusions**: "以上のことから、AIツールの活用は今後ますます重要になると考えられます" —
a conclusion with no first-person stake in it. Where the genre allows a first-person
voice (see `modes/creative.md`, `modes/general.md`), replace the hedge-verb ending
("〜と考えられます") with an actual stated reaction ("〜と思ってます," "〜と感じてます") and give
the piece a genuine opinion or a concrete next step to end on, not a passive
prediction.

### Opener rotation and pre-flight carve-out

Conjunction openers: しかし (formal), でも (casual only), だから, そして.
Register-mismatched openers (でも in a report, しかも stacking) fail louder
than repetition does — match the level before varying it. No English-syntax
の-chain openers. Pre-flight carve-out: none confirmed — universal pre-flight
applies; native review may add one.

## Register table

| Register | Honorific variation | Subject-dropping | First-person conclusion |
|---|---|---|---|
| Business / technical docs | Low — keep polite register consistent, but avoid mechanical repetition of subjects | Full — drop subjects freely | Not used |
| Blog / essay / personal | Full — mix plain-form and noun-stops for emphasis | Full | Encouraged — see modes/creative.md |
| Formal / academic | Keep uniform, this is correct here | Moderate — clarity over economy | Not used |

## Worked example

**Before:**
> 近年、AI技術が急速に進展しており、業界全体のDX推進において極めて重要な役割を果たしております。
> このツールは高速です。このツールはセキュリティも強固です。以上のことから、AIツールの活用は今後
> ますます重要になると考えられます。

**After:**
> このツールは速くて、セキュリティもしっかりしてる。実際に使ってみて役に立つかは、[何の作業がどれ
> だけ変わったか。元の文には書いていない]しだいだと思う。
> （「効率が上がる」「重要な役割」は具体的な数字がなく、対外的に出すなら実測値が要る。ここでは数字を
> 作っていない。）

**Changes:** the reflexive significance inflation ("極めて重要な役割") and the
subject-per-sentence habit ("このツールは…。このツールは…") were removed; the bodiless
hedge-verb conclusion ("〜と考えられます") was replaced with a first-person, opinionated
frame (appropriate here since this is a blog/personal register — see modes/academic.md
for why this would be wrong in formal writing). The draft names no concrete result, so
the "how much did it actually change" is left as an explicit gap rather than invented
(the fact-lock forbids inventing an example such as "3 日→4 時間").

## Sources

`similar-github-projects/by-language/ja/humanizer-ja` — the complete 20-pattern
checklist with a mandatory two-pass self-audit ("would a reader think this was written
by AI?") this file's structure is drawn from.
