# Language: French (fr)

Pairs with `references/core-rules.md` and `references/structural-pass.md`. Synthesized
from two complementary sources in `similar-github-projects/by-language/fr/`: `malherbe`
(84 patterns across 8 rigorously engineered families, with a register matrix and a
written-counter gate) and `boileau` (a leaner, example-dense catalog grounded
specifically in francophone sources, not a translation of the English guide). Where
they overlap, both are cited; where `malherbe`'s engineering is deeper, it's the
primary source.

## The three non-negotiable commitments (from malherbe)

1. **Quality, not detector evasion.** Tics get removed because they hollow out the
   text, not to fool a detector. No anti-detection function, no deliberate errors, no
   promise of undetectability.
2. **Never invent.** No fabricated fact, number, anecdote, opinion, emotion, or source.
   Missing material → an explicit placeholder ("(à compléter par l'auteur : …)") or a
   question to the requester, never invented material passed off as real.
3. **Never degrade French typography.** Converting « » to straight quotes, ’ to ',
   non-breaking spaces to regular ones, or É to E is always a regression — normalize
   *toward* correct French typography, never away from it.

## The no-edit gate, French-specific version

Before rewriting: 0 patterns or 1–2 weak ones → say "already human — rewriting would
only degrade it" and stop. A text under roughly 40 words shouldn't be judged at all.
Heterogeneous style within one piece → treat only the suspect segments, not the whole.
This is the French source's own explicit version of the engine-wide no-edit gate in
`SKILL.md` — apply it with the same weight here.

## Three central French-specific biases (from boileau — read this first)

- **False elevated register**: French AI confuses "well-written" with "written in
  complicated words." It prefers *effectuer* to *faire*, *à l'aune de* to *selon*, the
  noun *problématique* to *problème*.
- **English calques**: trained mostly on English, it translates badly — *adresser un
  problème*, *faire du sens*, *délivrer de la valeur*.
- **Connectors in a downpour**: nearly every paragraph opens with *Par ailleurs*, *De
  plus*, *En outre*, *Néanmoins*, *Toutefois*, *Cependant*, *En effet*, *Ainsi*, *Par
  conséquent* — far more densely than English AI stacks its own transition words.

## Vocabulary

**High-frequency AI vocabulary**: crucial, essentiel, fondamental, incontournable,
majeur, central, stratégique, captivant, fascinant, transformateur, révolutionnaire,
disruptif, robuste, innovant, dynamique, vibrant, riche (figuré), profond, durable,
significatif.

**Anteposed "véritable"**: "un véritable défi," "une véritable opportunité," "une
véritable révolution" — nearly always deletable without loss.

**Passe-partout verbs**: permettre de, garantir, favoriser, optimiser, valoriser,
accompagner, répondre aux besoins/enjeux, mettre en place/en œuvre, s'inscrire dans —
abstract, report-sounding verbs where a concrete one usually exists.

**Adjective doublets**: "simple et intuitif," "robuste et fiable," "innovant et
performant" — French AI almost always pairs two near-synonymous adjectives; keep the
more precise one.

**Mismatched-register collage**: dropping colloquial idioms ("ça pique," "ça envoie,"
"plutôt cool") into an otherwise professional/analytical passage. This is the mirror
image of the false-elevated-register tell — a human picks one register and holds it;
a patchwork of both in one passage is itself the signal.

## Syntax and rhetorical structure

**Copula avoidance**: constitue, représente, incarne, se présente comme, s'affirme
comme, s'impose comme, fait figure de, demeure — restore "est"/"sont."

**Negative parallelism and mirror sentences** — the French AI signature construction,
in several forms: "Ce n'est pas X, c'est Y" / "Non seulement X, mais (aussi) Y" / the
staccato negation-then-affirmation ("Pas X, pas Y. Z.") / the redirection rhetoric
("Le vrai sujet n'est pas X, c'est Y"). State the point directly instead of defining it
by what it isn't.

