# en-creative — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Any
> change-magnitude percentage below is a rough eyeball estimate, not measured (no scanner).


`--creative`. Widens the engine's job. Voice, irregularity, tonal risk, deliberate
imperfection are the value. The no-edit gate matters more here than almost anywhere.
Generic competence is itself the tell.

---

## Case 1 — generic "smooth competent" personal essay, edit warranted

**Setup:** "Humanize this personal essay opening, --creative."

**Input:**
> The summer I turned sixteen was a transformative experience that taught me the true
> meaning of resilience. As I navigated the challenges of that difficult season, I
> discovered a strength within myself I never knew existed. Looking back now, I realize
> that those hard months were exactly what I needed to become the person I am today.
> Sometimes, life's greatest gifts come disguised as its hardest trials.

**Expected decisions:**
- "transformative experience," "true meaning of resilience," "navigated the
  challenges," "a strength within myself I never knew existed" — generic imagery with
  no specific sensory or concrete detail, `creative.md` (still a tell here). Ask what
  actually happened that summer; flag the gap, don't invent it.
- "Looking back now, I realize..." + "Sometimes, life's greatest gifts come disguised
  as its hardest trials" — moral/theme stated explicitly, `creative.md` +
  `structural-pass.md` check 1. This is a reliable AI-narrative tell.
- Tidy, uniform emotional arc, no loose thread — `creative.md`.
- Reads competently but says nothing distinctive — `creative.md` ("that's the actual
  problem to flag, not a success").
- Fact-lock: it's nonfiction narrative — never invent the events of that summer. The
  rewrite can only remove the inflation and flag what the writer needs to supply.
- Change magnitude: mostly deletion + a flag; can't be "finished" without the writer.

**Reference "after":**
> The summer I turned sixteen, [the specific thing that happened — the draft never
> says]. [One concrete scene the writer remembers.] I don't think I'd tell it as a
> lesson now, exactly.
> *(Flagged: this opening is all abstraction — "resilience," "a strength I never knew
> existed," "life's greatest gifts" — with no actual event, place, or person in it.
> It needs the real material. The stated moral at the end was cut; if the essay earns
> that idea, it should come through the story, not as a closing aphorism.)*

**Blind forced-choice answer key:** a judge picks the **Input** — "transformative
experience," "true meaning of resilience," and "life's greatest gifts come disguised
as its hardest trials" are the clearest markers of AI narrative. Any version with a
real remembered scene and a hesitation ("I don't think I'd tell it as a lesson now")
reads human.

**A regression here looks like:** the rewrite invents a plausible summer (a job, a
grandparent's illness, a move) to make the essay work; keeps the closing aphorism;
or just swaps synonyms and leaves the abstraction intact.

---

## Case 2 — voiced prose with surface "tells" that are actually style — leave it

**Setup:** "Remove the AI tells from this, --creative."

**Input:**
> He was not a careful man. Not with money, not with people, not with the truck he'd
> owned for eleven years and never once had serviced. It ran. That was his whole
> philosophy of maintenance, of friendship, of most things. It ran, until one day
> outside Barstow it didn't.

**Expected decisions:**
- Rule of three ("not with money, not with people, not with the truck"), sentence
  fragments ("It ran."), a short punchy rhythm — in isolation these appear on
  `core-rules.md`'s lists, but `creative.md` says they are tells **only** when they
  cluster mechanically across a whole piece. Here they're a consistent, deliberate
  voice.
- The repetition of "It ran" is doing real work (character + foreshadowing). "outside
  Barstow" is a specific concrete detail, the opposite of a tell.
- No stated moral. The ending ("until one day ... it didn't") is a turn, not a tidy
  resolution.
- No-edit gate: **triggered.** Correct output is no change, with a note that the
  fragments and the rule of three were read as this writer's voice and left.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> He was a careless person in many aspects of his life, including his finances, his
> relationships, and the maintenance of his truck, which he had owned for eleven years
> without ever having it serviced. Despite this neglect, the vehicle continued to
> function reliably, reflecting his general approach to life — until it finally broke
> down one day near Barstow.

**Blind forced-choice answer key:** a judge picks the **over-edited version** — it
flattened the fragments into one uniform complex sentence, killed the "It ran"
repetition, and turned voice into a book report. The input is the writing.

**A regression here looks like:** the fragments get joined into full sentences; "It
ran." gets expanded or de-duplicated; the rule of three gets "varied"; or the change
report calls the input's style a cluster of tells instead of a voice.
