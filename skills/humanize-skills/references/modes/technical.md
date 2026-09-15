# Mode: technical

For API references, documentation, runbooks, changelogs, incident postmortems, PR/
ticket descriptions, and engineering status updates. Not for product marketing about
a technical product (see `--business`) or informal team chat, which tolerates more
looseness than this mode enforces.

## Core principle

Technical writing's correct register is plain, precise, and unemotional — a fact
stated once, correctly, is better than the same fact wrapped in three qualifying
adjectives. Most of what other modes flag as "too plain" or "too blunt" is exactly
right here. This mode's actual job is narrow: strip marketing language and inflated
significance that creeps into technical text, while leaving domain jargon, passive
constructions, and inanimate subjects alone wherever they're precise.

## What NOT to flag — these are correct technical register, not tells

- **An inanimate subject performing an action**: "the service rejects the request,"
  "the job times out after 30 seconds" is a precise sentence, not a missing-agent
  defect — general mode's missing-agent check does not apply to technical prose.
- **Standard engineering jargon used correctly**: deploy, rollback, sprint, backlog,
  ticket, staging, latency, throughput, feature flag, tech debt. In a technical
  document these are the fastest correct words, not filler dressed as expertise —
  translating them into plainer language is itself an unnatural move for this
  audience, not an improvement.
- **A rigid, repeated document shape** — a runbook, a spec, or a changelog that
  repeats the same structure entry after entry is doing its job; `SKILL.md`'s
  structural pass is explicitly skipped for these formats, and this mode inherits
  that.
- **Passive voice with no recoverable agent** where the agent genuinely doesn't
  matter to the reader ("the cache is invalidated on write").

## The blameless-postmortem rule

An incident report's register is blameless by convention: the system failed, a
process broke, a check was missing — not "Priya broke the build." This isn't a
softening move, it's the standard the format runs on; never introduce a named
individual as the cause of a failure in this genre even if the source material names
one, and flag that removal in the change report rather than doing it silently.

## Precision failures to actually fix

- **A metric with no unit, or a quality claim with no number.** "Fast," "scalable,"
  "robust," "efficient" with nothing to measure against are the technical-writing
  version of significance inflation — replace with the actual figure (latency in
  ms, throughput, uptime with the actual percentage) or cut the adjective.
- **A vague severity word standing in for the real one.** Calling an incident a "bug"
  or an outage a "slowdown" undersells it; calling a minor issue an "incident"
  oversells it. Severity language is a shared contract on most engineering teams —
  use the term the team actually uses for the actual severity, and don't substitute a
  softer, vaguer synonym in either direction.
- **Confusing adjacent technical terms that mean different things**: a
  proof-of-concept, an MVP, and a pilot are three different things (feasibility vs.
  real users vs. limited rollout of something finished) — don't smooth over the
  distinction to vary the vocabulary.
- **A stated cause the evidence doesn't support yet.** "The deploy caused the login
  failure" asserts a root cause; if the source only says the two events were
  correlated in time, say that instead ("the login failure began after yesterday's
  deploy; root cause analysis is in progress") — this is the technical-writing form
  of the engine's overclaiming-verb check.
- **A date or estimate for undecomposed work.** Promising a specific delivery date
  for something that hasn't been scoped is a tell; state a range and the assumption
  behind it instead.

## Metrics that carry real information (preserve or request these, don't paraphrase them into prose)

Latency percentiles (p95/p99, not just an average), uptime with the actual percentage
(and be alert if "99% uptime" is being presented as if it were strong — it's roughly
7 hours of downtime a month), error rate, throughput, cost per request, and — for
delivery-process claims specifically — lead time, deploy frequency, change failure
rate, and mean time to recovery. A number without its unit or its time window isn't a
number worth keeping as-is; flag it for the missing context rather than silently
supplying a plausible one.

## Fact-lock, technical-specific

Never invent a root cause, a fix, a metric, an incident timeline, or a completed
action ("we patched it," "the fix shipped") that the source doesn't actually state.
If the source describes only a symptom and a workaround, say exactly that — a
workaround is not a fix, and writing it as one misrepresents the system's actual
state to whoever reads the document next.

## Output

Return the cleaned text plus a change report. For an incident report specifically,
flag explicitly whether any causal or blame language was removed, and whether any
"fix" language was downgraded to "mitigation" or "workaround" to match what the
source actually supports.

## Sources

`similar-github-projects/by-language/it/humanizer-it-3` ("prospeak")'s
`branches/tech.md` and `branches/engineering.md` — the blameless-postmortem
convention, the PoC/MVP/pilot distinction, the DORA-metrics list, the "99% uptime
is not actually good" note, and the correlation-vs-causation discipline for incident
reports this file draws on most; a same-family skill whose worked example
demonstrates exactly this mode's core discipline: preserving a colloquial voice
("il servizio si e piantato") while fixing only the one word that asserted a claim
("patchato," implying a code fix) the source didn't support.