**Anaphoric rhythm-marketing**: repeating the same opening formula across several
sentences or bullets for a manufactured "inspiring" effect ("Pour celles qui osent.
Pour celles qui inventent. Pour celles qui ne renoncent jamais.") — rare in real
conversation, reads immediately as advertising copy.

**False ranges**: "de X à Y, en passant par Z" encompassing things that aren't on one
real scale — name the actual, bounded list instead.

**Pseudo-journalistic nuance transitions**: "est moins X qu'on ne le pense," "cache une
réalité plus nuancée," "en apparence X, mais en réalité Y" — announces a nuance
instead of just stating it directly.

**Didactic posture**: "Ce qu'il faut comprendre, c'est que," "Il faut savoir que,"
"N'oublions pas que" — condescending between adults; present the information and let
the reader draw the conclusion.

**Self-congratulatory closers**: "et c'est précisément le but," "voilà toute la
question," "c'est exactement ce que" — closes an idea by applauding having made it,
adding nothing. State the point and move on.

## Content

**Significance/heritage inflation**: "marque un tournant," "moment charnière,"
"témoigne de," "s'inscrit dans une dynamique de," "à l'aube de," "dans un monde en
perpétuelle mutation."

**Vague sourcing**: "selon les experts," "les analystes s'accordent," "plusieurs
sources indiquent" with nothing named — name the real source or drop the claim.

**"Challenges and outlook" template sections**: "Défis et perspectives," "Enjeux et
avenir" as a reflexive closing structure with no real content.

**Tourist-brochure promotional register**: "nichée au cœur de," "écrin de verdure,"
"joyau," "véritable havre," "à couper le souffle" — replace with specific, checkable
description.

## Typography — French has its own distinct failure list

**Wrong quotation-mark family**: straight ASCII `"..."`, curly English `"..."`
(U+201C/D, a strong tell of copy-paste from a conversational AI), instead of French
« ... » with non-breaking spaces inside.

**Missing non-breaking space** before `:`, `;`, `?`, `!` — French punctuation requires
one; its absence is a mechanical, always-worth-fixing error, not a cluster-only tell.

**The Oxford-comma calque**: a comma before "et" in an enumeration ("le code, et les
tests") — not standard French; drop it.

**Accent problems — three distinct failure modes, all common in AI-generated French**:
missing accents on capital letters (French *does* accentuate capitals per the Académie
française — "Etat" should be "État," "Apres" should be "Après"); confusion on common
accented words (où/ou, à/a, là/la, ça/ca, dû/du, sûr/sur); and — the worst tell of the
three — **inconsistency within one text**, accents present in one paragraph and absent
in the next. A human is consistent one way or the other; drift within a single piece
is a mechanical AI signature.

## Long documents (malherbe's `--chapitre` behavior — apply the same discipline)

Above roughly 1,500 words, or wherever the text has titled parts: freeze structure
(headings, section order, stated plan, transitions, partial conclusions) as untouchable
author/convention choices; process section by section rather than as one block; check
globally only what can't be checked locally — one term should have exactly one form
throughout the whole document, first-person register should stay consistent.

### Opener rotation and pre-flight carve-out

Conjunction openers: Et, Mais, Donc, Ou, Car, Pourtant. "On" preferred over
"Nous" as pronominal opener in modern prose. Never open by announcing the plan
("Dans un premier temps" as a label, not a transition). Pre-flight carve-out:
none confirmed — universal pre-flight applies; native review may add one.

## Register matrix

| Family | Académique | Professionnel | LinkedIn | Casual |
|---|---|---|---|---|
| Vague attribution (no source) | Becomes a TODO, never silently rewritten | Fix | Fix | Fix |
| Connector density | High tolerance — connectors are conventional here | Fix on stacking | Fix on stacking | Fix on stacking |
| Register/voice injection | None — impersonal and epistemic hedging are correct | Restrained | The bold-label/emoji format is legitimate here — the *emptiness* behind it is the actual tic | Preserve the author's own orality |
| Triads | Tolerate isolated instances | Fix on clustering | Fix on clustering | Fix on clustering |

## What NOT to flag

A single loose connector; a single dash (rare enough in French that even one is worth
a second look, but not automatically a fix); correct, complex formatting from a visual
template; unsourced claims alone (most of the web has none); unimpeachable grammar
alone.

## Worked example

**Before:**
> Nichée au cœur de la vallée, cette ville incontournable est un véritable joyau au
> riche patrimoine, offrant un dépaysement à couper le souffle. Non seulement elle
> séduit les visiteurs, mais elle s'impose également comme une référence culturelle
> majeure.

**After:**
> [Nom de la ville], dans la vallée de [rivière]. [Ce qu'il y a concrètement à voir :
> le brouillon ne le dit pas.]
> *(À compléter par l'auteur : la population, les monuments, les dates. Le brouillon
> n'en donne aucun ; rien n'a été inventé ici pour rendre le texte « concret ».)*

**Changes:** tourist-brochure promotional language, the anteposed "véritable," the
negative-parallelism pair ("non seulement… mais également…"), and the copula avoidance
("s'impose comme") were all removed. The draft holds no verifiable fact to rewrite
*toward*, so the output is the inflation stripped plus placeholders — a population
figure, a church, a classification date would all be inventions, which the second
non-negotiable commitment ("never invent") forbids.

## Sources

`similar-github-projects/by-language/fr/humanizer-fr-1` (`alxbd/boileau`) — the
francophone-sourced catalog (not translated from English) this file's typography and
register-bias sections draw on most directly; `humanizer-fr-3`
(`L4inLov3r/malherbe`) — 84 patterns across 8 families, the register matrix, the
`--chapitre` long-document discipline, and the written-counter final gate. A third
repo, `humanizer-fr-2`, exists in the same folder for further cross-checking.
