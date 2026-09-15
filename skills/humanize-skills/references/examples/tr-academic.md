# tr-academic — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Non-English:
> needs a native-speaker check.

`--academic`, Turkish. The crossing: `academic.md` says preserve hedging/passive/formal
register and do **not** casualize; `tr.md` Phase 2 for academic register allows only
**restrained** rhythm variance, **no** rhetorical questions, **no** voice profile — but
the **five absolute bans still apply**, and academic Turkish's `-maktadır` is
genre-correct only up to ~20–25% frequency.

---

## Case 1 — AI Turkish abstract, edit warranted

**Setup:** "Bu özeti düzelt, --academic." Register: akademik/kurumsal.

**Input:**
> Bu çalışmada, düşük kaynaklı diller için önerilen model, mevcut yaklaşımların
> sınırlılıklarını aşmakta; aynı zamanda literatüre önemli bir katkı sunmaktadır. Bu
> bağlamda, kapsamlı deneyler — üç farklı veri kümesi üzerinde — modelimizin üstünlüğünü
> kanıtlamaktadır. Söz konusu bulgular, alandaki gelecek çalışmalar için sağlam bir
> temel oluşturmaktadır.

**Expected decisions:**
- **Absolute ban 2 (semicolon):** "aşmakta; aynı zamanda" — split into two sentences.
  `tr.md`. Non-negotiable, holds even in formal/academic Turkish.
- **Absolute ban 1 (em dash):** "— üç farklı veri kümesi üzerinde —" — remove; use
  commas or restructure. `tr.md`.
- "aynı zamanda … katkı sunmaktadır" reads with "Sadece X değil" logic → "Sadece X
  değil, aynı zamanda Y" family, `tr.md` — **one instance is enough to flag**.
- "Bu bağlamda", "Söz konusu" — bureaucratic connective stacking, `tr.md` dominant
  signal.
- "-maktadır/-mektedir" appears 4× ("aşmakta", "sunmaktadır", "kanıtlamaktadır",
  "oluşturmaktadır") — `tr.md` cluster tell. **Reduce to ~1 in 4, don't eliminate** —
  academic Turkish legitimately uses this ending; vary the rest with other tenses.
- "literatüre önemli bir katkı", "gelecek çalışmalar için sağlam bir temel" —
  significance hype, `academic.md`. State the specific contribution.
- "kanıtlamaktadır" — over-claiming verb, `academic.md`. Experiments *show* / *provide
  evidence*, they don't *prove*. → "göstermektedir" and scope it to the three datasets.
- "kapsamlı deneyler" — empty intensifier, `academic.md`. Name the datasets/benchmark.
- **Do not casualize** (`academic.md` + `tr.md` academic gate): no rhetorical questions,
  no colloquial connectives (ama/zaten), no voice injection, no first person "ben".
- Fact-lock: no dataset names or deltas in the source → flag; do not invent benchmark
  names or numbers to make "üstünlüğünü göstermektedir" concrete.
- Change magnitude: ~50% (eyeballed). No-edit gate: passed.

**Reference "after":**
> Bu çalışmada düşük kaynaklı diller için dikkat temelli bir model önerilmektedir.
> Model, [veri kümesi adları eklenecek] üzerinde en güçlü temel modelle
> karşılaştırılmıştır.
> *(Not: özetin sonucu ve ölçülen farkı taslakta belirtilmemiş; bu bilgiler yazar
> tarafından eklenmelidir. Burada hiçbir sonuç, oran veya veri kümesi adı
> uydurulmamıştır.)*

**Blind forced-choice answer key:** a judge picks the **Input** — the semicolon, the
mid-sentence em dash, "Bu bağlamda / Söz konusu", "kanıtlamaktadır", "önemli bir
katkı", and the "-maktadır" pile-up read as AI-academic Turkish. The reference-after
keeps a formal register, downgrades the overclaim, and flags the missing result rather
than inventing one.

**A regression here looks like:** the semicolon or the em dash survives (absolute-ban
failure); the register gets casualized (a rhetorical question, an "ama" appears); every
predicate is still "-maktadır" **or** all of them get removed (over-correction — the
ending is genre-correct in moderation); "göstermektedir" gets pushed back up to
"kanıtlamaktadır"; or a result, a ratio, or dataset names/numbers get invented.

---

## Case 2 — correct Turkish academic sentence, NO EDIT

**Setup:** "Bunu daha doğal yap, --academic."

**Input:**
> Örneklerin sınırlı sayıda olması nedeniyle, sonuçların daha büyük veri kümelerinde
> doğrulanması gerekmektedir. Elde edilen bulgular, önerilen yöntemin bu koşullar
> altında etkili olabileceğini göstermektedir.

**Expected decisions:**
- Evidence-tied hedging ("olabileceğini", "doğrulanması gerekmektedir") over a genuinely
  limited-sample claim — `academic.md` preserve list. Do not strengthen.
- Passive ("doğrulanması gerekmektedir") where the actor is irrelevant — correct
  academic register, `academic.md`.
- A **single** "-mektedir/-maktadır" ("gerekmektedir", "göstermektedir") — `tr.md`: only
  a cluster of four or more is the tell; two is fine.
- No em dash, no semicolon, no fragment, no "Sadece X değil", no bureaucratic connective
  stack, no significance hype, no over-claiming verb.
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> Peki bu sonuçlara güvenebilir miyiz? Örnek sayısı az olsa da, bulgular önerilen
> yöntemin bu koşullarda kesinlikle etkili olduğunu açıkça kanıtlıyor — yani yöntem
> çalışıyor.

**Blind forced-choice answer key:** a judge picks the **over-edited version** — it
casualized academic register (a rhetorical question "Peki … miyiz?", "yani yöntem
çalışıyor"), strengthened "olabileceğini göstermektedir" → "kesinlikle … açıkça
kanıtlıyor" (a fabricated overclaim), and added a banned mid-sentence em dash. Every one
of those is a crossing failure. The input is correct academic Turkish.

**A regression here looks like:** any hedge is deleted or strengthened; a rhetorical
question or colloquial connective is introduced; "göstermektedir" becomes "kanıtlıyor";
or an em dash appears.
