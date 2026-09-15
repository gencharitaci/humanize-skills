# zh-general — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Any
> change-magnitude percentage below is a rough eyeball estimate, not measured (no scanner).


`--general`, Chinese. Uses `zh.md`'s genre gate. These two cases are business/general
explanation register — distinct from `zh.md`'s own worked example, which is personal
narrative.

---

## Case 1 — general explanation slop, edit warranted

**Setup:** "把这段介绍改得不那么像 AI 写的，--general。" Genre: business / general
explanation (商务/说明) — `zh.md` genre gate: **no new facts, numbers, or cases**.

**Input:**
> 让我们深入探讨一下低代码平台的价值。低代码不仅仅是一种工具,更是一种全新的开发范式。它的核心在于
> 赋能业务人员,让他们无需编写代码就能构建应用。本质上,低代码解决的是"人"的问题,而不是"技术"的问题。
> 我们的平台具备以下三大优势:
> **效率:** 开发周期大幅缩短。
> **成本:** 显著降低人力投入。
> **体验:** 界面直观易用。
> 机遇与挑战并存,低代码的未来值得期待。

**Expected decisions:**
- "让我们深入探讨一下" — guided-tour opener, `zh.md` (导览式开场). Cut the announcement.
- "深入探讨" — banned high-frequency AI vocabulary, `zh.md`.
- "不仅仅是一种工具,更是一种全新的开发范式" — negative parallelism, `zh.md`. State directly.
- "赋能" — banned vocabulary (bureaucratic residue), `zh.md`. Replace with a plain verb.
- "它的核心在于" / "本质上,……解决的是……问题,而不是……问题" — the false-depth reveal, `zh.md`.
  Write the judgment directly.
- "具备以下三大优势" + the forced three-item list — 三段论 triad, `zh.md`. Vary the count;
  merge to prose.
- `**效率:** ……` bold-label bullet list — `zh.md` (每项加粗标签+冒号). The text after each
  colon restates the label. Merge into a sentence with real content.
- Half-width punctuation: `,` `.` and `""` used where full-width `，` `。` belong —
  `zh.md` (半角/全角), a reliable mechanical tell. Convert all.
- "机遇与挑战并存,……值得期待" — formulaic "challenges and outlook" close, `zh.md`. Name one
  real limitation or drop it.
- Fact-lock (商务 genre): no numbers, no adoption figures in the source → cannot add any;
  flag that the "大幅缩短" / "显著降低" claims need real figures.
- Change magnitude: ~65%. No-edit gate: passed.

**Reference "after":**
> 低代码平台让不写代码的人也能搭出内部应用——审批流、报表、小工具这类。适合的场景通常是流程清楚、
> 改动频繁、又不值得排期给开发的那种。它替代不了复杂系统的工程工作，这一点用之前要想清楚。
> （效率和成本这两句原文只有"大幅""显著"，没有具体数字——要放进对外材料，得补上真实的周期和人力对比。）

**Blind forced-choice answer key:** a judge picks the **Input** — "让我们深入探讨"、
"不仅仅是工具,更是范式"、"本质上……解决的是'人'的问题"、the bold-label triad and the
"机遇与挑战并存" close are all recognizable machine-Chinese. The reference-after names
concrete scenarios and states a limitation, which reads human.

**A regression here looks like:** half-width punctuation survives; the bold-label list
is kept; "赋能" or "范式" stays; the "值得期待" close is kept; or a concrete cycle-time /
headcount number gets invented to replace "大幅缩短".

---

## Case 2 — already-human casual post, NO EDIT

**Setup:** "帮我把这段润色一下，让它更自然，--general。"

**Input:**
> 上周把公司的构建迁到新工具了，折腾了一下午。导出还行，导入是真的慢，两百多个仓库跑了三个多小时。
> 早该换了，拖到现在纯粹是懒。

**Expected decisions:**
- Full-width punctuation throughout. Specific checkable detail (上周、一下午、两百多个仓库、
  三个多小时). A stated opinion with a bit of self-criticism ("拖到现在纯粹是懒"). Uneven
  rhythm. No banned vocabulary, no negative parallelism, no bold labels.
- `zh.md` "human-writing signals to preserve": concrete detail, an author who can
  justify their own choices, uneven length.
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> 上周,我们成功完成了公司构建系统向新工具的迁移工作。整个过程耗时一个下午。实践证明,数据导出环节较为
> 顺畅,而导入环节则相对缓慢——两百多个代码仓库的迁移共计耗时三个多小时。这次迁移本应更早进行,此前的
> 拖延主要源于惯性。

**Blind forced-choice answer key:** a judge picks the **over-edited version** — half-width
em dash, "成功完成了……工作"、"实践证明"、"环节"、"共计耗时"、"主要源于惯性" flatten a
casual note into a report. The input is untouched human writing.

**A regression here looks like:** the skill produces any rewrite; converts "折腾了一下午"
into "耗时一个下午"; adds "成功" / "实践证明"; or turns "纯粹是懒" into "源于惯性".
