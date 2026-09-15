# pl-general — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Non-English:
> also needs a native-speaker check of both the slop input and the reference "after".

`--general`, Polish. `pl.md` mode gate → **Normal** for a blog paragraph, **Cautious**
once facts/numbers appear. Dash: default to the stricter source (ASCII hyphen only)
pending native review; keep the en-dash only in genuine numeric ranges.

---

## Case 1 — "today's world" blog paragraph with a hallucinated abbreviation, edit warranted

**Setup:** "Przepisz to mniej po chatbotowemu, --general."

**Input:**
> W dzisiejszym dynamicznie zmieniającym się świecie automatyzacja stanowi kluczowy
> element sukcesu — nie chodzi tylko o oszczędność czasu, chodzi o przewagę. Według
> badań GUS (Generalny Urząd Statystyki) aż 78% polskich firm planuje wdrożenia w tym
> roku, co na koniec dnia robi ogromną różnicę. Sure, here is a more concise version:
> firmy, które tego nie rozumieją, zostają w tyle.

**Expected decisions:**
- "W dzisiejszym dynamicznie zmieniającym się świecie" — "today's world" opening,
  `pl.md`. Delete; open with the content.
- "stanowi kluczowy element" — copula avoidance ("stanowi") + "kluczowy" AI vocabulary,
  `pl.md`. Restore "jest" / a plain verb.
- " — nie chodzi tylko o X, chodzi o Y" — negative parallelism + the flagged dash,
  `pl.md`. State directly; remove the dash (stricter-source default).
- **"GUS (Generalny Urząd Statystyki)"** — hallucinated abbreviation expansion, `pl.md`
  high-priority fact-lock category. The real expansion is **Główny Urząd
  Statystyczny**. Correct it against reality; never leave invented text.
- "Według badań GUS … aż 78%" — a statistic attributed to a specific body; `pl.md`
  Cautious mode says flag for verification, don't silently keep an unverifiable number
  and don't invent a citation to prop it up. Flag it.
- "na koniec dnia" / "robi ogromną różnicę" — idiomatic English calques ("at the end of
  the day" / "make a difference"), `pl.md`. → "ostatecznie" / "ma znaczenie".
- **"Sure, here is a more concise version:"** — leaked English prompt fragment, `pl.md`
  (a documented real-world failure). Delete entirely; scan the whole text for more.
- "zostają w tyle" after "firmy, które tego nie rozumieją" — the challenges/outlook
  cliché shape; tie to a real consequence or cut.
- Over-timid guard (`pl.md`): don't stop at swapping the dash and two words — the
  weakest sentence's structure needs rebuilding.
- Change magnitude: ~70% (eyeballed). No-edit gate: passed.

**Reference "after":**
> Coraz więcej polskich firm automatyzuje powtarzalne procesy — najczęściej fakturowanie,
> raportowanie i obsługę zgłoszeń. Część wciąż tego nie robi, mimo że wdrożenie bywa
> proste. *(Usunięto: zdanie „Według badań GUS… 78%" — GUS to Główny Urząd Statystyczny,
> nie „Generalny", a samej liczby 78% nie da się zweryfikować; do potwierdzenia przez
> autora. Usunięto też wklejony angielski fragment „Sure, here is…".)*

**Blind forced-choice answer key:** a judge picks the **Input** — "W dzisiejszym
dynamicznie zmieniającym się świecie", "stanowi kluczowy element", "na koniec dnia",
the wrong GUS expansion, and especially the literal "Sure, here is a more concise
version:" are unmistakable. The reference-after names concrete processes and flags the
number.

**A regression here looks like:** the leaked English sentence survives; "GUS —
Generalny Urząd Statystyki" is kept (or a *different* wrong expansion invented); the
78% figure is kept without a flag, or a fake citation is added to support it; "na
koniec dnia" stays; or the diff is 80% punctuation/word swaps with no structural
rewrite (the over-timid failure).

---

## Case 2 — already-human casual post, NO EDIT

**Setup:** "Ulepsz ten wpis, żeby brzmiał naturalniej, --general."

**Input:**
> W zeszłym tygodniu przenieśliśmy build na nowe narzędzie, zeszło pół dnia. Eksport
> git, import wolny jak nie wiem co - ponad 200 repo szło jakieś trzy godziny. Trzeba
> było wcześniej, ale zawsze się odkłada. Jeden runner dalej się wiesza i nie wiem
> czemu.

**Expected decisions:**
- Concrete detail (zeszły tydzień, pół dnia, ponad 200 repo, trzy godziny). Colloquial
  ("git" = OK, "wolny jak nie wiem co"). A self-aware aside. An open problem at the end.
  Real sentence-length variation.
- One ASCII hyphen used as a casual dash — already the form `pl.md`'s stricter default
  wants; not a tell.
- `pl.md` has no rule to hyper-correct a casual post's minor informalities; leave them.
- No "today's world" opening, no copula avoidance, no calque, no leaked fragments, no
  hallucinated abbreviation.
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> W ubiegłym tygodniu dokonaliśmy migracji systemu build na nowe narzędzie, co zajęło
> pół dnia roboczego. Eksport przebiegł bez zakłóceń, natomiast import okazał się
> znacząco wolniejszy — migracja ponad 200 repozytoriów trwała około trzech godzin.
> Zadanie to należało zrealizować wcześniej; odkładanie tego rodzaju działań jest
> częstym zjawiskiem. Przyczyna, dla której jeden z runnerów wciąż się zawiesza,
> pozostaje nieustalona.

**Blind forced-choice answer key:** a judge picks the **over-edited version** —
"dokonaliśmy migracji", "przebiegł bez zakłóceń", "znacząco wolniejszy", "Zadanie to
należało zrealizować", "pozostaje nieustalona" is nominalized bureaucratic Polish with
an injected em dash. The input is a real post.

**A regression here looks like:** the skill rewrites at all; "przenieśliśmy … zeszło
pół dnia" becomes "dokonaliśmy migracji … zajęło pół dnia roboczego"; the ASCII hyphen
becomes an em dash; "zawsze się odkłada" becomes "jest częstym zjawiskiem"; or the
minor slips get hyper-corrected.
