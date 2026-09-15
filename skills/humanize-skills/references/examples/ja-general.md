# ja-general — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Any
> change-magnitude percentage below is a rough eyeball estimate, not measured (no scanner).


`--general`, Japanese. `ja.md`: significance inflation, stock evaluative phrases,
bold-label bullets, honorific-register uniformity, excessive explicit subjects, the
"〜することができます" cut, bodiless conclusions.

---

## Case 1 — inflated explanatory paragraph, edit warranted

**Setup:** "このテキストをAIっぽくないように直して、--general。" Register: blog/personal
(first-person conclusion is allowed here).

**Input:**
> 近年、リモートワークが急速に普及しており、企業の生産性向上において極めて重要な役割を果たしております。
> この働き方はコストを削減します。この働き方は従業員の満足度も向上させます。この働き方は組織文化をも
> 変革します。業界の専門家によると、この流れは不可逆的だと言えるでしょう。
> **メリット:** 通勤時間の削減。
> **課題:** コミュニケーションの難しさ。
> 以上のことから、リモートワークの活用は今後ますます重要になると考えられます。

**Expected decisions:**
- "近年、……急速に普及しており" + "極めて重要な役割を果たして" — inflated significance /
  formulaic opener, `ja.md`. State what actually got faster, in what unit.
- "この働き方は……。この働き方は……。この働き方は……" — excessive explicit subject-marking,
  `ja.md` (Japanese-specific structural). Drop the repeated subject; combine.
- "〜と言えるでしょう" — stock evaluative hedge-into-rhetorical, `ja.md`. Commit to a
  direct statement.
- "業界の専門家によると" — vague sourcing, `ja.md`. Name a source (company, study, year)
  or say plainly there is none.
- `**メリット:** ……` bold-label bullets — one of the two most recognizable formatting
  habits, `ja.md`. Strip the labels; let the sentences read.
- "以上のことから、……重要になると考えられます" — bodiless conclusion, `ja.md`. In a
  blog/personal register, replace the "〜と考えられます" hedge with an actual first-person
  reaction and a concrete next step.
- Honorific register: the piece is uniformly です/ます with no variation — `ja.md`
  (honorific-register uniformity). A blog register can mix in a plain-form or a
  noun-stop for emphasis.
- Fact-lock: no numbers, no named source → flag, don't invent.
- Change magnitude: ~60%. No-edit gate: passed.

**Reference "after":**
> リモートワークにして、チームの動き方は変わった。書面でのやり取りが増え、会議が減り、時差をまたいで
> 重なる時間を確保する手間が増えた。数字で見た生産性が上がるかどうかは、チームと仕事の種類しだいだ
> と思う。
> （「効率が上がる」「満足度が向上する」は元の文に具体的な数字がなく、対外資料に使うなら実測値が要る。
> ここでは数字を作っていない。「業界の専門家によると」は出典がないので削除、でっち上げもしない。）

**Blind forced-choice answer key:** a judge picks the **Input** — "近年、……普及しており"、
"極めて重要な役割を果たして"、the "この働き方は……" subject-repetition, the bold-label
bullets, and "以上のことから……と考えられます" are the clearest machine-Japanese tells.
The reference-after has a plain-form close and an unresolved point, and flags the
missing numbers instead of inventing them.

**A regression here looks like:** the bold-label bullets survive; "この働き方は" is still
repeated per sentence; "〜と言えるでしょう" or "〜と考えられます" stays; a source, a
statistic, or a specific team result gets invented; or the whole thing stays uniformly
です/ます with no rhythm shift.

---

## Case 2 — already-human casual note, NO EDIT

**Setup:** "この文章、もっと自然にして、--general。"

**Input:**
> 先週、社内のビルドを新しいツールに移した。半日かかった。エクスポートは問題なし、インポートが遅い。
> 200近くのリポジトリで3時間ちょっと。もっと早くやればよかった。ひとつだけ、なぜか特定のランナーが
> まだ止まる。原因はまだ分かってない。

**Expected decisions:**
- Plain-form (だ/である) held consistently — a real register choice, not a defect.
  Short sentences, one fragment-feel line ("エクスポートは問題なし、インポートが遅い。")
  that is still complete. Concrete detail (先週、半日、200近く、3時間ちょっと). An open
  problem at the end.
- No inflated significance, no bold labels, no vague sourcing, no "〜と考えられます"
  bodiless close, no subject-per-sentence repetition.
- No-edit gate: **triggered.** Correct output is no change — do **not** convert to
  です/ます, do **not** "complete" the short lines.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> 先週、社内のビルドシステムを新しいツールへと移行いたしました。作業には半日を要しております。
> エクスポートは滞りなく完了しましたが、インポートには時間がかかり、200近くのリポジトリの移行に
> 3時間以上を要しました。以上のことから、より早期に対応すべきであったと考えられます。なお、特定の
> ランナーが依然として停止する事象については、現在原因を調査中でございます。

**Blind forced-choice answer key:** a judge picks the **over-edited version** —
"移行いたしました"、"半日を要しております"、"滞りなく完了しました"、"以上のことから……と
考えられます"、"事象については……調査中でございます" flattens a casual だ-form note into
uniform stiff keigo with a bodiless conclusion. The input is untouched.

**A regression here looks like:** the skill rewrites at all; converts だ-form to です/ます;
"移した" becomes "移行いたしました"; adds "以上のことから……と考えられます"; or "原因はまだ
分かってない" becomes "現在原因を調査中でございます".
