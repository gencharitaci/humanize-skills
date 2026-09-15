# ru-general — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Any
> change-magnitude percentage below is a rough eyeball estimate, not measured (no scanner).


`--general`, Russian. Hard bans (every register): the em dash, negative parallelism.
Biggest lever: канцелярит (bureaucratic nominalization). Discourse layer =
`structural-pass.md`, not re-derived here.

---

## Case 1 — канцелярит + empty-opening paragraph, edit warranted

**Setup:** "Сделай текст менее похожим на нейросеть, --general." Register:
blog / general explanation.

**Input:**
> В современном мире эффективность коммуникации в распределённых командах играет
> ключевую роль. Осуществление перехода на удалённый формат работы способствует не
> только снижению издержек, но и трансформации корпоративной культуры. По мнению
> экспертов, данная тенденция является необратимой. Компания, команда, сотрудник — все
> выигрывают от гибкости. Стоит отметить, что в определённом смысле это меняет всё.

**Expected decisions:**
- "В современном мире… играет ключевую роль" — empty opening, `ru.md`. Delete the
  whole first sentence; start with a fact.
- "Осуществление перехода … способствует … снижению … трансформации" — канцелярит
  (deverbal-noun chain), `ru.md`, the single most important marker. Restore verbs:
  "переход … снизил издержки и изменил…".
- "не только… но и…" — negative parallelism, `ru.md` **hard ban**. State directly.
- "По мнению экспертов" — vague authority, `ru.md`. Name the source, or switch to the
  writer's own voice ("я считаю" is more honest than "многие считают").
- "данная тенденция является необратимой" — "данная" filler + "является" copula calque,
  `ru.md` (English calques). Drop both.
- "Компания, команда, сотрудник —" — the em dash, `ru.md` **hard ban**, every register.
  Replace (colon, or restructure).
- "Стоит отметить, что" — English calque ("it's worth noting that"), `ru.md`.
- "в определённом смысле это меняет всё" — padded hedging + translated hype idiom
  ("this changes everything"), `ru.md`.
- Fact-lock: no source, no numbers → flag, don't invent.
- Verbosity: `ru.md` says AI Russian compresses 40–60% — expect a much shorter result.
- Change magnitude: ~70%. No-edit gate: passed.

**Reference "after":**
> Переход на удалёнку сократил расходы на офис и заметно изменил то, как в команде
> договариваются: больше переписки, меньше встреч, зато постоянная возня с тем, чтобы
> найти пару часов, когда все онлайн. Насколько это в плюс по продуктивности — по-
> разному, зависит от команды и от задач.
> *(«По мнению экспертов» убрано: конкретного источника не было, выдумывать не стали.)*

**Blind forced-choice answer key:** a judge picks the **Input** — "В современном мире",
"Осуществление перехода … способствует", "не только… но и…", the em-dash triad and
"это меняет всё" are strong Russian-AI markers. The reference-after uses a hyphen,
particles ("зато", "по-разному"), and an unresolved judgment — reads like a person.

**A regression here looks like:** any em dash survives; "не только… но и…" stays; the
nominalization chain isn't verbalized; "является" / "данная" survive; a source gets
invented; or the output is barely shorter than the input (verbosity not cut).

---

## Case 2 — already-human phone-typed post, NO EDIT

**Setup:** "Поправь этот пост, чтобы звучал живее, --general." Register: social/casual.

**Input:**
> На прошлой неделе перевели сборку на новый инструмент, провозились полдня. Экспорт
> норм, импорт реально медленный - двести с чем-то репозиториев ехали часа три. Давно
> надо было, тянули просто по лени. До сих пор не пойму, почему один раннер всё равно
> висит.

**Expected decisions:**
- `ru.md` casual-register guidance: a phone-typed message with a plain hyphen (not a
  dash) and a bracket/space quirk "is not an error, it's a hand" — leave 1–2 minor
  imperfections rather than hyper-correcting.
- Particles of life ("норм", "реально", "просто по лени"). Concrete detail (полдня,
  двести с чем-то, часа три). An open question at the end. Real short/long variation.
- No канцелярит, no negative parallelism, no em dash (the "-" is a hyphen), no empty
  opening.
- No-edit gate: **triggered.** Correct output is no change — specifically do **not**
  "upgrade" the hyphen to a typographically correct dash or «ёлочки».
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> На прошлой неделе нами был осуществлён перевод системы сборки на новый инструмент,
> занявший половину рабочего дня. Экспорт прошёл без затруднений, тогда как импорт
> потребовал существенно больше времени — миграция более чем двухсот репозиториев
> заняла около трёх часов. Данную задачу следовало решить раньше; промедление было
> обусловлено недостаточной приоритизацией.

**Blind forced-choice answer key:** a judge picks the **over-edited version** — "нами
был осуществлён перевод", "занявший половину рабочего дня", "потребовал существенно
больше времени", a typographically perfect em dash, "Данную задачу следовало",
"обусловлено недостаточной приоритизацией" is канцелярит plus robot-perfect
typography. The input is a real phone-typed message.

**A regression here looks like:** the skill rewrites at all; the hyphen becomes a dash
or «ёлочки»; "провозились полдня" becomes "занявший половину рабочего дня"; "по лени"
becomes "недостаточной приоритизацией"; or the minor imperfections get hyper-corrected.
