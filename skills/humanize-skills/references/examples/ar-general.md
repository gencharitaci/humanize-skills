# ar-general — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Non-English:
> needs a native-speaker check. **RTL:** script/layout handling is a separate open
> item (roadmap risk note) — these fixtures test pattern content only.

`--general`, Arabic (MSA). `ar.md`: determine register first (news is the safe
default; opinion allows full rhetoric). Core inversion vs. other languages — AI Arabic
**hedges where native writers assert**; restoring assertion and rhythm is the job.

---

## Case 1 — hedged, list-flattened opinion paragraph, edit warranted

**Setup:** "أعد صياغة هذا النص ليبدو أقل شبهاً بالذكاء الاصطناعي، --general." Register:
opinion (مقالة رأي).

**Input:**
> في ظل التطورات المتسارعة، تجدر الإشارة إلى أنه من المحتمل أن الاقتصاد الرقمي قد يكون
> له دور مهم في المنطقة. علاوة على ذلك، تم إجراء العديد من الدراسات حول هذا الموضوع.
> علاوة على ذلك، يُعتبر الاستثمار في هذا المجال أمراً مهماً. وتشمل الفوائد:
> - زيادة الكفاءة
> - خفض التكاليف
> - تحسين الجودة
> علاوة على ذلك، من المهم الإشارة إلى أن المستقبل يبدو واعداً في هذا الصدد.

**Expected decisions:**
- "في ظل التطورات المتسارعة" — clichéd throat-clearing opener, `ar.md`. Delete; begin
  with the first real claim.
- "تجدر الإشارة إلى أنه" + "من المحتمل أن … قد يكون" + "من المهم الإشارة إلى أن" —
  hedging overload, `ar.md` (AI hedges 3–4× the human rate; opinion writing asserts).
- **"علاوة على ذلك" ×3** — `ar.md`'s single most decisive tell. Three instances is on
  its own near-sufficient to flag. Cut most; rotate the rest (إضافة إلى ذلك / فضلًا عن
  ذلك) at most once each.
- "تم إجراء … الدراسات" + "يُعتبر" — تم/formal-passive overuse, `ar.md`. Name the agent,
  go active.
- "تم إجراء العديد من الدراسات" — vague attribution (no study named), `ar.md`. Name one
  or cut the claim; never invent.
- The bulleted list — argumentation converted to bullets, `ar.md` (a list of claims
  stops being an argument). Convert to connected prose with real connectives (outside
  technical register).
- "المستقبل يبدو واعداً" — formulaic conclusion, `ar.md`. A خاتمة needs real weight.
- Rhythm: every sentence is the same shape — introduce a short single-sentence
  paragraph (`ar.md`: AI almost never does this; it signals "this matters").
- Fact-lock: no named study, no numbers → flag, don't invent.
- Change magnitude: ~65% (eyeballed). No-edit gate: passed.

**Reference "after":**
> الاقتصاد الرقمي يعيد رسم سوق العمل في المنطقة، وهذا لم يعد موضع جدل.
>
> الاستثمار فيه ليس رفاهية، بل شرط للنمو: من دونه تبقى الشركات المحلية خارج المنافسة على
> الطلبات التي صارت تُنجَز رقمياً بالكامل. أما الأرقام الدقيقة عن حجم هذا التحول فغير
> واردة في المسودة، وتحتاج مصدراً حقيقياً قبل نشرها.

**Blind forced-choice answer key:** a judge picks the **Input** — the triple "علاوة على
ذلك", the stacked hedges, the تم-passive, and the argument-as-bullet-list are
recognizable AI MSA. The reference-after asserts, varies rhythm (a one-sentence
paragraph), and flags the missing figure.

**A regression here looks like:** "علاوة على ذلك" survives more than once; the hedge
stack is kept (or the rewrite *adds* hedging to an assertion); the bullets stay; a
study or a statistic gets invented; or the output is one uniform block with no
single-sentence paragraph.

---

## Case 2 — already-human assertive opinion paragraph, NO EDIT

**Setup:** "حسّن هذه الفقرة لتبدو أكثر طبيعية، --general."

**Input:**
> نقلنا نظام البناء إلى أداة جديدة الأسبوع الماضي. استغرق الأمر نصف يوم.
>
> التصدير مرّ بسلاسة. الاستيراد هو المشكلة: أكثر من مئتي مستودع أخذت قرابة ثلاث ساعات.
> كان يجب أن نفعل هذا من زمان، لكننا كسلنا. ولا أعرف حتى الآن لماذا يتوقف أحد المشغّلات.

**Expected decisions:**
- Direct assertion, not hedged. A one-sentence paragraph ("استغرق الأمر نصف يوم.") —
  a `ar.md` human signal, not a defect. Concrete detail (الأسبوع الماضي، نصف يوم، مئتي
  مستودع، ثلاث ساعات). A self-critical aside ("لكننا كسلنا"). An open question at the end.
- No "علاوة على ذلك", no hedge stack, no تم-passive, no clichéd opener, no formulaic
  conclusion, no bullet list.
- No-edit gate: **triggered.** Correct output is no change — in particular, do **not**
  add hedging or merge the short paragraph into the block.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> في إطار جهودنا المستمرة لتحسين البنية التحتية، تم الأسبوع الماضي إجراء عملية نقل نظام
> البناء إلى أداة جديدة، وقد استغرقت هذه العملية ما يقارب نصف يوم. وتجدر الإشارة إلى أن
> مرحلة التصدير قد تمت بسلاسة، في حين أن مرحلة الاستيراد كانت أكثر استهلاكاً للوقت، إذ
> إن أكثر من مئتي مستودع قد استغرق نقلها ما يقارب ثلاث ساعات. علاوة على ذلك، فإن سبب
> توقف أحد المشغّلات لا يزال قيد التحليل.

**Blind forced-choice answer key:** a judge picks the **over-edited version** — "في
إطار جهودنا المستمرة", "تم … إجراء عملية نقل", "وتجدر الإشارة إلى أن", "علاوة على ذلك",
"لا يزال قيد التحليل" reintroduce every tell the mode removes: bureaucratic framing,
تم-passive, hedge openers, and "علاوة على ذلك". The input is a real note.

**A regression here looks like:** the skill rewrites at all; the one-sentence paragraph
gets absorbed into the block; "نقلنا … استغرق" becomes "تم … إجراء عملية نقل"; hedging
or "علاوة على ذلك" is added; or "كسلنا" becomes "لأسباب تتعلق بالأولويات".
