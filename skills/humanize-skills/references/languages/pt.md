# Language: Portuguese (pt)

Pairs with `references/core-rules.md` and `references/structural-pass.md`. Synthesized
from `similar-github-projects/by-language/pt/humanizer-br` (Brazilian Portuguese).
Tier-2, wave 2 — one source repo, not yet cross-checked against a second; treat as a
strong starting point rather than a finished catalog.

## The mental-authenticity test (worth adopting as a general technique)

Before approving any passage, the source asks three questions that generalize well
beyond Portuguese: (1) if you swapped the topic for something unrelated, would the
sentence still make sense with no structural change? If yes, it's too generic. (2)
Does the sentence sound like a press release, an event flyer, or a corporate LinkedIn
post? Rewrite with concrete facts and plain verbs. (3) Is there a leftover dash,
conclusive gerund, or vague adjective? Remove it.

## The absolute punctuation bans (stricter than most languages here)

- **The dash ("—") does not exist in this vocabulary. Never use it, even if
  explicitly requested.** Use a comma, a period, parentheses, or restructure instead.
- **No semicolons at all** — use separate sentences.
- **Colons only in formal lists or direct quotations**, never for emphasis.

## Banned vocabulary

**Vague, promotional adjectives**: abrangente, dinâmico, disruptivo, eficaz,
emocionante, envolvente, essencial, estratégico, fascinante, fundamental, imperativo,
inestimável, inovador, inspirador, multifacetado, renomado, revolucionário, robusto,
significativo, sinérgico, transformador, único, vibrante, vital, rico (figurado),
profundo (metafórico), extraordinário, notável, brilhante, espetacular. Replace with
concrete facts or numbers — don't say "significativo," say "aumento de 23%."

**Inflated and metaphorical verbs**: destacar, ressaltar, enfatizar, evidenciar,
incorporar, fomentar, cultivar, alinhar-se, moldar, refletir (surface analysis),
simbolizar, mergulhar (metaphorical), promover, exibir, sublinhar, navegar,
transcender, potencializar, revolucionar, aprofundar.

**Metaphorical abstract nouns**: cenário, panorama, paisagem (metaphorical),
tapeçaria, mosaico, marco, ponto focal, legado duradouro, testemunho, intricâncias,
sinergia, âmbito, esfera, domínio, horizonte.

**Corporate/promotional expressions**: insights valiosos, experiência imersiva,
presença ativa nas redes sociais, cobertura independente, mudança de jogo, estado da
arte (generic use), pensando fora da caixa, motor de crescimento.

## Grammatical structures to avoid

**Artificial copulas**: never replace "é/foi/tem" with "serve como," "atua como,"
"possui/apresenta/oferece" (when "tem" is enough), "destaca-se como," "desempenha um
papel vital." Prefer: é, são, foi, era, tem, tinha, ocorreu, aconteceu.

**Negative parallelism**: "Não apenas X, mas também Y," "Não se trata de X, trata-se de
Y," "Sem X, sem Y, apenas Z."

**The artificial rule of three**: three adjectives or three short repeated sentences in
a row — let a list length emerge from the content, not the pattern.

**False ranges**: "de X a Y" with no real logical scale ("do problema à solução"). "de
1990 a 2000" is a genuine range and is fine.

**Editorializing**: "é importante notar," "vale a pena mencionar," "nenhuma discussão
estaria completa sem," "neste artigo," "no cenário atual/era digital."

**Conclusive gerund tails** (the Portuguese-specific version of the English "-ing"
padding tell — flagged as its own recurring problem in the source): "refletindo a
conexão...," "melhorando a conveniência...," "destacando sua importância...,"
"contribuindo para o desenvolvimento..." Prefer direct sentences with an action verb.

## Formatting

No emoji in editorial or professional contexts. No mechanical bold. Maximum recommended
sentence length: 25 words, varied naturally. Never open a paragraph with a connective
("além disso," "contudo," "portanto") — and watch stuffing mid-sentence:
"adicionalmente," "notavelmente," "certamente," "consequentemente," "sem dúvida,"
"de forma fluida," "em última instância," "em suma." One connective per paragraph
is enough; three is the tell.

## Chatbot residue

Remove: "Espero que isso ajude," "Ótima pergunta," "Aqui está um resumo," "Se quiser
posso expandir," "Me avise se precisar de mais detalhes."

## Filler

"Com o objetivo de" → "Para." "Devido ao fato de" → "Porque." "Neste momento atual" →
"Agora." "Em caso de necessidade" → "Se necessário."

## Generic conclusions

Avoid closing with "O futuro parece promissor." Close instead with a concrete
observation, a practical implication, or a genuine reflection.

## Vague attributions

