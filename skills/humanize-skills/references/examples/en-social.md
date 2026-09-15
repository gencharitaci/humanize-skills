# en-social — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Any
> change-magnitude percentage below is a rough eyeball estimate, not measured (no scanner).


`--social`. Cuts harder than any other mode. Keep it personal and specific; don't slide
into templated influencer voice. The humblebrag arc is an automatic rewrite trigger.

---

## Case 1 — humblebrag-arc LinkedIn post, edit warranted

**Setup:** "Punch up this LinkedIn post, --social."

**Input:**
> A year ago, I was rejected from 47 jobs.
>
> Today, I lead a team of 12.
>
> Here's what changed:
>
> I stopped waiting for permission.
>
> I started showing up as my authentic self.
>
> I invested in myself.
>
> The lesson? Your setbacks are setups for your comeback. 💪
>
> Agree? Drop a 🔥 below. And tag someone who needs to hear this today.

**Expected decisions:**
- The whole shape — one-line-paragraph stack + "A year ago I was at zero / Today..."
  + manufactured-humility opener + reveal — is the humblebrag arc, `social.md`.
  Automatic rewrite trigger. Flag it explicitly in the report.
- "I stopped waiting for permission," "showing up as my authentic self," "invested in
  myself" — content-free lines, no specific action.
- "Your setbacks are setups for your comeback" — stated moral, `structural-pass.md`
  check 1 + `social.md`.
- "Agree? Drop a 🔥 below. And tag someone..." — engagement-bait closer + rhetorical
  question padding, `social.md`.
- 💪 as a punctuation flourish on a hollow line — remove; a single sign-off emoji on a
  real line would be fine.
- Fact-lock: "47 jobs" and "team of 12" are the poster's own claimed facts — keep them
  if the poster supplied them; don't invent additional specifics about the year (a
  mechanism, a resume-rewrite, a referral story — none of that is in the draft).
- Change magnitude: ~70%. No-edit gate: passed.

**Reference "after":**
> I got rejected from 47 jobs last year. Now I manage 12 people. What changed in
> between was specific and kind of boring, and I'd rather tell it straight than turn it
> into a lesson.
> *(Flagged: the post gestures at "what changed" but the three lines under it —
> "stopped waiting for permission," "authentic self," "invested in myself" — say
> nothing concrete. It needs the poster's real specifics; none were invented here, and
> the "wasn't mindset, it was X" phrasing was avoided since that's the same negative-
> parallelism shape the mode removes.)*

**Blind forced-choice answer key:** a judge picks the **Input** — the one-line stack,
"authentic self," "setbacks are setups for your comeback," and "Drop a 🔥 below" are
the most recognizable AI-plus-influencer pattern there is. The reference-after refuses
the lesson-arc and flags that the concrete detail is missing, which reads human.

**A regression here looks like:** the rewrite keeps the one-line-paragraph stack; keeps
a stated moral; keeps or "softens" the engagement-bait closer instead of cutting it;
or invents specifics about the 47 rejections that the poster didn't give.

---

## Case 2 — short, specific, opinionated post — minimal edit

**Setup:** "Clean up this post, --social."

**Input:**
> Spent the afternoon migrating our build off a tool I've complained about for two
> years. Took four hours. Should've done it in 2023. If you're still on it: the export
> works fine, the import is the part that'll eat your day.

**Expected decisions:**
- Short sentences, a fragment, a contraction, a stated opinion, one concrete warning.
  `social.md` register section — this is the target voice, not a defect.
- No humblebrag arc, no engagement bait, no stated moral, no emoji-bullets.
- No-edit gate: **triggered.** Correct output is no change, maybe a note that the last
  sentence could be split for scannability — offered, not imposed.
- Change magnitude: 0–5%.

**Deliberately over-edited version (for the blind pair):**
> Today I finally did something I'd been putting off for two years. 🙌
>
> I migrated our entire build system.
>
> Was it scary? Yes.
>
> Was it worth it? Absolutely.
>
> Lesson learned: don't let fear of change hold you back. What's something you've been
> putting off? 👇

**Blind forced-choice answer key:** a judge picks the **over-edited version** — it took
a specific, useful post and rebuilt it into the exact humblebrag/engagement-bait
template the mode exists to remove. The input is the good post.

**A regression here looks like:** the skill "improves" the input toward the influencer
template; adds a hook line or a CTA; or cuts the concrete "import is the part that'll
eat your day" warning as too niche.
