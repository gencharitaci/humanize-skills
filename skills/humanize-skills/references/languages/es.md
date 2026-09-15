# Language: Spanish (es)

Pairs with `references/core-rules.md` and `references/structural-pass.md`. Synthesized
from two complementary sources in
`similar-github-projects/by-language/es/`: a stylometric-detector-focused pipeline
(`humanizer-es-1`, battle-tested against Compilatio/Turnitin/GPTZero) and a
prompt-only, judgment-based editor (`humanizer-es-3`) with the deepest Spanish-specific
tic bank of the two.

## The single highest-impact fix: the colon habit

Both sources independently converge on the same finding: AI Spanish overuses
`Afirmación: elaboración` — a claim followed by a colon and its explanation — far more
than any single vocabulary tell, and it's the strongest lever measured against a real
stylometric detector (colons per document dropped 24 → 12 → 3 across a documented
three-round campaign that took a flagged document from 50% to 13% AI on Compilatio).
Target no more than 3–4 colons in an entire body of text. Before: "El hallazgo apunta
al canal: hay herramientas que superan el 97%..." After: "El hallazgo no apunta tanto
a la tecnología. Apunta al canal. Ya hay herramientas que superan el 97%..."

## Burstiness — the second-highest-impact fix

Break every symmetric enumeration ("dos cosas:", "tres frentes:", "el patrón es
doble:") into running prose or separate short sentences of *uneven* length — never
keep three parallel clauses in a row. Measured targets that correlate with passing a
real detector: mean sentence length around 13–16 words (AI-typical text runs 20–25),
with real short sentences (3–5 words) pulling the distribution wide next to longer
ones. This is the Spanish-specific version of `core-rules.md` §0 (rhythm first) — apply
it before touching vocabulary.

## Vocabulary and grammar

**Overused AI vocabulary** (a cluster of these, not one instance, is the tell):
profundizar, adentrarse/sumergirse en, fomentar, impulsar, potenciar, optimizar,
maximizar, aprovechar el poder de, subrayar, recalcar, poner de relieve/manifiesto, el
panorama, el ámbito, el universo/reino de, un sinfín de, una miríada de, una amplia
gama de, robusto, sólido, holístico, sinérgico, disruptivo, vanguardista, en aras de,
de la mano de.

**Copula avoidance**: "se erige como," "constituye," "representa," "se posiciona
como," "cuenta con/ofrece" in place of a plain "es" or "tiene." Say "es" when that's
what's meant.

**Negative parallelism** — the single most recognizable Spanish-AI tic: "No solo X,
sino (también) Y" / "No se trata (solo) de X, sino de Y" / "Más que X, es Y." State Y
directly.

**Reflexive impersonal/passive filler**, distinct from English's passive-voice tell:
"se puede observar que," "cabe señalar que," "se hace necesario," "cabe preguntarse."
Rewrite in active voice when it clarifies who is doing what.

**The consequence gerund** ("gerundio de consecuencia") — a Spanish-specific calque
distinct from English's "-ing" tail: "…, logrando así…," "…, garantizando…," "…,
permitiendo…" tacked onto a sentence to fake a causal link. Almost always fixed with a
period and a new sentence, or "y así."

## Typography and formatting

**The long dash (raya)**: unlike English, the raya genuinely exists in Spanish for
asides and dialogue — that use is correct. The tell is using it the way English uses
the em dash, in place of a comma or period out of habit. Check each raya: keep it if
it's a legitimate aside or dialogue marker; replace it with a comma, period, colon, or
parentheses if it's substituting for ordinary punctuation.

**Curly quotes instead of Spanish quote hierarchy**: the correct order is «comillas
latinas» first, then "inglesas," then 'simples.' AI defaults to curly "inglesas" —
convert to «latinas» unless the target medium's own style says otherwise.

**Title Case in headings**: Spanish does not capitalize every heading word. Only the
first word and proper nouns get a capital.

**Opening punctuation**: ¿ and ¡ are mandatory at the start of questions and
exclamations — an AI draft that drops them (common when generated alongside English)
is a mechanical error worth fixing regardless of cluster.

## Spanish-specific patterns with no English equivalent

**Textbook-style apposition**: inserting an explanatory apposition after every proper
noun as if the reader needs it defined — "La paella, ese plato emblemático de nuestra
gastronomía, …", "Cervantes, insigne autor del Quijote, …" Cut the apposition; trust
the reader already knows.

**The 70/30 vocabulary rule** (a positive technique, not a ban): aim for roughly 70%
plain, common vocabulary and 30% precise/technical — avoid a uniformly "elevated-AI"
register throughout.

## What NOT to flag (false positives)

- Impeccable grammar and style alone — plenty of writers are professionals or edited.
- Mixed colloquial and formal register — often signals a specific field or a younger
  writer, not a chatbot.
- A single loose connector ("además," "no obstante," "por consiguiente") — only
  stacking is the tell.
- A single curly quote or a single raya — most software defaults to curly quotes; a
  raya alone is common editorial practice. Only count them alongside other clustered
  tells.
- Cultured or technical vocabulary used correctly — the banned list above targets
  specific reflexive words, not all elevated diction; don't flatten "ostensiblemente"
  or "idiosincrásico" just because they sound cultured.

## Human-writing signals to preserve

Concrete, hard-to-invent detail (a real address, an odd quote); genuinely unresolved
mixed feelings ("Creo que está bien, pero hay algo que me chirría y no sé explicar
qué"); dated slang or in-jokes tied to a specific year and subculture; a writer who can
explain why they made a specific cut or word choice; real variety in sentence length;
genuine parenthetical self-correction ("Quería poner 'casi' aquí, pero la verdad es que
era seguro.").

### Opener rotation and pre-flight carve-out

Conjunction openers: Y, Pero, O, Así que, Aunque, Sin embargo (sparingly — it
stacks fast). Never open with a consequence gerund — "Siendo…," "Habiendo…" in
opener position is the gerundio-de-consecuencia tell at its most visible.
Questions carry mandatory ¿ marks. Pre-flight carve-out: none confirmed —
universal pre-flight applies; native review may add one.

## Register table (register profiles from the source, adapted)

| Register | Tuteo/usted | Hedging tolerance | Voice injection | Colloquialism |
|---|---|---|---|---|
| Cercano (blog, redes, correo informal) | Tú, frases cortas | Low — commit to claims | Full — see modes/creative.md | Natural discourse markers ("eso sí," "al fin y al cabo," "vamos") |
| Corporativo (propuestas, comunicación empresa) | Usted or "nosotros," sober but human | Low | Restrained | None |
| Técnico (documentación, informes, fichas) | Neutral, no first person | Preserve calibrated hedges | **None — plain is the correct human voice here** | None |
| Comercial (venta) | Direct, persuasive | Low | Restrained, concrete | Real benefits and data, never invented superlatives |

## Worked example

**Before:**
> En el competitivo mundo actual de la restauración, La Tasca del Puerto se erige como
> un referente gastronómico que marca un antes y un después: no se trata solo de
> comer, se trata de vivir una experiencia única. Nuestra propuesta abarca desde tapas
> tradicionales hasta sofisticadas creaciones de autor, garantizando que cada comensal
> encuentre su plato ideal.

**After:**
> La Tasca del Puerto sirve tapas tradicionales. También algún plato de autor. Nada
> más por ahora.
> *(El borrador no da ubicación, tamaño, ni ningún dato concreto — habría que sacarlos
> de información real, no inventarlos.)*

**Changes:** the colon-elaboration habit and the negative parallelism ("no se trata
solo de… se trata de") were both removed at once; the copula avoidance ("se erige
como") was restored to a plain statement; the consequence gerund ("garantizando") was
cut; sentence length was broken up ("También algún plato de autor. Nada más por
ahora."). Only what the draft actually said (traditional tapas, author's dishes) was
kept — the address and table count would be inventions, so they're flagged instead.

## Sources

`similar-github-projects/by-language/es/humanizer-es-1` (`ljmor/my-humanizer-es-en`) —
the detector-validated colon/burstiness findings and measured targets; `humanizer-es-3`
(`vicentealvarezasencio/humanamente`) — the 33-pattern tic bank, the ALMA voice-
injection framework, and the register-profile system this file's register table is
adapted from. A third repo, `humanizer-es-2`, exists in the same folder for further
cross-checking.
