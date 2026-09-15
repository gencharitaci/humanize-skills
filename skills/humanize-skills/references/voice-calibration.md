# Voice Calibration

Used when `--calibrate` is requested directly, or when a purpose mode (academic,
creative) is told to match a specific author's prior writing.

## The failure this file exists to prevent

An independent blind test built a voice profile from a writer's own most distinctive
passages — the moves he was actually recognized for — and used it to draft new text.
Judges identified the result as not his own writing 16 times out of 16, and the drafts
scored *more* machine-like on a blinded AI-tell rating than a plain model given no
calibration at all. The mechanism was register inflation: a profile documenting
someone's best lines gets the model writing best lines back — aphorisms, epigrams, tidy
turns of phrase — when the person's actual average sentence is plainer, hedges more,
and repeats itself more than their highlight reel suggests. A calibration file that
captures only the highlights produces exactly that: a highlight reel, not a voice.

## What to extract from writing samples

Ask for 3–5 samples the person actually wrote themselves, 2,000+ words total if
possible, from more than one genre if this skill will serve more than one for them.

- **Sentence-length distribution**, not just a typical length — the real mix of short
  and long, and specifically where the outliers fall.
- **Median habits, explicitly** — not just standout ones. Default connective words, how
  they usually open a paragraph, whether and how they hedge, whether they use
  semicolons or contractions, any particular punctuation habit.
- **Genuine tics and small imperfections** that a "best writing" sample would tend to
  omit — a comma splice they always make, a word they overuse, an aside they can't
  resist, a repeated self-correction. These are load-bearing: they are often exactly
  what makes an edited version of a person's own words read as tampered-with rather
  than untouched, and a profile missing them is missing the part that would have caught
  that.
- **Register range** — whether their voice shifts between an email and an essay, and
  how.
- **Connective fingerprint** — default transition words, paragraph-opener and closer
  habits, and their frequencies. The words someone reaches for without thinking are
  steadier than any single standout sentence.
- **Citation mechanics** — inline vs parenthetical, frequency, style. How someone
  attributes is part of the voice, not just the format.

## What not to do

- Don't build the profile only from a sample's single best paragraph or its most
  quotable line.
- Don't use the profile to invent facts, experiences, or opinions the person hasn't
  actually expressed — a profile tunes *how* something is said, never *what* is said.
  This is the fact-lock in `SKILL.md`, and calibration does not create an exception to
  it.
- Don't claim calibration is meaningfully active from a single short sample. Say
  plainly that the profile is thin, and default more conservatively toward the mode and
  language base rules until more samples exist.

## Where the profile lives

- **Chat-session-only by default.** This works even in sandboxed environments with no
  file access. State once, per conversation, that the profile is session-scoped —
  don't silently forget it mid-conversation, and don't silently assume it carried over
  from a previous one.
- If the environment supports persistent files and the requester wants the profile to
  outlive the session, save it to `references/voice-profile.md` inside this skill's own
  directory and say so plainly. It's plain markdown and editable by hand.
- A new session with no saved profile starts fresh. Don't assume a profile persists
  across environments (a sandboxed desktop app, a CLI, a web session) that don't share
  a filesystem with each other.
