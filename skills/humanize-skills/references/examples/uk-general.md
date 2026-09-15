# uk-general — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Non-English:
> also needs a native-speaker check of both the slop input and the reference "after".

`--general`, Ukrainian. `uk.md`'s core inversion: **the dash is native — leave it
alone** and hunt calques/Russianisms instead. Definition-through-negation ("не X, а Y")
is the #1 structural marker. Preserve fact, change only form.

---

## Case 1 — calque + canceralit marketing paragraph, edit warranted

**Setup:** "Перепиши цей текст, щоб він не звучав як AI, --general." Register:
business offer / landing.

**Input:**
> В сучасному світі кожен підприємець стикається з рядом викликів. Важливо зазначити,
> що наша компанія являється лідером ринку та здійснює надання послуг з розробки
> сайтів. Ми не просто робимо сайти — ми створюємо рішення. В даний час ми пропонуємо
> індивідуальний підхід до кожного клієнта, що є ключовим чинником, який сприяє
> формуванню довгострокової співпраці.

**Expected decisions:**
- "В сучасному світі" — empty time-framing, `uk.md`. Discard.
- "Важливо зазначити, що" — meta-commentary, `uk.md`. Delete; state the substance.
- **"являється"** → "є" / "це" — Russianism, `uk.md` calque table. Fix on sight.
- **"В даний час"** → "зараз" / "нині" — Russianism, `uk.md` calque table.
- "здійснює надання послуг з розробки" — canceralit (deverbal-noun chain), `uk.md`.
  → "робимо сайти".
- "Ми не просто робимо сайти — ми створюємо рішення" — **definition through negation**
  ("не просто X — це Y"), `uk.md`'s single most decisive structural marker. Say what it
  IS. Note: the dash here is only holding up the antithesis — cut the antithesis first,
  not the dash mechanically.
- "лідер ринку", "індивідуальний підхід до кожного клієнта" — dead infobiz clichés,
  `uk.md`. Replace with a concrete claim/offer.
- "що є ключовим чинником, який сприяє формуванню довгострокової співпраці" — copula
  avoidance ("є … чинником") + significance vocabulary ("ключовим", "сприяє", "формує")
  + genitive-case chain, `uk.md`. Break into a subject and a verb.
- Fact-lock: no real numbers/названия in the source → none invented; if a concrete
  offer is wanted, flag it.
- Change magnitude: ~65% (eyeballed). No-edit gate: passed.

**Reference "after":**
> Більшість сайтів у малому бізнесі не дають заявок — людині незрозуміло, що робити
> далі. Ми робимо сторінки, на яких наступний крок видно одразу.
> *(Конкретну пропозицію — скільки проєктів береться, ціну, формат аудиту — треба взяти
> з реальних даних замовника; у чернетці їх не було, і вони не вигадуються. Тире в
> «не дають заявок — людині незрозуміло» та в наступному реченні — питомі українські
> контрастні/еліптичні конструкції, англомовний пас не повинен їх прибирати.)*

**Blind forced-choice answer key:** a judge picks the **Input** — "В сучасному світі",
"Важливо зазначити, що", "являється", "В даний час", "здійснює надання послуг",
"Ми не просто X — ми Y" is a dense calque + canceralit + definition-by-negation stack.
The reference-after keeps its dashes as native contrastive/elliptical punctuation and
flags the missing offer rather than inventing one.

**A regression here looks like:** an English-trained pass **strips the native dashes**
in the reference-after (the exact failure `uk.md` exists to prevent); "являється" or
"В даний час" survives; the "не просто X — це Y" definition stays; the canceralit chain
isn't verbalized; or a project count / price / CTA gets invented instead of flagged.

---

## Case 2 — already-human text with mandatory dashes, NO EDIT

**Setup:** "Зроби цей абзац природнішим, --general."

**Input:**
> Київ — моє місто, і сваритися з ним марно. Минулого тижня перенесли збірку на новий
> інструмент, пішло півдня. Експорт нормально, імпорт повільний — понад 200 репозиторіїв
> їхали майже три години. Оксано, ти мала рацію: треба було раніше. Один раннер досі
> висне, і я поки не розумію чому.

**Expected decisions:**
- **Two mandatory native dashes**: "Київ — моє місто" (subject–predicate) and "імпорт
  повільний — понад 200…" (contrastive/elided). `uk.md`: **leave them alone** — they
  are not AI markers, and removing them is the signature English-pass failure.
- Vocative case in direct address ("Оксано", not "Оксана") — a `uk.md` human signal,
  preserve.
- "проєкт"/"репозиторіїв" spelling, concrete detail (минулого тижня, півдня, понад 200,
  майже три години), an open problem at the end, real sentence-length variation.
- No calques (перенесли ✓ not "перенесли" issue, "пішло півдня" ✓), no canceralit, no
  definition-through-negation, no time-framing, no meta-commentary.
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> Київ, моє місто, і конфлікт із ним є безперспективним. Минулого тижня було здійснено
> перенесення збірки на новий інструмент, що зайняло півдня. Експорт відбувся у
> штатному режимі, тоді як імпорт виявився повільним, і міграція понад 200
> репозиторіїв тривала майже три години. Оксана, ти мала рацію, що це слід було
> зробити раніше. Причина, з якої один раннер продовжує зависати, наразі не
> встановлена.

**Blind forced-choice answer key:** a judge picks the **over-edited version** — it
**deleted both native dashes** (comma-splicing "Київ, моє місто"), added canceralit
("було здійснено перенесення", "виявився повільним", "не встановлена"), and flattened
the vocative "Оксано" → "Оксана". Every one of those is a `uk.md` failure. The input is
untouched.

**A regression here looks like:** the skill rewrites at all; either native dash is
removed or replaced with a comma; "перенесли … пішло півдня" becomes "було здійснено
перенесення"; the vocative "Оксано" gets flattened to "Оксана"; or "не розумію чому"
becomes "причина не встановлена".
