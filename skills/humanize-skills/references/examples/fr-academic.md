# fr-academic — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Non-English:
> needs a native-speaker check.

`--academic`, French. The crossing: `fr.md`'s **register matrix, Académique column**
overrides general-mode instincts — connectors are conventional here (high tolerance,
don't strip on density), voice injection is **none** (impersonal + epistemic hedging is
correct), and vague attribution "**becomes a TODO, never silently rewritten**".
`academic.md` adds claim↔evidence discipline on top.

---

## Case 1 — AI French academic paragraph, edit warranted

**Setup:** "Réécris ce paragraphe pour qu'il fasse moins IA, --academic." Register:
académique.

**Input:**
> Dans un monde en perpétuelle mutation, il est crucial de souligner que les réseaux de
> neurones sur graphes constituent un véritable tournant. Non seulement notre approche
> améliore les performances, mais elle démontre également sa supériorité sur les
> méthodes existantes. Selon les experts, ces résultats ouvrent la voie à de nombreuses
> recherches futures et témoignent de l'importance capitale de ce domaine.

**Expected decisions:**
- "Dans un monde en perpétuelle mutation" — significance/heritage inflation + empty
  time-framing, `fr.md`. Open with the actual gap.
- "il est crucial de souligner que" — didactic posture + "crucial" + "souligner"
  (banned verb), `fr.md`. Also `academic.md` boilerplate-emphasis ("il est crucial").
- "constituent un véritable tournant" — copula avoidance ("constituent") + anteposed
  "véritable" + "marque un tournant" inflation, `fr.md`. → "sont".
- "Non seulement … mais … également" — negative parallelism, `fr.md`. State directly.
- "démontre … sa supériorité" — over-claiming verb, `academic.md`. → "obtient de
  meilleurs résultats que" + scope to the actual benchmarks.
- **"Selon les experts"** — vague attribution. `fr.md` Académique matrix: this
  **becomes an explicit TODO — never silently rewritten away and never given an
  invented citation**. Mark "(référence à compléter par l'auteur)".
- "ouvrent la voie à de nombreuses recherches futures", "témoignent de l'importance
  capitale" — significance hype ("Défis et perspectives" energy), `fr.md` +
  `academic.md`. State the specific thing the work enables.
- **Connectors:** `fr.md` Académique matrix has **high tolerance** — do NOT strip a
  conventional "En effet" / "Par conséquent" here the way general mode would. Only a
  genuine downpour (every sentence opening with one) is touched.
- **Voice:** none. `fr.md` Académique: "impersonal and epistemic hedging are correct."
  No first person "je", no opinion, no rhetorical flourish.
- Typography: keep « », non-breaking spaces, accented capitals — never degrade.
- Fact-lock: no benchmark names / deltas → placeholder, don't invent.
- Change magnitude: ~55% (eyeballed). No-edit gate: passed.

**Reference "after":**
> Nous proposons, pour les réseaux de neurones sur graphes, une agrégation fondée sur
> l'attention qui repondère les contributions des voisins couche par couche. Sur [jeux
> de données à compléter], la méthode égale ou dépasse la meilleure ligne de base
> rapportée.
> *(À compléter par l'auteur : le problème que l'article traite réellement, les jeux de
> données, l'écart mesuré. Aucun de ces trois éléments n'a été inventé, motivation
> comprise. « Selon les experts » : référence à compléter, non inventée.)*

**Blind forced-choice answer key:** a judge picks the **Input** — "Dans un monde en
perpétuelle mutation", "il est crucial de souligner", "un véritable tournant",
"Non seulement … mais … également", "démontre sa supériorité", "Selon les experts",
"ouvrent la voie à … l'importance capitale" are stacked French-AI signatures. The
reference-after keeps only what the draft actually said, impersonally, and marks the
missing motivation and reference rather than reconstructing them.

**A regression here looks like:** "Selon les experts" gets silently deleted **or** given
a fabricated citation (instead of a TODO); a motivation or a result gets invented to
fill a gap; conventional academic connectors get stripped as if this were general mode
(`fr.md` matrix violation); "démontre" survives;
first person or a rhetorical flourish is injected; « » / non-breaking spaces get
converted to ASCII; or benchmark names get invented.

---

## Case 2 — correct French academic sentence, NO EDIT

**Setup:** "Rends cette phrase plus naturelle, --academic."

**Input:**
> En raison de la taille limitée de l'échantillon et de la largeur de l'intervalle de
> confiance, ces résultats suggèrent seulement que l'intervention pourrait être
> associée à une réduction des symptômes ; ils ne permettent pas d'établir de relation
> causale (voir tableau 2).

**Expected decisions:**
- Evidence-tied hedging ("suggèrent seulement", "pourrait être associée à", "ne
  permettent pas d'établir de relation causale") over a genuinely uncertain claim —
  `academic.md` + `fr.md` Académique preserve. Do not strengthen.
- Sample-size / confidence-interval scoping — the information a reader needs, `academic.md`.
- "(voir tableau 2)" — a table reference, preserved verbatim.
- "En raison de" opening — a conventional academic connective; `fr.md` Académique
  tolerates it. Not a tell here.
- The one " ; " (semicolon) is standard French academic punctuation joining two related
  independent clauses — not the English "; also / ; however" calque. Leave it.
- Impersonal throughout, no first person, no inflation, no banned vocabulary.
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> Je pense que ces résultats montrent clairement que l'intervention réduit les
> symptômes. L'échantillon était certes limité, mais l'effet est net et ouvre une piste
> prometteuse pour de futurs traitements.

**Blind forced-choice answer key:** a judge picks the **over-edited version** — it
injected first person ("Je pense que"), converted "suggèrent … pourrait être associée
à" → "montrent clairement que … réduit" (a fabricated overclaim), dropped the
confidence-interval caveat and the table reference, and added significance hype ("ouvre
une piste prometteuse"). Every one is an `academic.md` / `fr.md`-Académique violation.
The input is correct academic French.

**A regression here looks like:** any hedge is deleted or strengthened; first person is
introduced; the CI / sample-size caveat is cut; "(voir tableau 2)" is dropped; or the
conventional " ; " or "En raison de" is "fixed" as if it were an AI tell.
