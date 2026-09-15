# pt-general — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Non-English:
> needs a native-speaker check. `pt.md` itself is built on one source repo, not yet
> cross-checked against a second.

`--general`, Portuguese (Brazilian). `pt.md`: **absolute punctuation bans** — no dash
"—" ever, no semicolons, colons only in formal lists/quotes. The mental-authenticity
test: swap the topic — does the sentence still work unchanged? Then it's too generic.

---

## Case 1 — press-release-style paragraph, edit warranted

**Setup:** "Reescreve isso pra não parecer feito por IA, --general."

**Input:**
> No cenário atual, a transformação digital representa um marco fundamental para
> qualquer empresa — não se trata apenas de tecnologia, trata-se de cultura. Nossa
> plataforma inovadora e robusta possui recursos que se destacam no mercado,
> impulsionando a eficiência e reduzindo custos; além disso, entrega valor real.
> Segundo especialistas, essa é uma mudança de jogo, refletindo uma tendência mais
> ampla. O futuro parece promissor.

**Expected decisions:**
- "No cenário atual" — editorializing + metaphorical abstract noun ("cenário"), `pt.md`.
- "representa um marco fundamental" — artificial copula ("representa") + significance
  inflation ("marco fundamental"), `pt.md`. → "é".
- " — não se trata apenas de X, trata-se de Y" — the **banned dash** + negative
  parallelism, `pt.md`. Remove both.
- "inovadora e robusta" + "mudança de jogo" — banned promotional adjectives / corporate
  expressions, `pt.md`.
- "possui recursos que se destacam" — artificial copula ("possui" for "tem") + inflated
  verb ("destacar-se"), `pt.md`.
- "impulsionando … reduzindo … refletindo …" — conclusive gerund tails, `pt.md` (the
  Portuguese "-ing" padding tell, flagged as its own recurring problem). Direct verbs.
- "; além disso," — banned semicolon + a paragraph-internal connective, `pt.md`.
- "Segundo especialistas" — vague attribution, `pt.md`. Name a source or drop it.
- "O futuro parece promissor" — the exact generic conclusion `pt.md` names. Cut.
- Mental-authenticity test: nearly every sentence would survive a topic swap unchanged
  → too generic.
- Fact-lock: no numbers/sources → flag, don't invent.
- Change magnitude: ~70% (eyeballed). No-edit gate: passed.

**Reference "after":**
> Nossa plataforma junta num lugar só o que a operação hoje espalha entre planilha,
> WhatsApp e o sistema do caixa. Na prática, isso corta o retrabalho de digitar a mesma
> informação duas vezes. *(A frase "Segundo especialistas…" saiu: nenhuma fonte foi
> citada e não se inventa uma.)*

**Blind forced-choice answer key:** a judge picks the **Input** — "No cenário atual",
"representa um marco fundamental", the dash, "não se trata apenas de X, trata-se de Y",
"mudança de jogo", the gerund tails, and "O futuro parece promissor" are textbook AI
Portuguese. The reference-after is concrete and holds a plain register.

**A regression here looks like:** any "—" survives, or a semicolon, or an emphasis
colon; "representa"/"possui" stay; a gerund tail is kept; "Segundo especialistas" gets
a fabricated source; or the close is still "O futuro parece promissor" / "As
possibilidades são infinitas".

---

## Case 2 — already-human first-person reflection, NO EDIT

**Setup:** "Dá uma ajeitada nesse parágrafo pra ficar mais natural, --general."

**Input:**
> Migrei o build pra ferramenta nova semana passada, levou meia tarde. Exportar foi
> tranquilo, importar que demorou: mais de 200 repositórios rodando quase três horas.
> Devia ter feito antes, mas sempre empurra com a barriga. Só um runner que continua
> travando e eu ainda não sei por quê.

**Expected decisions:**
- Concrete detail (semana passada, meia tarde, mais de 200, quase três horas).
  Colloquial ("empurra com a barriga", "tranquilo"). A self-aware aside. An open
  question at the end. Real sentence-length variation.
- The one colon ("importar que demorou:") introduces an explanation in running prose —
  borderline, but it's a single instance in casual first-person text, not the
  "claim: elaboration" habit stacked. Leave it, or at most swap for a period; do not
  treat it as a tell to hunt.
- No dash, no semicolon, no banned adjective, no artificial copula, no gerund tail, no
  generic conclusion.
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> Na semana passada, realizei a migração do sistema de build para a nova ferramenta,
> um processo que levou cerca de meia tarde. A exportação transcorreu de forma
> tranquila, ao passo que a importação demandou mais tempo — cerca de 200 repositórios
> levaram aproximadamente três horas. Trata-se de algo que deveria ter sido feito
> antes; a procrastinação, no entanto, é um hábito comum. Resta ainda identificar o
> motivo pelo qual um dos runners continua travando.

**Blind forced-choice answer key:** a judge picks the **over-edited version** —
"realizei a migração", "transcorreu de forma tranquila", "ao passo que … demandou",
the injected em dash, the semicolon, "Trata-se de algo que…", "a procrastinação … é um
hábito comum" is nominalized press-release Portuguese with two banned punctuation
marks. The input is a real reflection.

**A regression here looks like:** the skill rewrites at all; an em dash or semicolon is
introduced; "Migrei … levou meia tarde" becomes "realizei a migração … um processo que
levou"; "empurra com a barriga" becomes "a procrastinação é um hábito comum"; or "não
sei por quê" becomes "resta identificar o motivo".
