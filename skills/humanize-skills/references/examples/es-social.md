# es-social — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Non-English:
> needs a native-speaker check.

`--social`, Spanish. The crossing: `es.md`'s two measured killers are the
colon-elaboration habit (≤3–4 per whole text) and negative parallelism ("No solo
X, sino Y" — the single most recognizable Spanish-AI tic); `social.md` adds the
humblebrag arc as an automatic rewrite trigger plus engagement-bait and emoji
discipline. Resolution: cut the arc and the bait first, then the catalog tells —
and the honest-ask boundary in Case 2 is deliberate (a genuine tied question is
prescribed, padding is cut).

---

## Case 1 — AI humblebrag post, edit warranted

**Setup:** "Mejora este post para LinkedIn, --social --lang=es."

**Input:**
> Hace un año no me leía nadie. Hoy mi newsletter tiene miles de suscriptores. No
> se trata solo de escribir bien, se trata de construir un movimiento: publico cada
> semana, aportando valor y generando una comunidad que no para de crecer. ¿Te pasa
> que publicas y nadie reacciona? Yo pasé por eso. El secreto: constancia y
> autenticidad. 💪💪💪 Comenta INFO y te mando mi guía gratis.

**Expected decisions:**
- Humblebrag arc (zero→miles one-line stack) — `social.md` automatic trigger.
- "No se trata solo de X, se trata de Y" — `es.md` negative parallelism. State
  the point directly.
- Colon elaborations ×2 ("un movimiento:", "El secreto:") plus the arc — `es.md`
  colon habit (budget is per whole text; at this density, with the arc, it trips).
- Consequence gerunds ("aportando valor," "generando una comunidad") — `es.md`;
  period plus new sentence.
- Rhetorical padding ("¿Te pasa que…?") + engagement bait ("Comenta INFO…") —
  `social.md`; cut the bait, no honest ask survives here because no content was
  offered to ask about.
- Emoji stack 💪💪💪 — `social.md`; at most one closing emoji, here zero since
  the tone no longer performs energy it didn't earn.
- "miles de suscriptores" + "guía gratis" with no content described — first-person
  claims the skill cannot verify: keep the checkable facts (weekly, self-written),
  flag the rest (`social.md` first-person fact-lock — inventing a life detail is a
  lie about the poster, not ordinary filler).
- Burstiness: break the one-line stack into uneven lengths (`es.md` 13–16-word
  mean target, real 3–5-word sentences pulling wide).
- Change magnitude: ~70% (eyeballed). No-edit gate: passed.

**Reference "after":**
> Escribo una newsletter semanal. La escribo yo, sin equipo.
> Empezó de cero.
>
> *(Faltan datos: el borrador afirma "miles de suscriptores" sin cifra ni fuente, y
> ofrece una "guía gratis" sin decir de qué trata — ambas cosas necesitan tus cifras
> y tu contenido real; no los invento aquí.)*

**Blind forced-choice answer key:** a judge picks the **Input** — the arc, the
"no se trata solo de," the colon-plus-gerund scaffolding, and the INFO-bait are
textbook AI-influencer Spanish. The after leads with the hook, keeps only
checkable facts, and flags the gaps instead of performing success.

**A regression here looks like:** the arc survives ("hace un año… hoy…"); "no se
trata solo de" stays; a subscriber number or guide content gets invented; the
bait is kept because "the client asked for a CTA" (offer an honest ask or cut —
`social.md`); or three emojis survive.

---

## Case 2 — correct Spanish social post, NO EDIT

**Setup:** "¿Puedes humanizar esto? --social."

**Input:**
> Llevo tres años con el mismo portátil. Ayer se apagó solo dos veces.
> Eso sí: cuando funciona, tira con todo. No lo cambio hasta que muera del todo.
> ¿Alguien más alargando hardware hasta lo absurdo?

**Expected decisions:**
- Short uneven sentences, stated opinion, unresolved ending — `social.md` voice
  (personal beats balanced-neutral here).
- "Eso sí" — natural discourse marker, explicitly allowed in `es.md` cercano
  register. Not a tell.
- Final question is a genuine tied ask about the actual content (`social.md`
  honest-ask prescription), not engagement padding — padding announces wanting
  engagement ("¿Te suena?", "¿Te pasa?"); this one continues the post's thought.
- Tuteo consistent, ¿? opening marks present, no colon elaboration, no gerund,
  no parallelism, no bait, no emoji (none needed).
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> En el competitivo mundo actual de la tecnología, mi portátil de tres años se
> erige como un ejemplo de durabilidad: se apagó dos veces ayer, demostrando la
> importancia de alargar la vida útil del hardware, garantizando así un consumo
> responsable. No se trata solo de un ordenador, se trata de una filosofía.
> ¡Comenta si tú también cuidas el planeta! 🌍💪

**Blind forced-choice answer key:** a judge picks the **over-edited version** —
corporate opener, "se erige como," colon elaboration, "-ing"-tail calque
("demostrando"), consequence gerund ("garantizando"), negative parallelism, and
bait plus emoji stack. It applied every general-mode tell to a post that had
none, and flattened a voice into corporate copy.

**A regression here looks like:** "Eso sí" flagged as filler; the final question
cut as "padding" without distinguishing honest-ask from bait; tuteo "corrected"
toward usted; or any edit at all — the gate must hold.
