# ar-technical — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Non-English:
> needs a native-speaker check.
> Note: `ar.md`'s RTL script/layout handling is still unverified — this fixture pins
> pattern decisions only, not rendering.

`--technical`, Arabic (MSA). The crossing: `ar.md`'s Technical register row is
the most conservative in the whole engine — typography and redundancy fixes
only, NO structural-opener rewrites, NO sentence-length variance, NO rhetorical
figures — while `technical.md` strips marketing adjectives and demands metrics
with units. Resolution: fix the connective (علاوة على ذلك), the hedge stack,
the تم-passives, and the unitless adjectives; keep sentence order, keep the
register flat, keep inanimate subjects (`technical.md`: "the service rejects
the request" is precise, not a missing-agent defect). Applying opinion-register
moves (saj', variance, rhetorical questions) to a changelog is the regression.

---

## Case 1 — AI changelog paragraph, edit warranted

**Setup:** "حسّن هذه الفقرة من سجل الإصدار، --technical --lang=ar."

**Input:**
> من المهم الإشارة إلى أن الإصدار الجديد يُحسّن الأداء بشكل كبير. علاوة على ذلك، تم
> إصلاح العديد من الأخطاء. علاوة على ذلك، أصبحت المنصة أكثر استقرارًا وموثوقية.
> علاوة على ذلك، **يُنصح** جميع المستخدمين بالتحديث الفوري.

**Expected decisions:**
- علاوة على ذلك ×3 — the decisive tell, `ar.md` (three instances alone approach
  sufficiency for a trained reader). Rotate replacements, never repeat one twice
  in a text — here: cut two, keep one rotated form at most.
- "من المهم الإشارة إلى أن" — reflexive hedge opener, `ar.md` hedging overload;
  open on the assertion.
- "تم إصلاح" — تم-passive with a knowable agent, `ar.md`; convert (inanimate
  neutral construction, not an invented "we" — fact-lock: the source names no team).
- "بشكل كبير," "أكثر استقرارًا وموثوقية" — unitless quality adjectives,
  `technical.md` precision failures; replace with the actual figures or flag for
  them — never invent a percentage or a latency number.
- Bold inside running prose ("**يُنصح**") — `ar.md` markdown-in-prose; strip.
- Technical register: NO sentence reordering, NO variance engineering, NO
  single-sentence paragraph, NO saj' (`ar.md` Technical row). Same order in,
  same order out.
- Change magnitude: ~55% (eyeballed). No-edit gate: passed.

**Reference "after":**
> يتضمن الإصدار الجديد تحسينات في الأداء [الأرقام غير مذكورة في المسودة — أضف زمن
> الاستجابة أو الإنتاجية بوحداتها من سجل القياس].
> يتضمن الإصدار إصلاحات لعدة أخطاء [العدد ومعرفات التذاكر غير مذكورة — أضفها من
> نظام التتبع].
> استقرار المنصة [ادعاء بلا قياس — أضف معدل الأعطال أو نسبة الجهوزية].
> حدّث إلى الإصدار الجديد.

**Blind forced-choice answer key:** a judge picks the **Input** — the hedge
opener, the triple علاوة على ذلك, the تم-passive, unitless superlatives, and
prose bold are textbook AI-technical Arabic. The after keeps the sentence
order, rotates out the connective, names the agents neutrally, and flags the
three missing measurements instead of inventing them.

**A regression here looks like:** علاوة على ذلك survives twice or more; a
latency figure or bug count gets invented; sentences get reordered "for flow";
a single-sentence paragraph or saj' ending appears; or the register gets
casualized (dialect, exclamation).

---

## Case 2 — correct Arabic technical snippet, NO EDIT

**Setup:** "راجع هذه الفقرة، --technical."

**Input:**
> يتطلب التثبيت 2 غيغابايت من مساحة القرص واتصالًا بالإنترنت. تستغرق العملية نحو
> خمس دقائق على الأجهزة المدعومة.

**Expected decisions:**
- Metric with unit (2 غيغابايت), named requirement, honest approximation (نحو
  خمس دقائق) with its scope (الأجهزة المدعومة) — `technical.md` precision done
  right; flagging nothing because nothing is missing.
- Inanimate subjects (يتطلب، تستغرق) — correct technical register, not a
  missing-agent tell, `technical.md`.
- Consistent undiacritized MSA; no علاوة على ذلك, no hedge stack, no
  تم-passive, no bold, no list.
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> هل تعلم أن التثبيت يحتاج إلى مساحة؟ إنها 2 غيغابايت فقط! علاوة على ذلك، العملية
> سريعة بشكل لا يُصدَّق. الخلاصة: ثبّت الآن وعش التجربة.

**Blind forced-choice answer key:** a judge picks the **over-edited version** —
it applied opinion-register moves to a technical snippet: rhetorical question,
hype ("فقط!", "لا يُصدَّق"), a reintroduced علاوة على ذلك, and a summary closer
(الخلاصة), plus exclamation-driven fake variance — everything the Technical row
forbids. The input is correct Arabic technical prose.

**A regression here looks like:** "نحو" cut as hedging (it's an honest
approximation with scope — `ar.md` what-NOT-to-flag); inanimate subjects
"fixed" by inventing an agent; variance/saj'/rhetoric added; or any edit at all
— the gate must hold.
