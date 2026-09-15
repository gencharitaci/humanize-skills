# Language: Dutch (nl)

Pairs with `references/core-rules.md` and `references/structural-pass.md`. Tier-2,
wave 2.

## Honest framing — read this before trusting anything below

**No dedicated Dutch humanizer repo exists anywhere in the survey**, checked across
all three of the field's naming vocabularies (humanize*, avoid/remove-ai-writing*,
slop/de-slop*) — confirmed as a genuine zero, not a gap in searching. Every other
language file in this engine is grounded in at least one real, independently-authored
pattern catalog; this one is not. What follows is extrapolated from three things: the
patterns documented as cross-linguistically real across the other 19 languages here
(negative parallelism, empty time-framing, significance inflation, chatbot residue,
rule-of-three, generic conclusions all recur independently in language after
language, which is reasonable evidence they generalize), general typological
knowledge of Dutch, and contrastive knowledge of where Dutch AI output tends to
calque from English. **Treat this file as a first-draft hypothesis, not a validated
catalog** — it has not been checked against a real corpus of Dutch AI text or
reviewed by a native speaker, and per the roadmap's own risk note, it should not be
relied on with the same confidence as a language file built from a real source
repo. Flag any user-facing claim of confidence in Dutch output accordingly, and treat
a second opinion (native speaker, or a future real repo) as a priority upgrade for
this file specifically, above the other tier-2 languages.

## Vocabulary and phrasing (extrapolated, unvalidated)

**Empty time-framing**: "In de wereld van vandaag," "In het huidige tijdperk," "In
dit digitale tijdperk," "Vandaag de dag meer dan ooit" — the same pattern documented
in nearly every other language file here; likely generalizes, but unconfirmed for
Dutch specifically.

**Significance inflation**: "speelt een cruciale/belangrijke rol," "vormt een
hoeksteen van," "markeert een keerpunt," "baanbrekend," "revolutionair,"
"transformatief," "naadloos" (a probable direct calque of "seamless" — worth checking
whether it occurs at elevated frequency versus ordinary Dutch usage), "robuust" used
metaphorically for anything solid or reliable.

**Throat-clearing openers**: "Het is belangrijk op te merken dat," "Het mag duidelijk
zijn dat," "Laten we eens kijken naar," "Voordat we verdergaan" — cut and start with
the actual content.

**Negative parallelism**: "Niet alleen X, maar ook Y" — a construction that exists
natively in Dutch, so a single instance is not a tell; density is. Watch specifically
for it appearing more than once per few paragraphs.

**Marketing/infobiz language**: "ontgrendel je potentieel," "naar een hoger niveau
tillen," "een gamechanger," "de lat hoger leggen," "impact maken" (a probable English
calque — "impact hebben" or a concrete verb is more native), "een game-changing
oplossing."

**Vague attribution**: "experts zijn het erover eens," "onderzoek toont aan,"
"volgens verschillende bronnen" with nothing named — name the actual source or drop
the claim.

**Generic conclusions**: "Kortom," "Samengevat," "Al met al," "Concluderend kunnen we
stellen dat" opening a closing paragraph with no new content — the Dutch shape of the
same tell documented everywhere else in this engine.

**Chatbot residue**: "Wat een goede vraag!," "Uiteraard!," "Ik hoop dat dit helpt,"
"Laat het me weten als je nog vragen hebt," "Als AI-taalmodel" — remove without
exception if any survive into delivered text.

## Formality and register — a likely Dutch-specific pressure point

Dutch has a real formality axis (je/jij vs. u) and a set of modal particles (toch,
wel, even, maar, hoor, eigenlijk) that carry tone and nuance with no direct English
equivalent — their near-total absence is a plausible Dutch-specific AI tell, similar
in kind to German's documented Modalpartikeln gap, though this specific claim is
unverified for Dutch and should be checked against real examples before being
treated as established. **Register consistency**: pick je/jij or u for the whole
piece and hold it — switching mid-text is a tell in either direction. **Diminutives**
(-je/-tje/-pje) are a normal, frequent feature of casual and even professional Dutch;
their complete absence in an otherwise casual-register text is worth a second look,
though forcing them in artificially would be its own, worse tell.

## Formatting and punctuation (lower-confidence — genuinely needs native verification)

Standard Dutch typewriting doesn't reach for the em dash the way English marketing
copy does; a long dash used repeatedly as a dramatic pause is plausibly a tell here
too, on the same logic as several other European languages in this catalog, but this
specific claim about Dutch dash frequency is unverified. Dutch quotation convention
uses „…" (low-opening) in some traditions and "…" in others depending on style guide
and era — check the house style rather than assuming one is universally correct.
**Tussen-n spelling** (the linking -n in compounds like pannenkoek, bessensap) is a
genuinely tricky rule that non-native writers and machine output both get wrong at
elevated rates — an inconsistent or incorrect tussen-n across a document is worth
flagging as a possible-non-native-origin signal, though this is inference from the
rule's general difficulty, not a measured finding.

## What NOT to flag

A single "niet alleen X, maar ook Y" in an otherwise natural text; formal "u" address
in a genuinely formal genre (business letter, legal, government correspondence);
diminutives used naturally and sparingly; "naadloos," "robuust," or similar loanwords
used precisely and literally rather than as vague filler.

### Opener rotation and pre-flight carve-out (provisional — whole file unvalidated)

Conjunction openers: En, Maar, Dus, Want, Toch. Dutch directness extends to
openers: do not soften a blunt opener into a hedged one — that reads foreign.
je/jij-normal vs u-formal mismatch fails before rhythm does. Pre-flight
carve-out: none confirmed; native review may add (or correct) any row here.

## Worked example (illustrative only — untested against real Dutch AI output)

**Before:**
> In de wereld van vandaag speelt digitale transformatie een cruciale rol voor elk
> bedrijf. Het is niet alleen een technische verandering, maar ook een culturele
> verschuiving. Kortom, bedrijven die zich niet aanpassen, lopen het risico achter te
> blijven.

**After:**
> Digitale verandering verandert hoe een team werkt, maar hoe dat uitpakt verschilt
> sterk per bedrijf.
> *(De brontekst zegt "verhoogt de efficiëntie" en "verlaagt de kosten" zonder één
> cijfer; voor extern gebruik zijn echte getallen nodig. Er is hier niets verzonnen.)*

**Changes:** the empty time-framing opener and significance inflation ("speelt een
cruciale rol") were cut; the negative-parallelism sentence and the generic warning
conclusion ("Kortom... lopen het risico achter te blijven") were removed. The draft
contains no concrete outcome, so the missing numbers are flagged rather than filled
in — an earlier version of this example invented "vijf losse tools" and "een dag per
week", which the fact-lock forbids.

## Sources

None. No dedicated Dutch humanizer repo was found under any of the three naming
vocabularies searched. This file draws only on cross-linguistic patterns documented
independently across the other 19 languages in this engine and on general Dutch
linguistic knowledge — it is the weakest-grounded file in the catalog and should be
the first candidate for replacement if a real Dutch-specific source repo or native
reviewer becomes available.
