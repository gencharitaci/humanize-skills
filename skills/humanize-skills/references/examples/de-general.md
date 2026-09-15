# de-general — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Any
> change-magnitude percentage below is a rough eyeball estimate, not measured (no scanner).


`--general`, German. `de.md` mode gate → **Sachlich** (matter-of-fact) for a general
explanation. Count clusters, not single signals. The detector-mismatch lesson: don't
degrade accurate language to chase a perplexity score.

---

## Case 1 — Sachlich explanation with clustered tells, edit warranted

**Setup:** "Mach das weniger nach KI klingend, --general." Mode: Sachlich.

**Input:**
> In der heutigen schnelllebigen Zeit spielt Remote-Arbeit eine entscheidende Rolle für
> moderne Unternehmen. Sie fungiert als Treiber für Produktivität und stellt einen
> integralen Bestandteil der Arbeitswelt dar. Verteilte Teams senken nicht nur Kosten,
> sondern transformieren auch die Unternehmenskultur — sie schaffen Flexibilität,
> fördern Eigenverantwortung und stärken das Vertrauen. Branchenberichte zeigen, dass
> dieser Wandel unumkehrbar ist. Trotz einiger Herausforderungen bleibt der Ausblick
> vielversprechend.

**Expected decisions:**
- "In der heutigen schnelllebigen Zeit" — advertising/filler opener, `de.md`
  (HIGH: advertising language / editorial meta). Cut.
- "spielt eine entscheidende Rolle", "stellt einen integralen Bestandteil … dar" —
  symbolic inflation, `de.md` HIGH. State the concrete fact.
- "fungiert als Treiber", "stellt … dar" — copula avoidance, `de.md` MEDIUM. Cluster
  present (2+), so fix → "ist".
- "senken nicht nur Kosten, sondern transformieren auch" — negative parallelism,
  `de.md` MEDIUM. Not a factual correction, so fix.
- "schaffen Flexibilität, fördern Eigenverantwortung und stärken das Vertrauen" —
  rule-of-three; `de.md` says fix **only on repetition**. Here it's one triad — but it
  co-occurs with the negative-parallelism clause, and every item is content-free, so
  reduce it to what's actually being claimed rather than deleting mechanically.
- "Branchenberichte zeigen, dass" — vague authority, `de.md` HIGH. Supply a real source,
  cut the attribution, or mark `[ECHTE QUELLE NÖTIG]`. Never invent.
- "Trotz einiger Herausforderungen bleibt der Ausblick vielversprechend" — the
  praise→challenges→outlook template with no content, `de.md` MEDIUM (empty-content
  form). Name one real risk or cut.
- Fact-lock: no source, no numbers → flag, don't fill.
- Change magnitude: ~55%. No-edit gate: passed.

**Reference "after":**
> Remote-Arbeit hat verändert, wie Teams sich abstimmen: mehr schriftlich, weniger
> Meetings, dafür der ständige Aufwand, überlappende Arbeitszeiten über Zeitzonen
> hinweg zu planen. Ob das unterm Strich die Produktivität hebt, hängt stark vom Team
> und von der Art der Arbeit ab.
> *(„Branchenberichte zeigen…" wurde entfernt — es war keine Quelle genannt, und es
> wird keine erfunden. [ECHTE QUELLE NÖTIG], falls die Aussage bleiben soll.)*

**Blind forced-choice answer key:** a judge picks the **Input** — "In der heutigen
schnelllebigen Zeit", "spielt eine entscheidende Rolle", "fungiert als Treiber",
"nicht nur… sondern auch…", "Branchenberichte zeigen" and the "Trotz … bleibt der
Ausblick vielversprechend" close are a dense KI cluster. The reference-after ends on a
genuine "it depends", which reads human.

**A regression here looks like:** "fungiert als" survives (copula cluster missed); the
three-item list gets deleted wholesale instead of reduced to its real content (the
exact over-aggressive removal `de.md` warns about); a source gets invented for
"Branchenberichte zeigen"; or the outlook cliché is kept.

---

## Case 2 — correct plain Sachlich prose, NO EDIT

**Setup:** "Kannst du das natürlicher klingen lassen? --general."

**Input:**
> Wir haben letzte Woche das Build-System auf das neue Tool umgestellt. Der Export lief
> problemlos, der Import hat gedauert — gut drei Stunden für die 200 Repositories.
> Hätten wir früher machen sollen. Warum genau der eine Runner immer noch hängt, wissen
> wir noch nicht.

**Expected decisions:**
- One em dash, one triad-free structure, one short verbless-feel sentence ("Hätten wir
  früher machen sollen.") that is still a complete German sentence. Concrete detail
  (letzte Woche, drei Stunden, 200 Repositories). An open question at the end.
- `de.md` "count clusters, not single signals": a single dash, clean grammar, one
  informal sentence — none is a tell alone. `de.md` false-positive list covers exactly
  this.
- No-edit gate: **triggered.** Correct output is no change (the one dash is not a
  cluster; leave it).
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> In der vergangenen Woche haben wir erfolgreich die Migration unseres Build-Systems auf
> das neue Tool abgeschlossen. Während der Export reibungslos funktionierte, gestaltete
> sich der Import zeitaufwendiger und nahm für die 200 Repositories rund drei Stunden in
> Anspruch. Rückblickend wäre eine frühere Umstellung sinnvoll gewesen. Die Ursache für
> das anhaltende Problem mit einem der Runner ist derzeit noch Gegenstand der Analyse.

**Blind forced-choice answer key:** a judge picks the **over-edited version** —
"erfolgreich … abgeschlossen", "gestaltete sich zeitaufwendiger", "nahm … in Anspruch",
"Rückblickend wäre … sinnvoll gewesen", "Gegenstand der Analyse" is nominalized
KI-Sachlich. The input is a real status note.

**A regression here looks like:** the skill rewrites at all; the single dash is "fixed"
as if it were a cluster; "hat gedauert" becomes "gestaltete sich zeitaufwendiger"; or
the open question becomes "Gegenstand der Analyse".
