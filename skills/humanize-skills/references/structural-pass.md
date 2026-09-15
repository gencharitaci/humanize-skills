# Structural Pass — Discourse-Level Checks

Read this after `core-rules.md`. It runs second in the fix order, but should be
*diagnosed* first — a piece's structure is set before its sentences are, and these
tells hide from a sentence-by-sentence read.

Measured research on AI-generated prose (StoryScope, 2026) found that discourse-level
structure alone — with no vocabulary analysis at all — detects machine authorship at
over 93% accuracy, while a professional-grade surface rewrite moved detection by under
two points. The surface pass in `core-rules.md` is necessary. It is the smaller half of
the job.

## Genre gate

Skip this entire pass on specs, runbooks, reference documentation, procedures, and
other formats where a rigid, repeated shape is the actual point of the format — and say
plainly that it was skipped, rather than silently applying it anyway. Everything below
assumes prose: essays, posts, articles, reports, narrative sections, marketing copy.

## The trap

Don't replace one default shape with another. If every piece starts opening mid-scene,
names exactly two feelings, and ends unresolved, that's a new, equally detectable
pattern — the underlying finding is that AI output converges tightly into one narrow
region of structural shapes while human writing is dispersed and comparatively rare in
any one shape. **Rarity is the actual signal**, not any specific move on the menu below.
Pick one or two interventions per piece, and vary which ones get used across a body of
work for the same person or project.

## Run these six checks one at a time

Checking all six as one pass tends to miss things a sequential pass catches; go through
them in order.

### 1. Theme explicitness

Does the piece state its own lesson — a "what this means for you," a thesis restated at
the end of every section, every example dutifully interpreted before moving on? Cut the
restatement. State the point once, at the place it lands hardest, and leave at least
one example uninterpreted. Trust the reader to have gotten it.

### 2. Structural tidiness (linearity)

Is it one unbroken causal chain — claim, support, takeaway, every paragraph the same
shape, everything resolved by the end? Real writing digresses, loops back, and
sometimes leaves a thread open. Where the genre allows it: add one tangent that only
obliquely relates to the main point and isn't tied back explicitly; raise one question
and explicitly leave it unanswered; or stop short of a tidy resolution instead of
rounding everything off.

### 3. Emotion mode

Is feeling rendered through the body or atmosphere — "a knot in my stomach," "the room
went quiet," "my chest tightened" — instead of just named? This inverts familiar "show,
don't tell" advice, and inverting it is deliberate here: performing emotion through the
body is one of the single strongest structural tells measured in this research, far
outweighing plain emotional statements in AI-generated text. Say the feeling plainly
("honestly, it worried me," "I was pissed"). Reserve one earned physical or atmospheric
image for the single moment that most deserves it — not as a running tic through the
whole piece.

### 4. Reference specificity

Does the piece stay at "a popular book," "an expert," "recently," "a well-known
company" when a specific one is actually knowable? Name the book, the person, the date,
the company, the price, the version number. If the specific detail genuinely isn't
known, say that plainly instead of covering the gap with a vaguer generality.

### 5. Reader engagement

Does the piece write as though no one is reading it — no acknowledgment that an actual
person is on the other end? Where the genre allows a first- or second-person register
(posts, essays, docs — not formal reports or neutral reference material), one moment
that admits the writing itself exists ("I know how this sounds," "skip this section if
you already know the basics") reads as more human. Use this sparingly; it's a spice,
not a base ingredient, and overusing it becomes its own tic.

### 6. Shape convergence

Does this piece share a skeleton with the last few pieces written for this person or
project — same opener type, same arc, same closer? If context on recent work is
available, compare against it and deliberately break the pattern where it's converging.

## Order of operations

1. **Extract the skeleton first.** Outline the piece: its beats in order, where (if
   anywhere) the lesson gets stated and how many times, whether time runs linearly,
   what gets resolved, where feeling appears and in what mode, and which references are
   named versus vague. Audit this outline, not the finished prose.
2. **Run the six checks** against that outline, one at a time.
3. **Choose one or two interventions** from the notes above — deliberate, genre-
   appropriate, and different from the fix used on the last piece for the same context.
4. **Rewrite structurally.** Move sections, cut a restatement, delete a manufactured
   resolution. This is not a polish pass — the surface pass in `core-rules.md` already
   handled word- and sentence-level fixes.
5. **Re-check for the trap.** If the fix looks identical to the one applied last time,
   vary it before delivering.
