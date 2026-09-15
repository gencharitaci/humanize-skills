# Mode: ux

For UI copy and microcopy: button labels, form fields, error and empty states,
onboarding flows, tooltips, notifications, and confirmation messages. Not for
marketing copy on a product's landing page (`--business`) and not for visual UI
design — this mode is exclusively about the words inside an interface, not its
layout, color, or component choices.

## Core principle

UX writing is read in fragments, under time pressure, usually while trying to
finish a task rather than while reading attentively — the opposite reading condition
from every other mode in this engine. A sentence that would be perfectly natural in
an email reads as friction in a button label. This mode's job is less about removing
AI-vocabulary tells (though those still apply) and more about cutting every word that
doesn't help someone complete their task right now.

## Write from the user's side of the screen

Name things by what a person recognizes doing, not by how the system or the codebase
models it — someone manages their **notifications**, not their **webhook
configuration**; someone views their **order**, not their **transaction record**.
When copy exposes an internal name (a database field, an API resource, an internal
team's jargon) directly to a user-facing surface, that's a tell specific to this mode
worth fixing even when the wording is otherwise grammatically fine.

## Concrete controls: say exactly what will happen

A button or menu item's label should describe the actual action that fires when
pressed, in active voice — "Publish," "Delete project," "Send invite" — not a vague
verb that could mean several things ("Submit," "Go," "Continue") when a more specific
one is available and would remove ambiguity about what happens next. After the action
completes, confirm in the same concrete terms ("Published" — not "Success!" or
"Done!" with no reference to what was done).

## Errors: explain what went wrong and how to fix it

An error message that states only that something failed, with no reason and no next
step, is a UX failure independent of any AI-tell it might also contain. No
apologies ("Oops! Something went wrong"), no vagueness ("An error occurred"), no
blame directed at the user for an ambiguous cause. State the specific problem
("This email is already registered") and, where possible, the specific fix ("Try
signing in instead, or use a different email").

## Vocabulary and content tells specific to this mode

- **Empty enthusiasm with no information**: "Great job!," "You're all set!," "Awesome,
  you did it!" used as the entire content of a confirmation, with no reference to what
  was actually completed — replace with the specific outcome, and only add
  enthusiasm on top of that if the product's established voice genuinely calls for it.
- **Marketing language leaking into functional copy**: "Discover our powerful new
  dashboard," "Unlock premium features" inside an in-product flow the user is already
  using to accomplish a task — this is significance inflation applied to an
  interface, and it reads as an interruption, not as help.
- **Needless hedging in a system message**: "This might possibly cause an issue" when
  the system knows the actual condition — state the specific condition instead of a
  vague possibility ("Deleting this will remove it for all collaborators").
- **A wall of text where a single clear sentence would do.** UX copy is read
  partially, quickly, and often out of order (a user scanning a form for the one
  field that's red) — cut every sentence that isn't load-bearing for the immediate
  decision in front of the user.
- **Jargon or internal terminology with no user-facing translation** — see "write
  from the user's side of the screen," above; this is this mode's single most
  frequent and most damaging tell.

## What NOT to flag

A short, plain, imperative sentence — "Enter your email," "Choose a plan" — that
would read as clipped or incomplete in an essay is exactly correct here; don't
"complete" it into a fuller sentence. Established, product-specific terminology a
returning user already knows (a feature name, a plan tier) is not jargon in this
mode's sense — the tell is exposing *internal* system vocabulary to *external* users,
not using a product's own proper nouns.

## Fact-lock, UX-specific

Never invent what a button, error, or flow actually does — if the underlying behavior
isn't specified (does "Delete" ask for confirmation first? is the action reversible?),
flag the gap rather than writing copy that implies a behavior nobody confirmed. A
polished error message describing the wrong actual cause is worse than a generic one,
because it actively misleads someone trying to fix their own problem.

## Output

Return the cleaned copy plus a short change report; for any control or message where
the underlying product behavior was unclear or unstated, flag that explicitly rather
than silently guessing at a plausible one.

## Sources

No dedicated UX-writing-humanizer source repo exists in the survey — `humanize-ui`
(`similar-github-projects/irrelevant-different-domain/humanize-ui`) is about visual UI
design and component selection, a different discipline from the text-only scope of
this mode, and was not used as a source here beyond confirming that scope
distinction. This file is grounded instead in this engine's own copy-writing
principles (write from the user's side of the screen, active voice for controls,
specific errors with no apology or vagueness) as established practice for interface
text, applied here as this mode's core discipline.
