# es-general — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Any
> change-magnitude percentage below is a rough eyeball estimate, not measured (no scanner).


`--general`, Spanish. Highest-impact levers per `es.md`: the colon habit
(`Afirmación: elaboración`) and burstiness. Then vocabulary.

---

## Case 1 — colon-heavy explanatory paragraph, edit warranted

**Setup:** "Haz que esto suene menos a IA, --general." Register: cercano/blog.

**Input:**
> En el panorama actual del trabajo remoto, hay una realidad que conviene subrayar: los
> equipos distribuidos no solo reducen costes, sino que también transforman la cultura
> de la empresa. El reto es doble: por un lado, la comunicación asíncrona; por otro, la
> confianza. Cabe señalar que numerosos estudios apuntan en la misma dirección,
> garantizando así una mayor satisfacción de los empleados. En resumen, el futuro del
> trabajo es flexible.

**Expected decisions:**
- Three `claim: elaboration` colons ("subrayar:", "doble:", plus the semicolon-split
  enumeration) — `es.md`, the single highest-impact fix. Break into running prose of
  uneven length; target ≤3–4 colons in a whole text.
- "el panorama actual" — banned AI vocabulary, `es.md`.
- "subrayar" — banned (recalcar/poner de relieve family), `es.md`.
- "no solo X, sino que también Y" — negative parallelism, the most recognizable
  Spanish-AI tic, `es.md`. State Y directly.
- "El reto es doble: por un lado… por otro…" — symmetric enumeration, `es.md`
  burstiness. Break it.
- "Cabe señalar que" — reflexive impersonal filler, `es.md`.
- "numerosos estudios apuntan en la misma dirección" — vague sourcing, `es.md` +
  `core-rules.md` §1.2. Name a study or cut.
- "garantizando así" — the consequence gerund (gerundio de consecuencia), `es.md`.
  Period + new sentence.
- "En resumen, el futuro del trabajo es flexible" — reflexive closer + stated thesis,
  `es.md` + `structural-pass.md` check 1.
- Fact-lock: no study is named in the source → flag, don't invent one.
- Change magnitude: ~60%. No-edit gate: passed.

**Reference "after":**
> El trabajo en remoto cambió cómo se coordinan los equipos: más cosas por escrito,
> menos reuniones, y la pelea constante por encontrar dos horas en las que todo el
> mundo esté conectado. Si eso sale a cuenta en productividad depende bastante del
> equipo. La comunicación asíncrona cuesta al principio; la confianza cuesta más.
> *(La frase "numerosos estudios apuntan en la misma dirección" se quitó: no había
> ningún estudio citado y no se inventa uno.)*

**Blind forced-choice answer key:** a judge picks the **Input** — the "conviene
subrayar:", "no solo… sino que también…", "El reto es doble:", "Cabe señalar que" and
"En resumen" are textbook Spanish-AI. The reference-after has real short/long variation
and an unresolved point.

**A regression here looks like:** more than 3–4 colons survive across the text;
"no solo… sino…" stays; a study name gets invented; or the rhythm comes back uniform
(every sentence 20–25 words).

---

## Case 2 — already-human blog paragraph, NO EDIT

**Setup:** "¿Puedes humanizar este párrafo? --general."

**Input:**
> Monté el huerto en abril, tarde, porque en marzo estuve con la mudanza. Los tomates
> salieron canijos y las acelgas se fueron a flor en tres semanas. El año que viene lo
> hago antes, o no lo hago. Sigo sin saber por qué el romero se secó estando al lado
> del que va bien.

**Expected decisions:**
- Concrete, hard-to-invent detail (abril, marzo, la mudanza, tres semanas). Genuinely
  unresolved observation at the end ("Sigo sin saber por qué…"). Uneven sentence
  length. Colloquial "canijos", "se fueron a flor". `es.md` human-writing signals.
- Colon count: 0. No negative parallelism, no banned vocab, no consequence gerund.
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> Establecí el huerto en abril, con cierto retraso, dado que en marzo me encontraba
> inmerso en el proceso de mudanza. Los tomates resultaron de escaso tamaño y las
> acelgas florecieron prematuramente, en apenas tres semanas. El próximo año lo
> abordaré con mayor antelación. Aún desconozco las razones por las que el romero se
> secó, pese a estar situado junto a otro ejemplar en buen estado.

**Blind forced-choice answer key:** a judge picks the **over-edited version** —
"Establecí", "me encontraba inmerso en el proceso de mudanza", "resultaron de escaso
tamaño", "florecieron prematuramente", "lo abordaré con mayor antelación" is the
false-elevated-register tell. The input reads as a real person.

**A regression here looks like:** the skill rewrites at all; "monté" becomes
"establecí"; "canijos" becomes "de escaso tamaño"; or "o no lo hago" (the real,
slightly resigned aside) gets cut.
