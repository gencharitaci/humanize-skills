# Mode: social

For social media posts, captions, community replies, and short-form platform content
(LinkedIn, Instagram, Threads, X, Telegram). Not for a full article or blog post
merely published on social media — a long-form piece keeps `--general` or
`--creative`; this mode is for the short, high-density format itself.

## Core principle

Social copy lives or dies on the first line and tolerates almost no wasted words —
the opposite constraint from academic or legal mode, where completeness matters more
than brevity. This mode's job is cutting harder than any other mode here, while
keeping the register personal and specific rather than sliding into the exact
templated "influencer voice" that's become its own unmistakable AI-adjacent tell.

## The single most recognizable tell in this mode: the humblebrag arc

"A year ago I was at zero. Today..." opened with a one-line paragraph, followed by a
staccato rhythm of more one-line paragraphs building to a reveal, is the most
recognizable AI-plus-influencer pattern there is — treat it as an automatic rewrite
trigger on sight, not just a density check. The tell isn't the story arc itself (a
real before/after is fine); it's the specific mechanical scaffolding: the one-line
paragraph stack, the manufactured humility opener, and the reveal structure copied
from a thousand other posts.

## Structural tells to fix

- **Rhetorical-question padding for fake engagement**: "Sound familiar?," "Can you
  relate?," "Ready to level up?" — cut. If the post is actually engaging, it doesn't
  need to announce that it wants engagement.
- **The engagement-bait closer**: "Drop a 🔥 if you agree," "Tag someone who needs
  this," "Comment YES below" — these read as a mechanical device, not real
  interest in a response, and are worth removing even when a client explicitly asked
  for a CTA — offer a specific, honest ask instead ("What's your experience with
  this?" tied to the actual content).
- **The emoji-as-bullet list** — an emoji at the start of every list item is a
  mechanical tell (contrast this with a single emoji closing a post or a paragraph,
  which reads as a natural human sign-off in casual platforms and should be left
  alone).
- **Talking about yourself for several lines before saying what the reader gets.**
  Lead with the actual point or hook; move the setup after it, or cut the setup.
- **Symmetrical one-line paragraphs stacked for effect** beyond the first one or two
  — after that it reads as a formula rather than a rhythm.

## Register and voice

Short sentences dominate (roughly 3–12 words), with one longer sentence allowed for an
explanation or a turn. Contractions throughout. Fragments are expected here, not a
defect — "Yes. Like this." is a normal sentence in this mode. A personal opinion or a
specific reaction beats a balanced, neutral summary; social platforms reward a stated
point of view, and a stripped-neutral post reads as corporate-account voice even when
every individual tell has been removed. Match the platform: LinkedIn tolerates more
professional framing than Threads or X even within this mode, and a post written for
one platform pasted unchanged into another is itself a small tell.

## Fake balance and manufactured objectivity

"On one hand… on the other hand," "there are pros and cons to this" — social copy
exists to say something, not to survey a topic evenly; unless the post is genuinely
weighing a real tradeoff with specifics on both sides, cut the hedge and state the
actual view.

## Fact-lock, social-specific

Never invent a specific outcome, number, or personal story detail ("I tried this for
30 days and grew 400%") that the requester didn't supply — an invented specific in a
first-person post reads as a lie about the poster's own life, which is a different and
worse failure than an invented specific in third-person copy. If a number is missing
and the post needs one to land, flag the gap rather than filling it with a plausible
guess.

## Output

Return the cleaned text plus a short change report; flag explicitly if the
humblebrag-arc pattern was detected and removed, since it's the single highest-value
check in this mode.

## Sources

`similar-github-projects/by-language/it/humanizer-it-3` ("prospeak")'s
`branches/marketing-sales.md` — the humblebrag-arc identification and the
vanity-metrics warning (also relevant to `references/modes/business.md`) this file's
core tell is drawn from directly; `similar-github-projects/multilingual/
humanizer-multilingual-2` ("HUMAN-AI")'s `social` tone profile — the sentence-length
targets, fragment cadence, and per-platform register notes this file's voice section
draws on.
