# Mode: resume

For resumes, CVs, cover letters, LinkedIn "About" and headline sections, and other
candidate-authored job-search documents. Not for employer-side hiring documents (job
descriptions, offer letters, internal HR communication) — those are `--business`; this
mode is specifically for the document written by the person applying, about
themselves.

## Core principle

A resume's entire job is letting a specific, verifiable person's actual experience
come through fast — the failure mode isn't "sounds like AI" in the abstract, it's
"could describe almost anyone in this role," which is a content problem general
mode's surface-tell removal alone won't fix. This mode's real work is converting
generic self-description into specific, checkable claims, and only secondarily
cleaning up phrasing.

## The single highest-value test: could a rival candidate publish this unchanged?

Read every bullet and ask whether a different person in a similar role could claim
the identical sentence with no edits. "Managed a team and improved processes" passes
that test for almost anyone; "Cut onboarding time for new hires from three weeks to
four days by rebuilding the training checklist" doesn't — it's specific to what this
person actually did. Flag substitutable, could-be-anyone bullets as the primary
defect in this mode, ahead of any individual banned word.

## Vocabulary tells — generic self-description with nothing behind it

"Results-driven," "detail-oriented," "team player," "hardworking," "go-getter,"
"passionate about," "proven track record," "dynamic," "self-starter," "excellent
communication skills" — these describe a trait rather than an action, and a hiring
reader has seen every one of them hundreds of times with nothing behind them. Replace
each with the specific action or result that would let a reader infer the trait
themselves, rather than being told to believe it.

## Structural tells

- **Responsibility-listing instead of achievement-stating.** "Responsible for
  managing the budget" describes a duty; "Reduced departmental spend by 12% by
  renegotiating two vendor contracts" describes an achievement. Convert every bullet
  that only names a duty into one that also names the outcome, where the underlying
  fact supports it — never invent the outcome if it isn't there (see fact-lock,
  below); flag the bullet as needing a real number from the candidate instead.
- **Passive, agentless construction**: "Was responsible for," "Tasked with,"
  "Duties included" — lead with a strong active verb naming what the person actually
  did (built, negotiated, launched, reduced, designed) instead of a passive frame
  that hides the actor.
- **Padded objective/summary statements with no specific claim**: "Seeking a
  challenging position that will allow me to utilize my skills" — this is pure
  filler in a document where every line competes for a few seconds of attention; cut
  entirely or replace with one specific, concrete positioning line.
- **Uniform bullet length and rhythm across an entire resume** — the same mechanical
  pattern flagged everywhere else in this engine; vary bullet length by how much the
  actual accomplishment warrants, not to a fixed template.
- **Third-person self-reference or overly formal register** ("The candidate
  possesses...") in a first-person-implied document — resumes and cover letters
  conventionally drop the subject pronoun entirely ("Led a team of six," not "I led a
  team of six" or "The candidate led"), a genre convention worth preserving, not a
  missing-agent defect to fix by inserting "I."

## ATS (applicant tracking system) considerations — a real constraint, not paranoia

Many resumes are parsed by software before a person reads them. Preserve the actual
job-posting keywords and standard section headers (Experience, Education, Skills)
rather than replacing them with more "natural-sounding" synonyms purely for variety —
a clever rewrite that drops the literal keyword an ATS is filtering on can cost the
candidate an interview even though the language reads better to a human. This is the
one place in this mode where matching the source's exact terminology sometimes beats
a more natural-sounding paraphrase.

## What NOT to flag

Genuine, verifiable metrics and specifics, even when they sound impressive — a real
"grew revenue 40% in one year" is not significance inflation if it's true and the
candidate supplied it; standard section headers and conventional resume structure;
industry-specific terminology and tool names relevant to the target role; the
dropped-subject-pronoun convention described above.

## Fact-lock, resume-specific — the single most important rule in this mode

**Never invent a number, a title, a dollar figure, a duration, a team size, or an
outcome that the candidate didn't supply.** A fabricated resume claim isn't a style
risk, it's a claim a real person may be asked to defend in an interview or that an
employer may later verify against reality. Where a bullet clearly needs a specific
number to be persuasive and none was given, flag it explicitly as something the
candidate needs to fill in — never estimate a plausible-sounding one on their behalf.

## Output

Return the cleaned text plus a change report that separately lists any bullet flagged
as "substitutable" (passes the rival-candidate test) and any place a number was
requested from the candidate rather than supplied by the rewrite.

## Sources

No dedicated resume-humanizer source repo exists in the survey. This file is grounded
in this engine's own fact-lock and specificity discipline applied to the genre, plus
the substitutable-content test documented independently in
`references/languages/hi.md` (from `similar-github-projects/by-language/hi/
humanizer-hi-1`) as a general content-level defect distinct from any single surface
tell — generalized here as this mode's primary diagnostic, since it maps unusually
well onto what actually makes a resume forgettable.
