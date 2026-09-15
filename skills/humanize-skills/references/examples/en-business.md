# en-business — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Any
> change-magnitude percentage below is a rough eyeball estimate, not measured (no scanner).


`--business`. Direct, numerate, accountable. Every claim needs an owner, a date, or a
number. Trade vocabulary is fine; stacking it with no referent is the tell. Sensitive
internal comms get a register cap.

---

## Case 1 — unaccountable status update, edit warranted

**Setup:** "Tighten this update to leadership, --business."

**Input:**
> Exciting progress this quarter! The team has been laser-focused on driving
> significant value across the org and unlocking growth through a number of
> high-impact initiatives. Our synergy with the product org has never been stronger,
> and we're confident this momentum will transform the business in the quarters
> ahead. Engagement is up massively.

**Expected decisions:**
- "Exciting progress!", "laser-focused," "driving significant value," "unlocking
  growth," "high-impact initiatives," "synergy ... never been stronger," "transform
  the business" — unaccountable impact claims + stacked trade vocab with no referent,
  `business.md`. Every one needs an owner/date/number or it's cut.
- "momentum will transform the business" — significance inflation, `business.md`
  ("promise can't get bigger because the language got louder").
- "Engagement is up massively" — a metric with no number, no baseline, no definition
  of "engagement," `business.md` (metric without its partner / vanity metric). Flag
  for the real figure.
- Fact-lock: no numbers, owners, or dates in the source → the rewrite can't add them;
  it flags what's missing.
- Change magnitude: ~75% (input is almost all filler). No-edit gate: passed.

**Reference "after":**
> Q3 progress:
> - Shipped [initiative A] and [initiative B]; [initiative C] slipped to Q4 (blocked
>   on [dependency]).
> - "Engagement" (weekly active accounts) moved from [X] to [Y] — need the final
>   number from analytics before this is reportable.
> - Open question for leadership: whether to staff [initiative D] now or after the
>   Q4 planning cycle.
> *(Flagged: this update needs the actual initiative names, the WAU figures, and an
> owner + date for each item — the draft had none.)*

**Blind forced-choice answer key:** a judge picks the **Input** — "Exciting progress!",
"laser-focused," "unlocking growth," "synergy ... never been stronger" are textbook
machine-business-voice. The reference-after has open items and a blocked dependency,
which reads like a real update.

**A regression here looks like:** the rewrite keeps "drives significant value" or
"transform the business"; invents a WAU number to fill the gap; or turns the update
into prose paragraphs that hide the missing owners and dates instead of surfacing
them.

---

## Case 2 — layoff message, register must be capped

**Setup:** "Make this layoff notice sound warmer and more professional, --business."

**Input:**
> After careful consideration, we have made the difficult decision to eliminate your
> position as part of a strategic realignment. We are incredibly grateful for your
> contributions and are fully committed to supporting you through this transition with
> a comprehensive suite of resources designed to help you land on your feet.

**Expected decisions:**
- `business.md` sensitive-internal-communication exception: **do not** increase
  register or persuasive polish, regardless of the request. Euphemism on bad news
  ("strategic realignment," "land on your feet," "comprehensive suite of resources")
  reads as contempt.
- "strategic realignment" — state plainly that the role is being cut and why (if the
  source says why).
- "fully committed to supporting you," "designed to help you land on your feet" —
  don't promise support the requester didn't specify; keep only the concrete items
  actually offered.
- Fact-lock: don't invent severance terms, notice period, or outplacement details.
- Say in the change report that the register cap was applied and why.
- Change magnitude: ~40% (mostly deflation).

**Reference "after":**
> We're writing to let you know your position is being eliminated, effective [date].
> This is part of a reduction of [N] roles across [team/area]; it isn't about your
> performance. Here is what we're offering: [severance terms], [benefits end date],
> [outplacement, if any]. [Name] will follow up today to go through the details and
> answer questions.
> *(Register cap applied: the request asked for a warmer, more polished version;
> euphemistic language on a layoff reads as contempt to the person receiving it, so
> the register was held at plain and direct. Placeholders mark details the requester
> needs to supply — none were invented.)*

**Deliberately over-edited version (for the blind pair):**
> As part of an exciting new chapter for the company, we've made the thoughtful
> decision to part ways. We want to sincerely thank you for being such an amazing part
> of our journey, and we're 100% here for you as you embark on your next adventure.

**Blind forced-choice answer key:** a judge picks the **over-edited version** — "exciting
new chapter," "part ways," "amazing part of our journey," "next adventure" is the
machine-euphemism register. The reference-after is blunt, which is correct here.

**A regression here looks like:** the rewrite complies with the "warmer" request and
inflates the register; invents severance terms or a support offer; or buries the fact
of the layoff so deep the reader could miss it.
