# ja-technical — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Non-English:
> needs a native-speaker check.

`--technical`, Japanese. The crossing: `technical.md` says leave inanimate subjects and
domain jargon alone, keep rigid doc shapes, skip the structural pass, blameless
postmortems; `ja.md` says cut "〜することができます" always, flag katakana **overload** (but
genuine technical loanwords like デプロイ/コミット stay), and — per `ja.md`'s register
table — technical docs keep a **consistent** polite register (no honorific variation).

---

## Case 1 — AI Japanese incident summary + doc blurb, edit warranted

**Setup:** "この障害報告を直して、--technical。"

**Input:**
> 弊社の優秀なエンジニアリングチームは、一部のユーザー様に影響を与えた軽微な速度低下を迅速に解決
> することができました。当社の堅牢かつスケーラブルなインフラストラクチャのおかげで、問題は迅速に
> パッチされました。田中さんが誤った設定変更をデプロイしたことが原因ですが、既に修正済みであり、
> 今後このようなことが起こらないと確信しております。詳細は以下の通りです：
> **影響範囲:** 一部のユーザー。
> **対応:** 設定を元に戻すことができました。

**Expected decisions:**
- "弊社の優秀なエンジニアリングチーム", "堅牢かつスケーラブルなインフラストラクチャ" — marketing
  language / significance inflation in an incident report, `technical.md` + `ja.md`.
- "軽微な速度低下" — vague severity word underselling it, `technical.md`. Use the team's
  actual severity label + the real metric (which the source doesn't give → flag).
- "解決することができました" ×1 and "元に戻すことができました" — `ja.md`: "〜することができます"
  is almost always shortenable; → "解決しました" / "元に戻しました".
- "パッチされました" / "修正済み" — asserts a code fix; if only a config rollback happened,
  say "設定を元に戻しました", `technical.md` (workaround ≠ fix) + fact-lock.
- **"田中さんが誤った設定変更をデプロイしたことが原因"** — a named individual as the cause,
  `technical.md` blameless-postmortem rule. Remove the name; flag the removal in the
  change report.
- "今後このようなことが起こらないと確信しております" — unsupported claim, `technical.md`.
  Replace with the actual follow-up action if one exists; otherwise flag that none was
  stated.
- "インフラストラクチャ" as a stacked katakana abstraction — `ja.md` katakana overload.
  (But "デプロイ" and "パッチ" as verbs are genuine technical jargon — `ja.md` + 
  `technical.md`: leave those.)
- "〜しております" honorific inflation in a status report — `ja.md` register table: 
  technical keeps a *consistent* polite register; "〜しております" is over-polite for this
  genre, use plain です/ます.
- `**影響範囲:**` bold-label bullets — `ja.md`. But a runbook/report's fixed field
  structure is legitimate (`technical.md` — structural pass skipped for these formats);
  keep the fields, drop the empty label-restates-content pattern where each bullet's
  content just echoes its label.
- Fact-lock: no duration, no user count, no metric in the source → flag; do not invent.
- Structural pass: **skipped** (`technical.md` — this is a report format).
- Change magnitude: ~55% (eyeballed). No-edit gate: passed.

**Reference "after":**
> **インシデント [ID]：[重大度 例 SEV-2]**
> [開始]〜[終了] UTC の間、[具体的な症状 例「APIのp99レイテンシが5秒を超え、約[N]%のリクエストが
> タイムアウトした」]。[時刻]にデプロイされた設定変更がトリガーと特定され、[時刻]にロールバック。
> その後[対象の指標]はベースラインに戻った。
> 原因: [調査中／確定（記入待ち）]。
> フォローアップ: [担当者付きのアクション項目（記入待ち）]。
> *(担当者名を原因行から削除しました（ブレームレスの慣例）。「パッチ」を「設定を元に戻す」に修正。
> 原稿はコード修正ではなくロールバックを示していました。具体的な障害メカニズム・継続時間・影響
> ユーザー数・フォローアップは原稿になく、すべて記入待ちのプレースホルダー（でっち上げていません）。)*

**Blind forced-choice answer key:** a judge picks the **Input** — "優秀なエンジニアリング
チーム"、"堅牢かつスケーラブルなインフラストラクチャ"、"確信しております"、the "〜することが
できました" and the contributor's name in the cause line are the tells. The reference-after
reads as a real postmortem including the honest "調査中" option.

**A regression here looks like:** the contributor's name stays in the cause line;
"パッチ/修正済み" survives when only a rollback happened; "解決することができました" isn't
shortened; a genuine technical katakana term (デプロイ/リクエスト) gets swapped for a
native word; a specific failure mechanism, a duration, or a user-count number gets
invented; "軽微な速度低下" is kept
instead of the real severity; or "〜しております" honorific inflation survives.

---

## Case 2 — correct plain Japanese API-doc paragraph, NO EDIT

**Setup:** "このAPIドキュメントを自然にして、--technical。"

**Input:**
> エンドポイントは、呼び出し元が毎分100リクエストを超えると429を返します。`Retry-After`
> ヘッダーに待機秒数が入ります。カウントはAPIキー単位で、IP単位ではありません。キャッシュは
> 書き込み時に無効化されるため、書き込み直後の読み取りには新しい値が反映されます。

**Expected decisions:**
- Inanimate subjects ("エンドポイントは……返します"、"キャッシュは……無効化される") —
  precise, `technical.md` "what NOT to flag". Not a missing-agent defect.
- Genuine technical katakana (エンドポイント、リクエスト、ヘッダー、キャッシュ、キー) — not
  overload, `ja.md` + `technical.md`. Leave them.
- "反映されます" — plain passive with no recoverable agent, correct, `technical.md`.
- Consistent です/ます, no honorific inflation, no "〜することができます", no marketing
  adjective, no bold-label bullets, no severity language.
- Structural pass skipped (reference doc).
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> スムーズで快適なご利用のために、当社の強力なレート制限機能が、リクエストが多すぎる場合には
> 429ステータスコードを丁寧に返させていただきます。ご安心ください、便利な`Retry-After`ヘッダーが
> 再試行のタイミングをきちんとお知らせします。カウントは公平性のためAPIキー単位で慎重に適用して
> おります。

**Blind forced-choice answer key:** a judge picks the **over-edited version** — "スムーズで
快適なご利用のために"、"当社の強力なレート制限機能"、"丁寧に返させていただきます"、"ご安心
ください"、"便利な"、"慎重に適用しております" inject marketing tone and honorific inflation
into a reference doc. The input is correct.

**A regression here looks like:** "エンドポイントは……返します" becomes "……返させて
いただきます" or "お返しします"; any reassurance / marketing adjective ("強力な"、"便利な"、
"スムーズ"、"ご安心ください") is added; "毎分100リクエスト" specificity is softened; or
honorific register is inflated above plain です/ます.
