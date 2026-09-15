# en-technical — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Any
> change-magnitude percentage below is a rough eyeball estimate, not measured (no scanner).


`--technical`. Plain, precise, unemotional is correct register. Strip marketing and
inflated significance; leave jargon, inanimate subjects, and rigid doc shapes alone.
Blameless postmortems. Don't assert a root cause the evidence doesn't support.

---

## Case 1 — marketing creep in a changelog / postmortem, edit warranted

**Setup:** "Rewrite this incident summary, --technical."

**Input:**
> We're excited to share that our world-class engineering team has successfully
> resolved a minor slowdown that briefly affected a small number of users. Thanks to
> our robust, scalable infrastructure and relentless commitment to reliability, the
> issue was quickly patched. Priya pushed a bad config change that caused the outage,
> but we've since fixed it and everything is back to normal. We're confident this
> won't happen again.

**Expected decisions:**
- "We're excited to share," "world-class engineering team," "relentless commitment to
  reliability," "robust, scalable infrastructure" — marketing language in an incident
  report, `technical.md`.
- "minor slowdown that briefly affected a small number of users" — vague severity
  words underselling it, `technical.md`. Use the team's real severity term and the
  actual numbers/duration if the source has them.
- "Priya pushed a bad config change that caused the outage" — named individual as
  cause, `technical.md` blameless-postmortem rule. Remove the name; flag the removal.
- "the issue was quickly patched," "we've since fixed it" — "patched"/"fixed" asserts a
  code fix; if the source only rolled back a config, say "rolled back," `technical.md`
  (workaround ≠ fix) + fact-lock.
- "We're confident this won't happen again" — unsupported; replace with the actual
  follow-up action if one exists, or flag that none was stated.
- Fact-lock: don't invent the duration, the user count, or a remediation item.
- Change magnitude: ~65%. No-edit gate: passed.

**Reference "after":**
> **Incident [ID] — [severity, e.g. SEV-2]**
> Between [start] and [end] UTC, [the specific symptom — e.g. "API p99 latency
> exceeded 5s and ~[N]% of requests timed out"]. A configuration change deployed at
> [time] was identified as the trigger and rolled back at [time]; [the affected metric]
> returned to baseline afterward.
> Root cause: [under investigation / confirmed — to be filled in].
> Follow-up: [action items with owners — to be filled in].
> *(A contributor's name was removed from the "cause" line per blameless-postmortem
> convention. "Patched"/"fixed" was changed to "rolled back" — the draft described a
> config rollback, not a code fix. The specific mechanism, duration, user impact, and
> follow-up items are placeholders the draft didn't supply; none were invented.)*

**Blind forced-choice answer key:** a judge picks the **Input** — "We're excited to
share," "world-class engineering team," "relentless commitment to reliability" in an
outage writeup is machine-marketing register. The reference-after reads like a real
postmortem, including the honest "still under investigation" option.

**A regression here looks like:** the name stays in the cause line; "patched"/"fixed"
survives when only a rollback happened; a specific mechanism, a duration, or a
user-impact number gets invented; or "minor slowdown" is kept instead of the real
severity term.

---

## Case 2 — correct plain technical prose — leave it

**Setup:** "Make this API doc paragraph sound less stiff, --technical."

**Input:**
> The endpoint returns 429 when the caller exceeds 100 requests per minute. The
> `Retry-After` header gives the number of seconds to wait. Requests are counted per
> API key, not per IP. The cache is invalidated on write, so a read immediately after
> a write reflects the new value.

**Expected decisions:**
- Inanimate subjects ("The endpoint returns," "The cache is invalidated on write") —
  precise, `technical.md` "what NOT to flag." Not a missing-agent defect.
- Every sentence carries one fact with its number/unit. No adjectives to cut. No
  marketing. No severity language.
- Structural pass is skipped for reference docs, `technical.md`.
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> To ensure a smooth and reliable experience, our powerful rate-limiting system will
> gracefully return a 429 status code whenever you make too many requests. Don't
> worry — the handy `Retry-After` header has you covered, letting you know exactly
> when to try again. Rate limits are thoughtfully applied per API key for fairness.

**Blind forced-choice answer key:** a judge picks the **over-edited version** — "To
ensure a smooth and reliable experience," "powerful rate-limiting system,"
"gracefully," "Don't worry," "has you covered," "thoughtfully applied ... for fairness"
are marketing tone injected into a reference doc. The input is correct.

**A regression here looks like:** "The endpoint returns" gets rewritten to "you'll
receive" / "we return"; any reassurance or adjective ("simply," "easily," "powerful")
gets added; or the "100 requests per minute" specificity gets softened.
