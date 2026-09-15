# fr-general — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Any
> change-magnitude percentage below is a rough eyeball estimate, not measured (no scanner).


`--general`, French. `fr.md`: never invent (placeholder instead), never degrade French
typography, and the French-specific no-edit gate. Central biases: false elevated
register, English calques, connector downpour.

---

## Case 1 — connector-heavy explanatory paragraph, edit warranted

**Setup:** "Rends ce texte moins chatbot, --general." Register: professionnel/blog.

**Input:**
> Dans un monde en perpétuelle mutation, le télétravail constitue un véritable tournant
> pour les entreprises. Par ailleurs, il permet non seulement de réduire les coûts,
> mais également de transformer la culture d'entreprise. En effet, selon les experts,
> cette dynamique est irréversible, garantissant ainsi une meilleure satisfaction des
> collaborateurs. Ce qu'il faut comprendre, c'est que l'avenir du travail sera flexible.

**Expected decisions:**
- "Dans un monde en perpétuelle mutation" — significance/heritage inflation, `fr.md`.
- "constitue un véritable tournant" — copula avoidance ("constitue") + anteposed
  "véritable" + "marque un tournant" inflation, `fr.md`. Restore "est", delete
  "véritable".
- "Par ailleurs… En effet…" opening consecutive sentences — connector downpour,
  `fr.md` (the French AI signature; denser than English). Cut most.
- "non seulement… mais également…" — negative parallelism / mirror sentence, `fr.md`.
  State directly.
- "selon les experts" — vague sourcing, `fr.md`. Name the source or drop the claim.
- "garantissant ainsi" — passe-partout verb ("garantir") + the consequence-gerund
  shape, `fr.md`. Period + new sentence.
- "Ce qu'il faut comprendre, c'est que" — didactic posture, `fr.md`. Condescending;
  state the information.
- "l'avenir du travail sera flexible" — stated thesis, `structural-pass.md` check 1.
- Typography: keep any « » and non-breaking spaces; do not introduce straight quotes.
- Fact-lock: no expert/source named → placeholder "(à compléter par l'auteur : source)"
  or drop; never invent.
- Change magnitude: ~60%. No-edit gate: passed (0 patterns it is not).

**Reference "after":**
> Le télétravail a changé la façon dont les équipes se coordonnent : plus d'écrit,
> moins de réunions, et cette bataille permanente pour trouver deux heures où tout le
> monde est disponible. Est-ce que ça se traduit par un gain de productivité ? Ça
> dépend beaucoup de l'équipe et du type de travail.
> *(« selon les experts » a été retiré — aucune source n'était citée, et on n'en
> invente pas ; à compléter par l'auteur si l'affirmation doit rester.)*

**Blind forced-choice answer key:** a judge picks the **Input** — "Dans un monde en
perpétuelle mutation", "un véritable tournant", "Par ailleurs… En effet…",
"non seulement… mais également…", "selon les experts", "Ce qu'il faut comprendre, c'est
que" is a stack of the French AI signatures. The reference-after ends on "Ça dépend",
which reads human.

**A regression here looks like:** « » or a non-breaking space gets converted to a
straight ASCII equivalent (an automatic regression per `fr.md`); "constitue" survives;
"non seulement… mais…" stays; a source gets invented; or every paragraph still opens
with a connector.

---

## Case 2 — already-human blog paragraph, NO EDIT

**Setup:** "Tu peux humaniser ce paragraphe ? --general."

**Input:**
> J'ai fait le potager en avril, en retard, parce qu'en mars j'étais en plein
> déménagement. Les tomates ont été rachitiques et les blettes sont montées en graine
> en trois semaines. L'an prochain je m'y prends plus tôt, ou je laisse tomber. Je ne
> comprends toujours pas pourquoi le romarin a séché alors qu'il était à côté de
> l'autre qui va très bien.

**Expected decisions:**
- `fr.md` no-edit gate: 0 tell patterns, real sentence-length variation, an unresolved
  observation, concrete detail (avril, mars, trois semaines). "already human —
  rewriting would only degrade it."
- No connector downpour, no copula avoidance, no calque, no inflation.
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> J'ai effectué la mise en place du potager au mois d'avril, avec un certain retard,
> dans la mesure où le mois de mars a été consacré à mon déménagement. Les plants de
> tomates se sont révélés peu vigoureux et les blettes sont montées en graine de
> manière prématurée, en l'espace de trois semaines seulement. L'année prochaine,
> j'anticiperai davantage. Je m'interroge encore sur les raisons pour lesquelles le
> romarin a dépéri, bien qu'il fût situé à proximité d'un autre pied en parfaite santé.

**Blind forced-choice answer key:** a judge picks the **over-edited version** —
"j'ai effectué la mise en place", "dans la mesure où", "se sont révélés peu vigoureux",
"de manière prématurée", "j'anticiperai davantage", "bien qu'il fût situé à proximité"
is exactly the false-elevated-register bias (effectuer > faire, complex words for
"well-written"). The input is a real person.

**A regression here looks like:** the skill rewrites at all; "j'ai fait" becomes
"j'ai effectué la mise en place"; "rachitiques" becomes "peu vigoureux"; or
"ou je laisse tomber" (the real resigned aside) gets cut.
