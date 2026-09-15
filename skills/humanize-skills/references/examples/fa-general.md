# fa-general — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Non-English:
> needs a native-speaker check. **RTL** script/layout handling is a separate open item
> (roadmap risk note).
>
> **Catalog fix applied (2026-09-06):** `fa.md`'s own worked-example "after" used an em
> dash "—", which its Layer-4 note ("the em dash is not native Persian punctuation")
> argues against; it was rewritten to use «؛». This fixture's reference-after uses «؛» /
> comma / parenthesis, not an em dash.

`--general`, Persian. `fa.md` four layers, applied in order: orthography (safe
everywhere) → register → phrases (density, not presence) → structure (highest risk).
The **protected list** wins over any other rule.

---

## Case 1 — bureaucratic slop with buried audience, edit warranted

**Setup:** "این متن را بازنویسی کن که کمتر شبیه هوش مصنوعی باشد، --general." Register:
general article/report.

**Input:**
> شایان ذکر است که در دنیای امروز، تحول دیجیتال نه تنها برای کسب‌وکارها ضروری می‌باشد،
> بلکه یک فرصت انقلابی نیز به شمار می‌رود. همچنین، این امر نقش مهمی ایفا می‌کند. همچنین،
> بررسی‌های متعددی توسط کارشناسان در این زمینه انجام گرفته است. مورد استفاده قرار دادن
> این راهکار جامع می‌تواند پتانسیل هر سازمانی را آزاد کند. این مطلب مخصوص تیم‌های فنی
> کوچک است.

**Expected decisions:**
- **Layer 2** — "می‌باشد" → "است" (`fa.md`: the single strongest register tell);
  "به شمار می‌رود" → "است"; "مورد استفاده قرار دادن" → "استفاده از" (inflated compound
  verb); "توسط کارشناسان … انجام گرفته است" → active with named agent
  ("کارشناسان … بررسی کرده‌اند") — the «توسط» passive calque.
- **Layer 3** — "شایان ذکر است که" (throat-clearing, delete); "در دنیای امروز" (empty
  time-framing, fully removable); "نقش مهمی ایفا می‌کند" (importance inflation with no
  concrete content — say what it actually does); "همچنین" ×2 (repeated connector —
  `fa.md`: at most one per text; consecutive sentences opening with it is a signature);
  "بررسی‌های متعددی … کارشناسان" (vague attribution — name a study or cut); "راهکار
  جامع", "پتانسیل" (high-frequency machine vocabulary cluster).
- **Layer 4** — "نه تنها … بلکه … نیز" (negative parallelism; `fa.md`: one instance
  across a text is fine, this is the only one, but it's stacked with everything else so
  it goes); **information placement** — "این مطلب مخصوص تیم‌های فنی کوچک است" is the
  single most important line and it's **buried last**. `fa.md`: this structural defect
  stays active in *every* mode. Move the audience to the first line.
- Fact-lock: no study, no numbers → flag, don't invent.
- Change magnitude: ~65% (eyeballed). No-edit gate: passed.

**Reference "after":**
> این یادداشت برای تیم‌های فنی کوچک است.
>
> تحول دیجیتال کار تکراری تیم ما را از سه روز به چهار ساعت رساند. برای هر سازمانی یک‌جور
> جواب نمی‌دهد؛ چیزی که برای ما جواب داد، حذف مرحله‌های دستی تکراری بود. (رقم دقیقی درباره‌ی
> ابعاد این تغییر در پیش‌نویس نبود و باید از منبع واقعی آورده شود.)

**Blind forced-choice answer key:** a judge picks the **Input** — "شایان ذکر است که",
"در دنیای امروز", "می‌باشد", the double "همچنین", "توسط کارشناسان … انجام گرفته", "مورد
استفاده قرار دادن", "راهکار جامع / پتانسیل", plus the audience line stranded at the end.
The reference-after leads with the audience and asserts a concrete result.

**A regression here looks like:** "می‌باشد" survives; "توسط … انجام گرفته" isn't made
active; "همچنین" opens two sentences; the audience line ("مخصوص تیم‌های فنی کوچک") stays
buried at the end (the structural rule that never turns off); or a study / statistic
gets invented.

---

## Case 2 — developer's channel message with Finglish + colloquial verbs, NO EDIT

**Setup:** "این پیام رو یه‌کم مرتب کن، --general." Register: **channel message / chat**
(colloquial).

**Input:**
> هفته‌ی پیش بالاخره بیلد رو به تول جدید مایگریت کردیم، نصف روز طول کشید. اکسپورت که اوکی
> بود، ایمپورت کند بود — ۲۰۰ تا رپو نزدیک سه ساعت طول کشید. باید زودتر انجام می‌دادیم،
> تنبلی کردیم دیگه. یه رانر هنوز گیر می‌کنه، ممنون میشم اگه کسی بدونه چرا.

**Expected decisions:**
- **Protected list** (`fa.md`): colloquial contractions ("اوکی", "دیگه", "میشه/میشم",
  "گیر می‌کنه") stay colloquial — Layer 2's register fixes are **inactive** on text
  that was never meant to be formal. Finglish/technical loanwords (بیلد، تول، مایگریت،
  اکسپورت، ایمپورت، رپو، رانر) are **not translation targets** — "مخزن" for "رپو" would
  read more artificial than the loanword.
- One "ممنون میشم اگه…" is a single تعارف instance — `fa.md` protected list: politeness
  up to one instance is not filler. Keep it.
- Concrete detail (هفته‌ی پیش, نصف روز, ۲۰۰ تا, سه ساعت — Persian digits, consistent). A
  self-aware aside ("تنبلی کردیم دیگه"). An open question at the end.
- Layer 1 orthography is already consistent (ZWNJ where needed, Persian digits, Persian
  letterforms). The one " — " between short clauses: `fa.md` says Persian's equivalent
  is the comma/parenthesis — a light swap to a comma is the *most* that's warranted,
  and it's optional here.
- No "می‌باشد", no «توسط» passive, no throat-clearing, no importance inflation, no
  repeated "همچنین", no buried audience.
- No-edit gate: **triggered.** Correct output is no change (at most the one dash → comma).
- Change magnitude: 0–3%.

**Deliberately over-edited version (for the blind pair):**
> هفته‌ی گذشته سرانجام عملیات مهاجرت سیستم بیلد به ابزار جدید توسط تیم انجام پذیرفت که
> نیم روز به طول انجامید. فرآیند برون‌بری به‌خوبی صورت گرفت، در حالی که فرآیند درون‌ری
> کند بود و انتقال دویست مخزن نزدیک به سه ساعت زمان برد. لازم به ذکر است که این کار
> می‌بایست زودتر انجام می‌شد. همچنین، علت گیر کردن یکی از اجراکننده‌ها همچنان نامشخص
> می‌باشد.

**Blind forced-choice answer key:** a judge picks the **over-edited version** — it
formalized a chat message ("عملیات مهاجرت … توسط تیم انجام پذیرفت", "به طول انجامید",
"فرآیند برون‌بری", "لازم به ذکر است", "همچنین", "می‌باشد"), translating protected
Finglish and stripping the colloquial register — every Layer-2/3 move the protected
list forbids here. The input is a real message.

**A regression here looks like:** the skill formalizes the register; "مایگریت کردیم"
becomes "عملیات مهاجرت … انجام پذیرفت"; "اکسپورت/ایمپورت/رپو/رانر" get translated;
"تنبلی کردیم دیگه" becomes "می‌بایست زودتر انجام می‌شد"; "می‌باشد" or «توسط» appears; or
the single "ممنون میشم" politeness is cut.
