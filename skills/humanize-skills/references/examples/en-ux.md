# en-ux — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Any
> change-magnitude percentage below is a rough eyeball estimate, not measured (no scanner).


`--ux`. Read in fragments, under task pressure. Cut every word that doesn't help the
user act now. Concrete controls, specific errors, no apology, no marketing, user-side
naming. A clipped imperative is correct here — don't "complete" it.

---

## Case 1 — apologetic vague error, edit warranted

**Setup:** "Improve this error message, --ux."

**Input:**
> Oops! Something went wrong on our end. We're really sorry for the inconvenience.
> An unexpected error has occurred while processing your request. Please try again
> later, and don't hesitate to reach out to our friendly support team if the issue
> persists. We appreciate your patience!

**Expected decisions:**
- "Oops!", "We're really sorry," "our friendly support team," "We appreciate your
  patience!" — apology + empty enthusiasm, `ux.md` (errors: no apologies, no
  vagueness).
- "Something went wrong," "An unexpected error has occurred" — states only that it
  failed, no reason, no next step, `ux.md`.
- Wall of text for what should be one line, `ux.md`.
- Fact-lock: the actual cause and fix aren't in the source → flag that the message
  needs the real failure condition; don't invent one ("your card was declined") that
  might be wrong.
- Change magnitude: ~85% (near-total; almost nothing load-bearing).

**Reference "after":**
> Couldn't save your changes — [specific reason, e.g. "you've been signed out"].
> [Specific fix, e.g. "Sign in again and reopen this page; your draft is kept."]
> *(Flagged: the copy needs the actual error condition and whether the draft is
> recoverable — the draft message said neither.)*

**Blind forced-choice answer key:** a judge picks the **Input** — "Oops!",
"friendly support team," "We appreciate your patience!" are unmistakable machine-UX.
The reference-after names a condition and a next step, which is what a real product
error does.

**A regression here looks like:** an apology survives ("Sorry, ..."); the message still
gives no reason or next step; or a specific cause gets invented to fill the placeholder.

---

## Case 2 — clipped labels and a plain imperative — leave them

**Setup:** "Make this onboarding copy less robotic, --ux."

**Input:**
> Enter your email
> [ Continue ]
> We'll send a code to confirm it's you.

**Expected decisions:**
- "Enter your email" — a plain imperative, correct in an interface; `ux.md` "what NOT
  to flag." Do **not** expand to "Please enter your email address below to get
  started."
- "We'll send a code to confirm it's you" — concrete, states what happens, user-side
  language. Fine.
- `[ Continue ]` — this is the one legitimate flag: `ux.md` prefers a specific verb
  over a vague one where available. If the next step is known (it sends a code), a
  label like `Send code` is better. If the flow genuinely continues to more fields,
  `Continue` stays.
- No-edit gate: near-triggered — only the button label is a candidate, and only
  conditionally.
- Change magnitude: 0–10%.

**Reference "after":**
> Enter your email
> [ Send code ]   ← only if the next action is in fact sending the code; otherwise
> keep [ Continue ]
> We'll send a code to confirm it's you.

**Deliberately over-edited version (for the blind pair):**
> Welcome! Let's get you set up. Please enter your email address in the field below so
> we can create your account. Once you click the Continue button, we'll send a
> verification code to your inbox to make sure it's really you.

**Blind forced-choice answer key:** a judge picks the **over-edited version** — it
turned three glanceable lines into a paragraph nobody reads mid-task. The input is
correct interface copy.

**A regression here looks like:** "Enter your email" gets padded into a full polite
sentence; the helper line gets expanded; or the button gets a vaguer label ("Get
started", "Go").
