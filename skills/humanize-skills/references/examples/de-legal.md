# de-legal — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Non-English:
> needs a native-speaker check.

`--legal`, German. The crossing: `de.md`'s **Formal** mode already says leave
participle-tails and accept copula-avoidance (field-conventional in juristic German);
`legal.md` governs the rest — modal verbs are not synonyms, defined terms are frozen,
symmetry and scope are substance, a compliance claim is described not asserted.

---

## Case 1 — AI German policy/clause text, edit warranted

**Setup:** "Formuliere diese Datenschutz-Passage professioneller, --legal."

**Input:**
> Wir nehmen den Schutz Ihrer Daten außerordentlich ernst und gewährleisten
> vollständige Sicherheit — Ihre Informationen sind bei uns absolut sicher. Wir sind
> vollständig DSGVO-konform. Der Auftragnehmer soll die Daten ausschließlich
> weisungsgemäß verarbeiten, und beide Parteien stellen einander von sämtlichen
> Ansprüchen frei. Personenbezogene Daten können an vertrauenswürdige Partner
> weitergegeben werden, um Ihr Erlebnis zu verbessern.

**Expected decisions:**
- "nehmen … außerordentlich ernst", "um Ihr Erlebnis zu verbessern" — marketing colour
  in a document that carries obligations, `legal.md` (register: no emphasis, no
  persuasion). The request for "professioneller" is capped at precise, not elevated.
- "gewährleisten vollständige Sicherheit", "absolut sicher" — unsupported absolute
  claims = assumed liability, `legal.md`. Soften to what's true ("angemessene
  technische und organisatorische Maßnahmen").
- "Wir sind vollständig DSGVO-konform" — a compliance claim asserted, not described,
  `legal.md`. State what was actually done.
- **"Der Auftragnehmer soll … verarbeiten"** — modal-verb error, `legal.md`. A
  processor's obligation is "hat … zu" / "muss" (or "darf … nur"), not "soll"
  (recommendation). `de.md` does **not** authorize varying this for style.
- "beide Parteien stellen einander … frei" — a mutual indemnity where a one-directional
  one is standard for a processor relationship; `legal.md` symmetry-is-substance.
  Flag it; do not silently make it mutual — and here it's likely the *drafting* error
  (a processor indemnifies the controller, not vice versa), so flag for a lawyer.
- "an vertrauenswürdige Partner … um Ihr Erlebnis zu verbessern" — vague recipient
  category + vague purpose, `legal.md`. Flag: needs the actual categories of recipient,
  the actual purposes, and the legal basis — none are in the source.
- `de.md` Formal-mode note: participle-tail constructions and "verfügt über"-style
  copula avoidance are **not** flagged here (field-conventional). Don't "fix" them.
- Fact-lock (`legal.md`): never invent a recipient category, a retention period, an
  Art. number, or a legal basis. Placeholders only.
- Change magnitude: ~55% (eyeballed). No-edit gate: passed.

**Reference "after":**
> Wir verarbeiten personenbezogene Daten, um den Dienst bereitzustellen und unsere
> gesetzlichen Pflichten zu erfüllen. Wir treffen dem Risiko angemessene technische und
> organisatorische Sicherheitsmaßnahmen; kein Verfahren der Speicherung oder
> Übertragung ist vollständig sicher. Der Auftragnehmer hat die personenbezogenen Daten
> ausschließlich auf dokumentierte Weisung des Verantwortlichen zu verarbeiten. Eine
> Weitergabe an Auftragsverarbeiter erfolgt nur [Kategorien — zu ergänzen] zu
> [Zwecken — zu ergänzen] auf Grundlage eines Auftragsverarbeitungsvertrags.
> *(Geflaggt: „DSGVO-konform" durch eine Beschreibung der Praxis ersetzt; die
> wechselseitige Freistellungsklausel prüfen lassen — bei einer Auftragsverarbeitung
> ist sie üblicherweise einseitig; Empfängerkategorien, Zwecke und Rechtsgrundlage
> fehlen und müssen ergänzt werden.)*

**Blind forced-choice answer key:** a judge picks the **Input** — "außerordentlich
ernst", "gewährleisten vollständige Sicherheit — … absolut sicher", "vollständig
DSGVO-konform", "vertrauenswürdige Partner … um Ihr Erlebnis zu verbessern" are the
AI-marketing-in-a-legal-document tells, plus the "soll" modal error. The reference-after
is precise, uses "hat … zu", and flags every gap.

**A regression here looks like:** "soll" survives, or "muss"/"hat … zu" gets varied to
"soll"/"wird" for style; the mutual indemnity is silently kept or a one-way one is
silently substituted (either without a flag); "DSGVO-konform" is kept as an assertion;
an absolute security promise survives; recipient categories / a legal basis get
invented; or a genuine field-conventional participle construction elsewhere gets
"fixed" (`de.md` Formal-mode over-correction).

---

## Case 2 — correct German legal clause, NO EDIT

**Setup:** "Mach diese Klausel eleganter, --legal."

**Input:**
> Der Auftragnehmer hat den Verantwortlichen unverzüglich zu informieren, wenn er der
> Auffassung ist, dass eine Weisung gegen datenschutzrechtliche Vorschriften verstößt.
> Der Begriff „Weisung" im Sinne dieser Vereinbarung umfasst auch nachträgliche
> Änderungen und Ergänzungen in Textform.

**Expected decisions:**
- "hat … zu informieren" — correct legal obligation construction, `legal.md`. Do not
  vary to "soll" / "wird" / "informiert".
- "unverzüglich" — a legal term of art (≈ "without undue delay"), frozen; not a filler
  intensifier to cut, `legal.md`.
- „Weisung" in Anführungszeichen with an explicit definition ("im Sinne dieser
  Vereinbarung umfasst auch …") — a **defined term**, `legal.md`. Never "simplify" the
  definition away or paraphrase the defined word.
- Formal register, no marketing, no absolute claim, no vague recipient. `de.md` Formal
  mode: nothing to loosen.
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> Der Auftragnehmer wird den Verantwortlichen zeitnah benachrichtigen, falls eine
> Anweisung seiner Meinung nach nicht ganz den Datenschutzregeln entspricht. Anweisungen
> können dabei auch später noch angepasst werden.

**Blind forced-choice answer key:** a judge picks the **over-edited version** as the one
that damaged the text — "hat … zu informieren" → "wird … benachrichtigen" (obligation
downgraded to future statement); "unverzüglich" → "zeitnah" (the term of art lost);
"verstößt" → "nicht ganz … entspricht" (softened breach language); and the defined term
„Weisung" was renamed to "Anweisung" and its definition dropped. Every one is a
`legal.md` failure. The input is a correct clause.

**A regression here looks like:** "hat … zu" becomes "soll"/"wird"; "unverzüglich" gets
replaced with a vaguer synonym; the „Weisung" definition is cut or the term is renamed;
or the breach-notification trigger gets softened.