"especialistas dizem," "observadores afirmam," "alguns críticos sugerem," "fontes
indicam," "relatórios sugerem" — cite the specific source or rewrite without the
attribution. A named source ("segundo o IBGE") is evidence; a floating plural is
decoration.

## Specific phrases (never use)

"ponto de virada crucial," "panorama em evolução," "marca indelével,"
"profundamente enraizado," "aninhado em / no coração de," the predictable
contrast frame ("apesar de seus [méritos], enfrenta vários desafios"), and the
generic section title "Desafios e Perspectivas Futuras." Each has a concrete
replacement the draft already contains — use it.

## Elegant variation

Do not rotate synonyms for one referent just to look varied ("a plataforma," "a
solução," "a ferramenta" for the same product in three sentences). Repeat the
precise term — clarity beats variety.

## Voice — apply only when the genre calls for it

Removing AI patterns is only half the job; text without personality is equally
artificial. Where the genre allows it (opinion pieces, professional reflection, first-
person clinical or field observation): take a position instead of only describing;
vary rhythm (short sentences for impact, longer ones to develop an idea); acknowledge
real ambivalence; use first person where it fits ("Na prática...," "Na experiência
clínica...," "Eu observo com frequência..."); allow small, natural irregularities
rather than a too-perfect structure.

### Opener rotation and pre-flight carve-out

Conjunction openers: E, Mas, O, Portanto, Porém, Contudo. Brazilian gerund
openers are natural (do NOT flag); European-Portuguese gerund excess is a tell —
variant first, rule second, and never mix variants in one text. Pre-flight
carve-out: PT-BR gerund stacking is unscored (standing default in `SKILL.md`).

## Register table (adapted from the `es.md` shape + the `pt` cultural-matrix row)

| Register | Address | Hedging tolerance | Voice injection | Notes |
|---|---|---|---|---|
| Próximo (blog, redes, informal) | Você, "a gente" | Low — commit | Full, incl. light self-deprecation (reads human in BR, not unprofessional) | BR internet register is informal even on LinkedIn |
| Corporativo (propostas, empresa) | Você/Senhor(a) | Low | Restrained | Data with reference periods |
| Técnico (docs, relatórios) | Neutral, no first person | Preserve calibrated hedges | None — plain is the correct voice | Metrics with units, never superlatives |
| Comercial (venda) | Direct | Low | Restrained, concrete | Cut 40–60% of hype first; superlatives distrusted — concrete or cut |

## What NOT to flag

- Impeccable grammar alone; mixed colloquial/formal register (often a field or
  generational marker, not a chatbot).
- A single loose connective — only stacking (3+ per paragraph) is the tell.
- Brazilian gerund used naturally — the tell is excess in EU-PT, not use in BR.
- Cultured or technical vocabulary used correctly ("ostensivo," "idiossincrático"
  are words, not tells).
- Light self-deprecation in BR conversational prose — a human signal here,
  explicitly not unprofessionalism (see the `pt` cultural-matrix row).

## Worked example

**Before:**
> O evento é um marco importante que representa — sem dúvida — um testemunho do
> compromisso da empresa com a inovação disruptiva, destacando seu papel fundamental
> no cenário atual.

**After:**
> O evento [o borrador não diz o que aconteceu nele — programa, números,
> nomes: confirmar com a fonte real, não inventar].
> *(Removidos: travessão, "representa/testemunho," "marco importante/papel
> fundamental," "cenário atual," gerúndio conclusivo "destacando.")*

**Changes:** removed the dash (absolutely banned regardless of context), the copula
avoidance ("representa," "é um testemunho de"), the significance inflation ("marco
importante," "papel fundamental"), the metaphorical abstract noun ("cenário
atual"), and the conclusive gerund ("destacando"). The draft contains no checkable
fact to rewrite *toward* — an earlier version of this example invented "three
products developed over two years" to look concrete, which is exactly the
fact-lock violation; the correct output strips the inflation and flags the gap.

## Sources

`similar-github-projects/by-language/pt/humanizer-br` — a 2.0.0 skill grounded in
Wikipedia's "Signs of AI writing," Rafael Cardoso Sampaio's 2026 guidelines, and
general editorial practice; this file now draws on its full pattern bank (banned
vocabulary, copulas, parallelism, rule-of-three, false ranges, editorializing,
specific phrases, punctuation bans, residue, filler, generic conclusions) plus its
mental-authenticity test. The same repo ships a sibling `aprofundador` skill
(depth/positioning companion: diagnose shallow paragraphs, take positions, add
context-consequence layers) — consulted and only partially adopted here: its
diagnostic questions and positioning discipline transfer, but its additive layers
(interpretations, consequences, examples the source never stated) are rejected
under this engine's fact-lock — depth here means flagging gaps, never filling
them with plausible inventions. A second Portuguese repo to cross-check against
would still strengthen this file — see the roadmap's native-verification risk note.
