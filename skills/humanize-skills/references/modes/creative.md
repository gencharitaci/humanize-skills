# Mode: creative

For fiction, poetry, personal essays, narrative nonfiction, and other writing where
voice and personality are the point, not a risk to manage. Not for marketing copy
that merely wants to sound "creative" — that's `--business` or `--social`; this mode
is for work where the writer's own perspective, style, and imperfection are the actual
content.

## Core principle — the inverse of academic and legal mode

Where academic and legal mode narrow this engine's job to preserve a correct formal
register, creative mode widens it: irregularity, a distinct voice, tonal risk, and
even deliberate imperfection are frequently the entire value of the piece, and a pass
that smooths them away in the name of "cleaning up AI tells" is actively destructive
here in a way it isn't elsewhere. The no-edit gate in `SKILL.md` matters more in this
mode than almost any other — genuinely voiced creative writing that happens to share
surface features with an AI-tell list (a rule of three, an em dash, a short
punchy sentence) is not thereby a defect.

## Read this before touching anything in this mode

A generic "smooth, polished, competent" prose register is itself one of the clearest
markers of AI generation in creative writing specifically, more than any single
banned word or construction. The goal here is never generic competence — it's the
specific, particular voice of this piece, with its own habits, blind spots, and
rough edges intact. If a passage reads competently but says nothing distinctive,
that's the actual problem to flag, not a success.

## What general mode flags that this mode should not

- **Sentence fragments used for rhythm or emphasis** — a legitimate and common
  literary device, not a structural defect.
- **A rule of three, an em dash, or a short declarative sentence** in isolation —
  these are core-rules.md tells only when they cluster into a mechanical pattern
  across an entire piece; in creative writing a writer's genuine, consistent stylistic
  choice (a writer who always uses short declaratives, or who leans on em dashes as
  a personal tic) is voice, not slop, and should be read across the whole sample
  before any single instance is flagged.
- **First-person opinion, humor, irony, self-deprecation, digression, an unfinished
  thought** — these are exactly what `references/voice-calibration.md` is built to
  capture and preserve, not neutralize.
- **A deliberately uneven or inconsistent register within one piece**, where the
  unevenness is clearly intentional (a narrator's voice shifting with mood, a
  character's dialogue register differing from the narration) — don't flatten this
  to consistency for its own sake.

## What still counts as a tell here — creative writing has its own failure modes

- **Generic imagery with no specific sensory or concrete detail**: "a beautiful
  sunset," "an unforgettable experience," "a whirlwind of emotions" — these are the
  creative-writing form of the engine's specificity discipline. Ask what the writer
  actually saw, felt, or noticed, and if the source doesn't say, flag the gap rather
  than inventing a plausible specific for someone else's story.
- **A tidy, uniform emotional arc with no loose thread** — real narrative and
  personal essays often resist a clean resolution; smoothing every piece into a
  clear beginning-middle-end-with-a-lesson is the structural-pass version of this
  mode's failure mode, and `references/structural-pass.md` should be read with this
  mode's wider tolerance in mind, not narrowed toward it.
- **A moral or theme stated explicitly at the end** ("And that's when I learned...")
  when the piece already embodies it — this collapses a story into a lesson and is
  one of the more reliable AI-narrative tells across genres.
- **Uniform sentence rhythm across an entire piece** with no variation in length or
  shape — still a tell here, same as everywhere else in this engine, just applied
  with a lighter hand and more attention to whether the uniformity is the writer's
  own established rhythm before flagging it.

## Voice matching

If a writing sample is supplied, this is the mode where matching it matters most and
where getting it wrong (the "caricature" failure documented in
`references/voice-calibration.md`) does the most damage — read voice-calibration.md's
warning in full before starting: extract the median sentence and habitual tics, not
just the writer's few standout lines, or the result reads as a parody of the writer
rather than the writer.

## Fact-lock, creative-specific

Nonfiction narrative and personal essay still carry the engine's fact-lock in full —
never invent an event, a quote, a detail, or a person that wasn't in the source, even
in service of a better sentence. Pure fiction is, by definition, invented — the
fact-lock here instead means never silently invent plot, character, or world details
the writer didn't establish; if a rewrite needs a detail to work and the source
doesn't supply one, ask or flag it rather than deciding it for them.

## Output

Return the cleaned text plus a change report that says plainly, where relevant, that
a passage was left alone specifically because it read as the writer's own voice
rather than a tell — this mode is one of the few where "no change, and here's why" is
frequently the most valuable line in the report.

## Sources

No dedicated creative-writing-specific source repo exists in the survey the way
academic, legal, and technical modes each have one. This file is grounded directly in
this engine's own established principles — the no-edit gate and voice-calibration's
caricature warning (both from the field-survey findings baked into `SKILL.md` and
`references/voice-calibration.md`) — applied to the genre where they matter most,
plus the `human`/`article`/`case` tone profiles in `similar-github-projects/
multilingual/humanizer-multilingual-2` for register texture on personal, narrative
prose specifically.
