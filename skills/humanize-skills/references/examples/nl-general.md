# nl-general — golden fixtures

> **Status: model-authored, unreviewed — AND the underlying catalog is itself
> unvalidated.** `nl.md` has **no source repo** anywhere in the survey; it is
> extrapolated from cross-linguistic patterns and general Dutch knowledge, flagged in
> its own "honest framing" section as a first-draft hypothesis. So this fixture is a
> hypothesis about a hypothesis. Regression tripwire only — see `README.md` ›
> Validation status. Native review here is a **priority** (above other tier-2).

`--general`, Dutch. Extrapolated tells: empty time-framing, significance inflation,
`niet alleen X, maar ook Y` (native construction — density, not presence),
`Kortom`-conclusions, chatbot residue. Register: je/jij vs. u — hold one; modal
particles (toch, wel, even, maar) carry tone their absence plausibly signals.

---

## Case 1 — time-framed, inflated blog paragraph, edit warranted

**Setup:** "Herschrijf dit zodat het minder als AI klinkt, --general." Register:
informal blog (je-vorm).

**Input:**
> In de wereld van vandaag speelt digitale transformatie een cruciale rol voor elk
> bedrijf. Het is niet alleen een technische verandering, maar ook een culturele
> verschuiving — en dat is een echte gamechanger. Volgens experts is deze ontwikkeling
> onomkeerbaar. Onze naadloze, robuuste oplossing tilt je bedrijf naar een hoger
> niveau. Kortom, wie niet meebeweegt, loopt het risico achterop te raken. Ik hoop dat
> dit helpt!

**Expected decisions:**
- "In de wereld van vandaag" — empty time-framing, `nl.md`. Cut; start with content.
- "speelt een cruciale rol" — significance inflation, `nl.md`. State the concrete thing.
- " — en dat is een echte gamechanger" — the em dash used as a dramatic pause
  (plausible tell, `nl.md`, lower-confidence) + "gamechanger" marketing language. Cut.
- "Het is niet alleen X, maar ook Y" — negative parallelism; `nl.md`: native in Dutch,
  a **single** instance is not a tell, but here it's stacked with everything else, so
  it goes.
- "Volgens experts" — vague attribution, `nl.md`. Name a source or drop it.
- "naadloze, robuuste oplossing" — probable "seamless" calque + metaphorical "robuust"
  + adjective doublet, `nl.md`.
- "tilt je bedrijf naar een hoger niveau" — marketing/infobiz language, `nl.md`.
- "Kortom, wie niet meebeweegt, loopt het risico achterop te raken" — generic warning
  conclusion, `nl.md` + `structural-pass.md` check 1.
- "Ik hoop dat dit helpt!" — chatbot residue, `nl.md`. Delete without exception.
- Register: je-vorm is used ("je bedrijf") — keep it consistent; don't drift to u.
- Fact-lock: no numbers/sources → flag, don't invent.
- Change magnitude: ~70% (eyeballed). No-edit gate: passed.

**Reference "after":**
> Digitale verandering verandert hoe een team werkt, meer op schrift en met minder
> vergaderingen, maar hoe dat uitpakt verschilt sterk per bedrijf.
> *(De brontekst zegt "verhoogt de efficiëntie" en "verlaagt de kosten" zonder één
> cijfer; voor extern gebruik zijn echte getallen nodig, hier is er geen verzonnen.
> "Volgens experts" is geschrapt: geen bron genoemd.)*

**Blind forced-choice answer key:** a judge picks the **Input** — "In de wereld van
vandaag", "speelt een cruciale rol", the dash-plus-"gamechanger", "niet alleen X, maar
ook Y", "naar een hoger niveau", "Kortom", and the literal "Ik hoop dat dit helpt!"
are recognizable. The reference-after ends on a genuine "it depends" and flags the
missing numbers rather than inventing a scenario.

**A regression here looks like:** "Ik hoop dat dit helpt!" survives; "In de wereld van
vandaag" / "speelt een cruciale rol" stays; the dash-as-pause is kept; a source or a
concrete before/after ("five tools", "a day a week") gets invented; register drifts
from je to u; or the close is still "Kortom, …".

---

## Case 2 — already-human casual post with modal particles, NO EDIT

**Setup:** "Kun je deze post wat natuurlijker maken? --general."

**Input:**
> Vorige week eindelijk de build naar de nieuwe tool overgezet, kostte me een halve
> dag. Exporteren ging prima, importeren was echt traag hoor — ruim 200 repo's deden er
> bijna drie uur over. Had ik allang moeten doen, maar ja, het schiet er altijd bij in.
> Eén runner blijft hangen en ik snap even niet waarom.

**Expected decisions:**
- Modal particles carrying tone ("echt traag **hoor**", "maar **ja**", "ik snap
  **even** niet waarom") — `nl.md`: their near-absence is a plausible AI tell, so their
  *presence* is a human signal. Preserve.
- Diminutive-free but genuinely casual; concrete detail (vorige week, halve dag, 200
  repo's, drie uur); a self-aware aside ("het schiet er altijd bij in"); an open
  question at the end; real sentence-length variation.
- je-vorm implied and consistent (no u).
- One " — " between short clauses in a casual post; `nl.md`'s dash claim is explicitly
  low-confidence, and here it's a single casual instance, not a repeated dramatic
  pause. Leave it, or at most a comma.
- No time-framing, no significance inflation, no "gamechanger", no vague attribution,
  no "Kortom" close, no chatbot residue.
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> Afgelopen week heb ik de migratie van de build naar de nieuwe tool afgerond, wat mij
> een halve dag heeft gekost. Het exporteren verliep vlekkeloos, terwijl het
> importeren aanzienlijk trager was: ruim 200 repository's namen bijna drie uur in
> beslag. Dit had eerder moeten gebeuren; uitstelgedrag is nu eenmaal hardnekkig. Eén
> runner blijft vastlopen en de oorzaak is vooralsnog onduidelijk.

**Blind forced-choice answer key:** a judge picks the **over-edited version** — "heb ik
de migratie … afgerond", "verliep vlekkeloos", "aanzienlijk trager", "namen … in
beslag", "uitstelgedrag is nu eenmaal hardnekkig", "de oorzaak is vooralsnog
onduidelijk", plus an injected semicolon, strip every modal particle and flatten a
casual post into a report. The input is real.

**A regression here looks like:** the skill rewrites at all; "hoor" / "maar ja" /
"even" are removed; "overgezet, kostte me een halve dag" becomes "de migratie …
afgerond, wat mij een halve dag heeft gekost"; "het schiet er altijd bij in" becomes
"uitstelgedrag is hardnekkig"; or a semicolon appears.
