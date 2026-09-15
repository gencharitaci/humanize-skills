# Mode: business

For internal memos, status updates, proposals, pitches, positioning copy, board and
management communication, and general professional correspondence. Not for job-search
documents (resumes, cover letters — see `--resume`) or contracts and compliance text
(see `--legal`).

## Core principle

Business writing has a real, legitimate register between "casual" and "legal" —
direct, numerate, and accountable, with the specific jargon of the trade used because
it's the fastest way to say something precisely to an audience that already knows it,
not because it sounds important. This mode's job is removing the two AI failure modes
that most damage business writing — vague significance-inflation and unaccountable
claims — while leaving genuine trade vocabulary alone.

## The rule this mode runs on: every claim needs an owner, a date, or a number

An announcement of impact isn't finished until the reader knows who's responsible and
when it happens. "This will improve retention" is unaccountable; "I'll have the
retention analysis by Friday" is a business sentence. Apply this test to every
significant claim in the piece — if it has no owner, no date, and no number attached,
either add the missing element (if the source supplies it) or flag that it's missing.

## Vocabulary and content tells

- **Unaccountable impact claims**: "drives significant value," "transforms the
  business," "unlocks growth" with no number, owner, or timeframe attached — replace
  with the specific action and its measurable result, or cut.
- **Metrics stated without their partner metric**: CAC without LTV, conversion rate
  without the denominator, ROI without a numerator, period, and baseline, "velocity"
  presented to a non-engineering audience as a productivity measure rather than a
  planning aid. A single metric quoted alone is frequently more persuasive than
  informative — pair it or don't use it.
- **Vanity metrics presented as outcomes**: impressions, likes, followers, or reach
  cited as if they were results. If the actual result (leads, revenue, retention)
  exists, use that instead; if it doesn't, say so rather than substituting a bigger,
  more available number.
- **Unfalsifiable claims of leadership or superiority**: "industry-leading,"
  "best-in-class," "world-class" with nothing to compare against — either name the
  actual differentiator or cut the adjective.
- **The over-softened bad-news sentence**: business writing is diplomatic, not
  opaque — state the fact, then the mitigation, in that order. A sentence so
  softened that a reader could miss that it's bad news is a failure of the writing,
  not tact.
- **"Urgent" applied to everything.** Urgency is a scarce resource; marking every item
  urgent empties the word of meaning for the one item that actually is.

## What NOT to flag — genuine trade vocabulary

Standard business and product terminology used precisely — stakeholder, roadmap,
ownership, bandwidth, runway, churn, pipeline, OKR, KPI — is not filler; it's the
fastest correct word for people who already share the vocabulary. The tell is
**stacking several of these per sentence with no concrete referent behind any of
them**, not the presence of any one term. Similarly, don't flag industry-standard
loanwords a business audience already treats as native vocabulary in context.

## A promise cannot get bigger just because the language got louder

A more emphatic or "punchier" version of a business claim must make the *exact same*
underlying promise in denser language — never a larger one. If the source says a
product "helps people find jobs," an emphatic rewrite can say that with more
conviction; it cannot become "guarantees career transformation." Check the verb and
the object, not just the surrounding frame — wrapping the same modest claim in bigger
nouns ("value proposition," "outcome") without changing the claim itself is a
cosmetic upgrade, not the substantive one the requester likely wants; if they want the
promise itself to be bigger, that requires new facts, which this mode doesn't invent.

## Sensitive internal communication — an explicit exception to "polish it up"

For messages about a layoff, a demotion, a negative performance review, or a pay
decision: **do not increase register or persuasive polish on these**, regardless of
what's requested. Inflated, euphemistic language on bad news reads as contempt to the
person receiving it and is remembered as such. If asked for a more elevated or
corporate-sounding version of this kind of message, cap the register at plain and
direct, say plainly that the cap was applied and why, and offer to draft the more
formal version anyway if the requester still wants it after hearing that. Never
invent the history behind a decision (prior conversations, agreed objectives, an
expected outcome) that the requester didn't actually supply — a placeholder marks a
missing date, it never manufactures a past event. Never promise support ("we'll help
you with your next step") that the requester didn't actually authorize.

## Fact-lock, business-specific

Never invent a customer number, revenue figure, case study, testimonial, or
partnership. Never assert that an internal act occurred (a decision was made, a
conversation happened, an approval was given) unless the source says so — write the
proposed form instead and flag the gap.

## Output

Return the cleaned text plus a change report, noting explicitly whether the
sensitive-communication cap (above) applied and, if so, what register was capped.

## Sources

`similar-github-projects/by-language/it/humanizer-it-3` ("prospeak")'s
`branches/corporate.md`, `marketing-sales.md`, and `hr-people.md` — the
owner-and-date accountability test, the vanity-metrics and paired-metric findings,
the "promise can't get bigger" rule, and the sensitive-communication register cap
this file draws on most; a same-family skill built specifically around measured
regressions where an early version's business register turned out to be
indistinguishable from its plainer one, and around a real documented failure where a
dismissal script invented supporting history that was never in the source.
