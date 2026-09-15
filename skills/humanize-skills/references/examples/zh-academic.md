# zh-academic — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Non-English:
> needs a native-speaker check.

`--academic`, Chinese. The crossing: `zh.md`'s genre gate makes academic the **strictest
fact-lock** ("none whatsoever" for new facts); `academic.md` demands every claim earn a
citation — but you **cannot add one**, so the resolution is flag-don't-fill. Chinese
academic register keeps certain formal structures the general pass would flatten.

---

## Case 1 — AI Chinese abstract, edit warranted

**Setup:** "帮我改一下这段摘要，--academic。" Genre: 学术/学位论文.

**Input:**
> 近年来，图神经网络受到了越来越多的关注。本文提出了一种全新的框架，该框架不仅提升了性能，更是为图
> 表示学习奠定了坚实的基础。大量实验表明，我们的方法证明了其相较于现有方法的优越性。综上所述，本研究
> 具有重要的理论意义。

**Expected decisions:**
- "近年来，……受到了越来越多的关注" — formulaic academic opener, `academic.md` + `zh.md`
  (导览式/套话开场). Open with the actual gap.
- "本文提出了一种全新的框架" — "全新/novel" padding, `academic.md`.
- "不仅提升了性能，更是……奠定了坚实的基础" — negative parallelism ("不仅…更是…"), `zh.md` +
  significance hype ("奠定坚实的基础"), `academic.md`. State what the work does.
- "大量实验表明" — empty intensifier ("大量"), `academic.md`. Name the datasets/benchmark.
- "证明了其……优越性" — over-claiming verb ("证明"), `academic.md`. Empirical work 表明/
  提供证据, it does not 证明 a universal truth. Downgrade and scope it.
- "实验表明" with no citation/figure reference — `academic.md` claim-evidence discipline.
  `zh.md` academic register: "claim must match evidence exactly." The source has no
  numbers or dataset names → **flag the gap; do not invent a citation, a dataset, or a
  delta** (`zh.md` academic fact-lock: "none whatsoever").
- "综上所述" — paragraph-final reflexive closer, `zh.md`. Cut.
- "具有重要的理论意义" — significance hype (genre of importance instead of the specific
  contribution), `academic.md`.
- Half-width punctuation check: if the source mixes `,`/`。` — convert to full-width
  (`zh.md`). Quote style: keep consistent, default `""`.
- **Do not casualize**: no first-person opinion, no rhetorical question, no blog
  register — neutral precise Chinese academic prose *is* the human register here.
- Change magnitude: ~50% (eyeballed). No-edit gate: passed.

**Reference "after":**
> 本文提出一种基于注意力的邻居聚合方式，按层重新加权邻居贡献。在 [基准数据集：待补充] 上，该方法
> 与最强基线持平或更优。
> （注：摘要缺少真实的研究动机、数据集名称和具体差距，这三项都需由作者补充，此处一律未作虚构，
> 包括动机。）

**Blind forced-choice answer key:** a judge picks the **Input** — "近年来，……受到了越来
越多的关注"、"全新的框架"、"不仅……更是……奠定了坚实的基础"、"证明了……优越性"、"综上所述"、
"具有重要的理论意义" are textbook AI-academic Chinese. The reference-after states only
what the draft actually contained (an attention-based method), scopes the claim, and
flags the missing motivation and benchmark rather than reconstructing them.

**A regression here looks like:** "证明" survives instead of "表明"; a motivation, a
mechanism, a dataset name, or a performance number gets invented to fill the gap;
"不仅…更是…" stays; "综上所述" or "具有重要的理论意义" is kept; half-width punctuation
survives; or the register gets casualized (a first-person aside, a rhetorical question).

---

## Case 2 — correct Chinese academic sentence, NO EDIT

**Setup:** "把这句改得自然点，--academic。"

**Input:**
> 由于样本量较小且置信区间较宽，本文结果仅提示该干预可能与症状严重程度的下降相关，尚不能据此得出
> 因果结论（见表 2）。

**Expected decisions:**
- Evidence-tied hedging ("仅提示"、"可能与……相关"、"尚不能……得出因果结论") over a genuinely
  uncertain claim — `academic.md` + `zh.md` academic preserve. Do **not** strengthen.
- Sample-size / confidence-interval scoping ("样本量较小且置信区间较宽") — the exact
  information a reader needs; cutting it to "tighten" is a defect, `academic.md`.
- "（见表 2）" — a figure/table reference, preserved verbatim, `academic.md`.
- Full-width punctuation throughout. No banned vocabulary, no negative parallelism, no
  significance hype, no formulaic opener/closer.
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> 本研究表明，该干预显著降低了症状严重程度，为相关治疗提供了新方向（尽管样本量有限）。

**Blind forced-choice answer key:** a judge picks the **over-edited version** — it
converted "仅提示……可能相关" → "表明……显著降低了" (a fabricated overclaim), dropped the
confidence-interval caveat and the table reference, added "显著" with no test, and tacked
on significance hype ("为相关治疗提供了新方向"). Every one is an `academic.md` /
fact-lock violation. The input is correct academic Chinese.

**A regression here looks like:** any hedge is deleted or strengthened ("提示"→"表明"/
"证明"; "可能相关"→"降低了"); the CI / sample-size caveat is cut; "（见表 2）" is dropped;
or "显著" / a significance-hype clause appears.
